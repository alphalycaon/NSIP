package com.lucasian.nsjp.app
import grails.converters.*
import org.apache.commons.io.FileUtils

class DocumentsController {
    def documentService
    def grailsApplication
    
        
    def iconMap = [
        "image/jpeg":"fa-file-image-o",
        "image/png": "fa-file-image-o",
        "application/pdf": "fa-file-pdf-o",
        "application/msword": "fa-file-word-o",
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document": "fa-file-word-o",
        "application/vnd.ms-excel": "fa-file-excel-o",
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet":"fa-file-excel-o",
        "folder": "fa-folder-o"
    ]
    def defaultIcon = "fa-file-o"
    def items(){      
        def results = documentService.getFiles(params.numeroExpediente, params.path)
        results.items.each{
            if(iconMap[it.mime]){
                it.icon = iconMap[it.mime]
            }else{
                it.icon = defaultIcon
            }            
        }
        render results as JSON
    }
    
    def search(){
        def filters = [:]
        if(params.tipo){
            filters["tipo"] = params.tipo
        }
        if(params.tag){
            filters["tag"] = params.tag
        }
        def results = documentService.search(params.numeroExpediente, filters)
        results.items.each{
            if(iconMap[it.mime]){
                it.icon = iconMap[it.mime]
            }else{
                it.icon = defaultIcon
            }            
        }
        render results as JSON
    }
    def file(){
        def file = documentService.getFile(params.numeroExpediente, params.path)
        if(file){
            render file: file.stream, contentType: file.mime
        }else{
            render(status: 404, text: 'not found')
        }
        
    }
    def upload(FileUploadCommand command){
        if(!command.file.empty){         
            def id
            if(params.folder){
                id= params.folder
            }else{
                id = params.id
            }
            
            def storagePath = ''+grailsApplication.config.grails.images.temp+'/'+session.id+'/'+id
            def storagePathDirectory = new File(storagePath)
            if (!storagePathDirectory.exists()) {
                print "CREATING DIRECTORY "+storagePath
                if (storagePathDirectory.mkdirs()) {
                    println "SUCCESS"
                } else {
                    println "FAILED"
                }
            }
            def archivo = new File(storagePath+"/"+command.file.originalFilename)                
            def pendingFiles = session["pendingFiles"]
            if(!pendingFiles){
                pendingFiles = []
            }
            RepositoryCommand document = new RepositoryCommand(
                ruta : id,
                nombre : command.file.originalFilename,
                mime: command.file.getContentType()                
            )
            if(command.tags){
                document.propiedades = ["nsip:tags":command.tags]
            }
            pendingFiles << document
            println("params.id:;"+id)
            println(pendingFiles)
            session["pendingFiles"]= pendingFiles                
            command.file.transferTo(archivo)            
        }
        render ""
    }
    def assign(String expediente){
        String srcDir = ''+grailsApplication.config.grails.images.temp+'/'+session.id
        def pendingFiles =  session["pendingFiles"]
        pendingFiles.each{
            it.binario = FileUtils.openInputStream(new File(srcDir+"/"+it.ruta+"/"+it.nombre))
            documentService.saveFile(expediente, it.ruta, it)
        }
        session["pendingFiles"] = []
        render ""
    }
    def createFolder(String expediente, String path){        
        documentService.createFolder(expediente, path)
        render ""
    }
}
