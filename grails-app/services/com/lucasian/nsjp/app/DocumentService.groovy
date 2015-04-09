package com.lucasian.nsjp.app

import grails.transaction.Transactional

@Transactional
class DocumentService {
    RepositoryService repositoryService
    private static final String expedienteRoot = "/expedientes/"
    
    private static final List<String> defaultStrucuture = [
        "/Material fotografico",
        "/Material documental",
        "/Documento de Denuncia",
        "/Otros"
    ]
    private static final List<String> defaultStrucutureIph = [
        "/Material fotografico",
        "/Material documental",
        "/Documento IPH",
        "/Otros"
    ]
    private static final List<String> defaultStrucutureIp = [
        "/Material fotografico",
        "/Material documental",
        "/Documento IPH",
        "/Otros"
    ]
    
    def typeQueries = [
        'pdf': "and [jcr:path] like '%.pdf'",
        'excel': "and ([jcr:path] like '%.xls' or [jcr:path] like '%.xlsx')",
        'doc': "and ([jcr:path] like '%.doc' or [jcr:path] like '%.docx')",
        'img': "and ([jcr:path] like '%.jpg' or [jcr:path] like '%.png')"
    ]
    def getFiles(String numeroExpediente, String path){
        def items = repositoryService.listItemsInPath(expedienteRoot+numeroExpediente+path)
        items.each{
            it.ruta = it.ruta.replace(expedienteRoot+numeroExpediente, "")
        }
        if(path.endsWith("/")){
            path = path.substring(0, path.length() - 1)
        }
        [items: items , path: path?:'/', padre:path.substring(0,path.lastIndexOf('/')+1)]
    } 
    def getFile(String numeroExpediente, String path, String version = "1.0"){
        repositoryService.getVersionContent(expedienteRoot+numeroExpediente+path, version)
    }  
    def saveFile(String numeroExpediente, String path , RepositoryCommand documento){
        if(!path.startsWith("/")){
            path = "/"+path
        }
        documento.ruta = expedienteRoot+numeroExpediente+path
        repositoryService.storeNode(documento)
    }
    
    def createFolder(String numeroExpediente, String path){        
        if(path){
            if(!path.startsWith("/")){
                path = "/"+path
            }
            path = expedienteRoot+numeroExpediente+path
            repositoryService.createFolder(path)
        }
    }
    
    def createStructure(String numeroExpediente, List<String> folders = null){
        if(!folders){
            folders = defaultStrucuture
        }
        folders.each(){
            String path = expedienteRoot+numeroExpediente+it
            repositoryService.createFolder(path)
        }
    }
    def createStructureIph(String numeroIph, List<String> folders = null){
        if(!folders){
            folders = defaultStrucutureIph
        }
        folders.each(){
            String path = expedienteRoot+numeroIph+it
            repositoryService.createFolder(path)
        }
    }
    def createStructureIp(String numeroIp, List<String> folders = null){
        if(!folders){
            folders = defaultStrucutureIp
        }
        folders.each(){
            String path = expedienteRoot+numeroIp+it
            repositoryService.createFolder(path)
        }
    }
    def searchImages(String numeroExpediente){
        def query = "SELECT * FROM [nt:file] WHERE [jcr:path] like '"+expedienteRoot+numeroExpediente+"%' and ([jcr:path] like '%.jpg' or [jcr:path] like '%.png')"
        println(query)
        def images = repositoryService.query(query)
        images.each{
            it.ruta = it.ruta.replace(expedienteRoot,"").replace(numeroExpediente, "") 
        }
        images
    }
    
    def search(String numeroExpediente, Map parametros){
        def query = "SELECT * FROM [nt:file] WHERE [jcr:path] like '"+expedienteRoot+numeroExpediente+"%'"
        if(parametros["tipo"]){
            query +=  typeQueries[parametros["tipo"]]
        } 
        if(parametros["tag"]){
            query += " and [nsip:tags] like '%"+parametros["tag"]+"%'"
        }
        println(query)
        def files = repositoryService.query(query)
        files.each{
            it.ruta = it.ruta.replace(expedienteRoot,"").replace(numeroExpediente, "") 
        }
        [items: files]
    }
}
