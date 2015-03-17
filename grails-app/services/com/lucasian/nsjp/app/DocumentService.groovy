package com.lucasian.nsjp.app

import grails.transaction.Transactional

@Transactional
class DocumentService {
    RepositoryService repositoryService
    private static final String expedienteRoot = "/expedientes/"
    
    private static final List<String> defaultStrucuture = [
        "/fotografias",
        "/media filiacion",
        "/documentos",
        "/oficios/"
    ]
    private static final List<String> defaultStrucutureIph = [
        "/evidencia",
        "/documentoIph",
        "/oficios/"
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
}
