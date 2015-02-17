package com.lucasian.nsjp.app

import grails.transaction.Transactional
import javax.jcr.*
import javax.jcr.nodetype.*
import javax.jcr.query.*
import javax.jcr.version.*
import javax.annotation.*
import org.apache.jackrabbit.oak.*
import org.apache.jackrabbit.oak.jcr.*
import com.mongodb.DB
import com.mongodb.MongoClient
import org.apache.jackrabbit.oak.plugins.document.DocumentNodeStore
import org.apache.jackrabbit.oak.plugins.document.DocumentMK

@Transactional
class RepositoryService {

    Repository repository = null
    String repositoryName = null
    boolean lazyInit = false

    @PostConstruct
    void init() {

        println("STARTING RESPOSITORY")
        try {
            DB db = new MongoClient("127.0.0.1", 27017).getDB("nsip");
            DocumentNodeStore ns = new DocumentMK.Builder().
                    setMongoDB(db).getNodeStore();
            repository = new Jcr(new Oak(ns)).createRepository();

        } catch (Throwable e) {
            e.printStackTrace();
            println("CREATING IN MEMORY REPOSITORY")
            repository = new Jcr(new Oak()).createRepository();

        }
    }

    def storeNode(RepositoryCommand documento){
        Session session = null;
        try {

            session = repository.login( new SimpleCredentials("admin", "admin".toCharArray()));
            Node documentRoot = session.getRootNode();
            String[] folders = documento.ruta.split("/");
            for(String folder: folders){
                if(documentRoot.hasNode(folder)){
                    documentRoot = documentRoot.getNode(folder);
                }else{
                    documentRoot = documentRoot.addNode(folder, "nt:folder");
                }
            }
            // Create an 'nt:file' node at the supplied path ...
            Node fileNode= null;
            if(documentRoot.hasNode(documento.nombre)){
                fileNode = documentRoot.getNode(documento.nombre);
                fileNode.checkout();
                if(documento.propiedades){
                    documento.propiedades.each{ k, v ->
                        fileNode.setProperty(k,v);
                    }
                }
                Node contentNode = fileNode.getNode("jcr:content");
                Binary binary = session.getValueFactory().createBinary(documento.binario);
                contentNode.setProperty("jcr:data", binary);
                contentNode.setProperty("jcr:mimeType", documento.mime);
                session.save();
                fileNode.checkin();
                return fileNode.getPath()
            }else{
                fileNode = documentRoot.addNode(documento.nombre,"nt:file");
                /*if(documento.tipo){
                    fileNode.addMixin(documento.tipo);
                }*/
                fileNode.addMixin("mix:versionable");
                if(documento.propiedades){
                    documento.propiedades.each{ k, v ->
                        fileNode.setProperty(k,v);
                    }
                }
                /*
                if(!documento.userId){
                    //Usuario usuario = (Usuario)SecurityUtils.getSubject().getPrincipal();
                    //fileNode.setProperty("userId", usuario.id)
                }else{
                    fileNode.setProperty("userId", documento.userId)
                }*/
                Node contentNode = fileNode.addNode("jcr:content", "nt:resource");

                Binary binary = session.getValueFactory().createBinary(documento.binario);
                contentNode.setProperty("jcr:data", binary);
                contentNode.setProperty("jcr:mimeType", documento.mime);
                session.save();
                fileNode.checkout();
                fileNode.checkin();
                session.save();
                return fileNode.getPath()
            }

        }catch(Exception e){
            e.printStackTrace()
            throw new RuntimeException(e)
        } finally {
            if (session != null) session.logout();
        }
    }
    def listItemsInPath(String path){

        String queryText = "SELECT * FROM [nt:base] WHERE ISCHILDNODE([" + path + "]) ";
        query(queryText);
    }
    def listFilesInPath(String path){
        String queryText = "SELECT * FROM [nt:file] WHERE PATH() = '" + path + "'";
        query(queryText);
    }
    def query(String queryText){
        Session session = null;
        try {
            session = repository.login( new SimpleCredentials("admin", "admin".toCharArray()));
            def items = []

            QueryManager queryManager = session.getWorkspace().getQueryManager();
            Query query = queryManager.createQuery(queryText, "JCR-SQL2");
            QueryResult result = query.execute();
            NodeIterator it = result.getNodes();
            while (it.hasNext()) {
                Node node = it.nextNode();
                def tipos = "";
                for (NodeType tipo : node.getMixinNodeTypes()) {
                    tipos += tipo.getName()+","
                }
                if(node.getPrimaryNodeType().toString().equals("nt:file")){
                    VersionIterator i = node.getVersionHistory().getAllVersions();
                    i.skip(1); // important, otherwise the currentNode will fail to read the 'title' property
                    while (i.hasNext()) {
                        def RepositoryCommand documento = new RepositoryCommand(
                                nombre:node.getName(),
                                id: node.getIdentifier(),
                                ruta: node.getPath(),
                                tipo: tipos,
                                mime:node.getNode("jcr:content").getProperty("jcr:mimeType").getString()

                        );
                        Version v = i.nextVersion();
                        NodeIterator nodeIterator = v.getNodes();
                        while (nodeIterator.hasNext()) {
                            def propiedades = [:]
                            Node currentNode = nodeIterator.nextNode();
                            for (PropertyIterator pi = currentNode.getProperties(); pi.hasNext(); ) {
                                Property p = pi.nextProperty();
                                if(!p.getName().contains(":")){
                                    int type = p.getValue().getType();
                                    switch (type) {
                                        case PropertyType.STRING:
                                            propiedades[p.getName()] = p.getValue().getString();
                                            break;
                                        case PropertyType.LONG:
                                            propiedades[p.getName()] = p.getValue().getLong();
                                            break;
                                        case PropertyType.DOUBLE:
                                            propiedades[p.getName()] = p.getValue().getDouble();
                                            break;
                                        case PropertyType.BOOLEAN:
                                            propiedades[p.getName()] = p.getValue().getBoolean();
                                            break;
                                        case PropertyType.DATE:
                                            propiedades[p.getName()] = p.getValue().getDate();
                                    }

                                }
                            }
                            documento.mime = currentNode.getNode("jcr:content").getProperty("jcr:mimeType").getString();
                            documento.version = v.getName();
                            documento.propiedades = propiedades
                            //printTree(currentNode);
                        }
                        items<<documento;
                    }
                }else{
                    def RepositoryCommand documento = new RepositoryCommand(
                            nombre:node.getName(),
                            id: node.getIdentifier(),
                            ruta: node.getPath()
                    );
                    documento.mime ="folder"
                    documento.version = "1"
                    items<<documento;
                }

            }
            return items;

        }catch(Exception e){
            e.printStackTrace()
        } finally {
            if (session != null) session.logout();
        }
    }
    def getVersionContent(String path, String version){
        Session session = null;
        try{

            String queryText = "select * from [nt:file] where [jcr:path] = '"+path+"'";
            session = repository.login( new SimpleCredentials("admin", "admin".toCharArray()));
            def items = []
            QueryManager queryManager = session.getWorkspace().getQueryManager();
            Query query = queryManager.createQuery(queryText, "JCR-SQL2");
            QueryResult result = query.execute();
            NodeIterator it = result.getNodes();
            Node node = it.nextNode();
            Node contentNode = null
            hasPermissions(node)
            if(version != null){
                VersionIterator i = node.getVersionHistory().getAllVersions();
                //printTree(node.getVersionHistory().getRootVersion().getNodes().nextNode());
                while (i.hasNext()) {
                    Version v = i.nextVersion();
                    if(v.getName().toString().equals(version)){
                        NodeIterator nodeIterator = v.getNodes();
                        Node currentNode = nodeIterator.nextNode();
                        contentNode = currentNode.getNode("jcr:content");
                    }
                }
            }else{
                Version v = null;
                while (i.hasNext()) {
                    v = i.nextVersion();
                }
                NodeIterator nodeIterator = v.getNodes();
                Node currentNode = nodeIterator.nextNode();
                contentNode = currentNode.getNode("jcr:content");

            }
            [
                    stream: contentNode.getProperty("jcr:data").getBinary().getStream(),
                    mime: contentNode.getProperty("jcr:mimeType").getString()
            ];
        }catch(Exception e){
            e.printStackTrace()
        } finally {
            if (session != null) session.logout();
        }
    }
    @PreDestroy
    void shutDown(){
        try {
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    def printTree(Node node){
        printNode(node);
        if(node.hasNodes()){
            NodeIterator iter = node.getNodes();
            while (iter.hasNext()) {
                printTree(iter.nextNode());
            }
        }
    }
    def printNode(Node node){
        System.out.println(node);
    }
    def printVersions(Node node){
        try{
            VersionIterator i = node.getVersionHistory().getAllVersions();
            System.out.println("VERSIONESS:::::::::::");
            //i.skip(1); // important, otherwise the currentNode will fail to read the 'title' property
            while (i.hasNext()) {
                System.out.println("_____________________________");
                System.out.println("_____________________________");
                System.out.println("_____________________________");
                System.out.println("_____________________________");
                Version v = i.nextVersion();
                NodeIterator nodeIterator = v.getNodes();
                while (nodeIterator.hasNext()) {
                    Node currentNode = nodeIterator.nextNode();
                    printTree(currentNode);
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
    }
    def hasPermissions(Node nodo){
        /*def logged = empleadoService.getCurrentUser()
        if(!logged.administrador){
            if(nodo.getProperty("userId").getLong() != logged.usuario.id){
                throw new AuthorizationException()
            }
        }*/
    }
}
