package com.lucasian.nsjp.app
import grails.converters.*
import org.apache.commons.io.FileUtils

class DocumentsController {
    def documentService
    def grailsApplication
    def items(){
        params.numeroExpediente
        render documentService.getFiles(params.numeroExpediente, params.path) as JSON
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
