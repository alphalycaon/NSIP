package com.lucasian.nsjp.app

import org.springframework.web.multipart.MultipartFile
import org.apache.commons.io.FileUtils
class MinisterioController {
    def grailsApplication
    def documentService
    def denuncia() { }
    def guardarDenuncia(Delito delito){                
        delito.save()
        Expediente expediente = new Expediente(delito: delito);
        delito.expediente = expediente        
        expediente.numeroExpediente = 'COA-FG-XX-PGU-2014-AA-'
        expediente.save()                
        expediente.numeroExpediente = 'COA-FG-XX-PGU-2014-AA-'+expediente.id
        expediente.save()
        documentService.createStructure(expediente.numeroExpediente)
        render(view: 'archivos', model:[expediente: expediente])
    }
    def subirArchivo(FileUploadCommand command){
        if(!command.file.empty){            
            try{
                def storagePath = ''+grailsApplication.config.grails.images.temp+'/'+session.id+'/'+params.id
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
                    ruta : params.id,
                    nombre : command.file.originalFilename,
                    mime: command.file.getContentType()
                )
                pendingFiles << document
                println("params.id:;"+params.id)
                println(pendingFiles)
                session["pendingFiles"]= pendingFiles
                
                command.file.transferTo(archivo)
            }catch(Exception e){
                println(e)
            }                
        }
        render ""
    }
}
