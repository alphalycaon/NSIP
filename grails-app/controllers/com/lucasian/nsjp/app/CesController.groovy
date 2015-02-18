package com.lucasian.nsjp.app

import org.springframework.web.multipart.MultipartFile
import org.apache.commons.io.FileUtils
class CesController {
    def grailsApplication
    def iph() { }
    def guardarIph(){          
        ExpedienteIph expedienteIph = new ExpedienteIph();
        expedienteIph.numeroIph = 'IPH/FG/XX/PGU/2015/BB-'
        expedienteIph.save()     
        expedienteIph.numeroIph = 'IPH/FG/XX/PGU/2015/BB-'+expedienteIph.id
        expedienteIph.save()
        try{
            File srcDir = new File(''+grailsApplication.config.grails.images.temp+'/'+session.id)
            File destDir = new File(''+grailsApplication.config.grails.images.expedientes+"/"+expedienteIph.numeroIph)
            FileUtils.copyDirectory(srcDir, destDir)
        }catch(Exception e){
            println(e)
        }
        [expedienteIph: expedienteIph]
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
