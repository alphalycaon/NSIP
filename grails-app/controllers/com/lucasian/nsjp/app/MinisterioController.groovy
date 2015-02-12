package com.lucasian.nsjp.app

import org.springframework.web.multipart.MultipartFile
import org.apache.commons.io.FileUtils
class MinisterioController {
    def grailsApplication
    def denuncia() { }
    def guardarDenuncia(Delito delito){                
        delito.save()
        Expediente expediente = new Expediente(delito: delito);
        delito.expediente = expediente        
        expediente.numeroExpediente = 'COA/FG/XX/PGU/2014/AA-'
        expediente.save()                
        expediente.numeroExpediente = 'COA/FG/XX/PGU/2014/AA-'+expediente.id
        expediente.save()
        try{
            File srcDir = new File(''+grailsApplication.config.grails.images.temp+'/'+session.id)
            File destDir = new File(''+grailsApplication.config.grails.images.expedientes+"/"+expediente.numeroExpediente)
            FileUtils.copyDirectory(srcDir, destDir)
        }catch(Exception e){
            println(e)
        }
        [expediente: expediente]
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
                println(archivo)
                command.file.transferTo(archivo)
            }catch(Exception e){
                println(e)
            }                
        }
        render ""
    }
}
