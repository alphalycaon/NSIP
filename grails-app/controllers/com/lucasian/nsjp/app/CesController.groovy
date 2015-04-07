package com.lucasian.nsjp.app

import org.docx4j.openpackaging.packages.WordprocessingMLPackage

import org.springframework.web.multipart.MultipartFile
import java.text.SimpleDateFormat
import org.apache.commons.io.FileUtils
import org.apache.shiro.SecurityUtils
class CesController {
    def grailsApplication
    def iph() { }
    def ip() { }
    def documentService
    def guardarIph(Iph iph){      
        def userName  = SecurityUtils.subject?.principal
        int userId = User.findByUsername(userName).getId()
        
        iph.save()
        ExpedienteIph expedienteIph = new ExpedienteIph(iph: iph);
        iph.expedienteIph = expedienteIph
        expedienteIph.numeroIph = 'IPH-FG-XX-PGU-2015-BB-'
        expedienteIph.save()     
        expedienteIph.numeroIph = 'IPH-FG-XX-PGU-2015-BB-'+expedienteIph.id
        expedienteIph.createdBy = userName
        expedienteIph.save()
        /*try{
            File srcDir = new File(''+grailsApplication.config.grails.images.temp+'/'+session.id)
            File destDir = new File(''+grailsApplication.config.grails.images.expedientes+"/"+expedienteIph.numeroIph)
            FileUtils.copyDirectory(srcDir, destDir)
        }catch(Exception e){
            println(e)
        }*/
        UsuariosExpedientesIph usuexp = new UsuariosExpedientesIph();
        usuexp.usuarioId = userId
        usuexp.expedienteIphId = expedienteIph.id
        usuexp.save()
        //[expedienteIph: expedienteIph]
        documentService.createStructureIph(expedienteIph.numeroIph)
        render(view: 'archivos', model:[expedienteIph: expedienteIph])
    }
    def guardarIp(Ip ip){      
        def userName  = SecurityUtils.subject?.principal
        int userId = User.findByUsername(userName).getId()
        
        ip.save()
        ExpedienteIp expedienteIp = new ExpedienteIp(ip: ip);
        ip.expedienteIp = expedienteIp
        expedienteIp.numeroIp = 'IP-FG-XX-PGU-2015-CC-'
        expedienteIp.save()     
        expedienteIp.numeroIp = 'IP-FG-XX-PGU-2015-CC-'+expedienteIp.id
        expedienteIp.createdBy = userName
        expedienteIp.save()
        /*try{
            File srcDir = new File(''+grailsApplication.config.grails.images.temp+'/'+session.id)
            File destDir = new File(''+grailsApplication.config.grails.images.expedientes+"/"+expedienteIph.numeroIph)
            FileUtils.copyDirectory(srcDir, destDir)
        }catch(Exception e){
            println(e)
        }*/
        UsuariosExpedientesIp usuexp = new UsuariosExpedientesIp();
        usuexp.usuarioId = userId
        usuexp.expedienteIpId = expedienteIp.id
        usuexp.save()
        //[expedienteIph: expedienteIph]
        documentService.createStructureIp(expedienteIp.numeroIp)
        render(view: 'archivosIp', model:[expedienteIp: expedienteIp])
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
