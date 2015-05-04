package com.lucasian.nsjp.app

import org.docx4j.openpackaging.packages.WordprocessingMLPackage

import org.springframework.web.multipart.MultipartFile
import java.text.SimpleDateFormat
import org.apache.commons.io.FileUtils
import org.apache.shiro.SecurityUtils
class MinisterioController {
    def grailsApplication   
    def valida()
    {
       // Expediente
        //Delito delito = new Delito()
        
        /*
        def clasificacionDelito
clasificacionDelito.nombre='venta de drogas'
clasificacionDelito.modalidad='en sitio'
clasificacionDelito.modus='infraganti'
victima.nombre='Bartolome Higuera'
victima.genero='Femenino'
victima.edad='34'
victima.estadoCivil='Soltero'
victima.escolaridad='Primaria'
denunciante.nombre='Carlos Escobar'
denunciante.genero='Femenino'
denunciante.edad='44'
denunciante.estadoCivil='Casado'
denunciante.escolaridad='Primaria'
imputado.nombre='Hermenegildo Morales'
imputado.genero='Femenino'
imputado.edad='55'
imputado.estadoCivil='Soltero'
imputado.escolaridad='Licenciatura'
numeroExpediente='COA-FG-XX-PGU-2014-AA-'
*/
        
    }
    def denuncia() { 
        [expedientesIph: ExpedienteIph.list()]
    }
    def documentService
    def guardarDenuncia(Delito delito){       
        def userName  = SecurityUtils.subject?.principal
        int userId = User.findByUsername(userName).getId()
        //delito.expediente=null
        delito.save()
        Expediente expediente = new Expediente(delito: delito);
        delito.expediente = expediente        
        expediente.numeroExpediente = params.numeroExpediente //'COA/FG/XX/PGU/2014/AA-'
        expediente.createdBy = userName
        
        expediente.save()
        //Bloque que sirve para en caso de que no se modifique el numero de Expediente le agrega el id del mismo para que se lleve un consecutivo
        if((params.numeroExpediente.substring((params.numeroExpediente.length()-1), (params.numeroExpediente.length()))).equals("-")){
            expediente.numeroExpediente = params.numeroExpediente+expediente.id
            expediente.save()  
        }
        /*try{
            File srcDir = new File(''+grailsApplication.config.grails.images.temp+'/'+session.id)
            File destDir = new File('/opt/apache-tomcat/apache-tomcat-7.0.42/webapps/comparte/Denuncias/'+expediente.numeroExpediente)
            FileUtils.copyDirectory(srcDir, destDir)
        }catch(Exception e){
            println(e)
        }    */      
        UsuariosExpedientes usuexp = new UsuariosExpedientes();
        usuexp.usuarioId = userId
        usuexp.expedienteId = expediente.id
        usuexp.save()
        
        //[expediente: expediente]
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
 
    def exportWord = {
      WordprocessingMLPackage wordMLPackage = WordprocessingMLPackage.createPackage()
      def mainPart = wordMLPackage.getMainDocumentPart()
      SimpleDateFormat format1 = new SimpleDateFormat("dd/MM/yyyy")
      SimpleDateFormat format2 = new SimpleDateFormat("hh:mm:ss a")

      // create some styled heading...
      mainPart.addStyledParagraphOfText("Heading1", "ACTA DE DENUNCIA O QUERELLA")
      mainPart.addStyledParagraphOfText("Heading3", "DATOS GENERALES DE LA DENUNCIA")
      mainPart.addStyledParagraphOfText("Normal", "Número de denuncia: " + params.numeroExpediente + "                                             Fecha: " + format1.format(Calendar.getInstance().getTime()).toString())
      mainPart.addStyledParagraphOfText("Normal", "Número del IPH vinculado: " + params.textoIph + "                                               Hora: " + format2.format(Calendar.getInstance().getTime()).toString())
      mainPart.addStyledParagraphOfText("Normal", "Agencia: ")
      mainPart.addStyledParagraphOfText("Normal", "Nombre Delito: " + params.clasificacionDelito.nombre)
      mainPart.addStyledParagraphOfText("Normal", "Modalidad del Delito: " + params.clasificacionDelito.modalidad)
      mainPart.addStyledParagraphOfText("Normal", "Modus del Delito: " + params.clasificacionDelito.modus)
      mainPart.addStyledParagraphOfText("Heading3", "IDIOMA DEL  DENUNCIANTE  O  QUERELLANTE")
      mainPart.addStyledParagraphOfText("Normal", "Habla español: Si[ ]   No[ ]")
      mainPart.addStyledParagraphOfText("Normal", "En caso negativo especificar idioma o lengua: ")
      mainPart.addStyledParagraphOfText("Normal", "Nombre del intérprete: ")
      mainPart.addStyledParagraphOfText("Heading3", "\nDATOS GENERALES DEL  DENUNCIANTE  O  QUERELLANTE")
      mainPart.addStyledParagraphOfText("Normal", "Nombre: " + params.victima.nombre)
      mainPart.addStyledParagraphOfText("Normal", "Documento de identificación (especificar): ")
      mainPart.addStyledParagraphOfText("Normal", "Sexo: " + params.victima.genero)
      mainPart.addStyledParagraphOfText("Normal", "Edad referida: " + params.victima.edad + "                       Fecha nacimiento: ")
      mainPart.addStyledParagraphOfText("Normal", "Nacionalidad: ")
      mainPart.addStyledParagraphOfText("Normal", "Dirección: ")
      mainPart.addStyledParagraphOfText("Normal", "Teléfono(s):                             Correo electrónico: ")
      mainPart.addStyledParagraphOfText("Normal", "Religión:                                Pertenece a algún grupo étnico: Si[ ]   No[ ]")
      mainPart.addStyledParagraphOfText("Normal", "Estado civil: " + params.victima.estadoCivil + "                 Ocupación: ")
      mainPart.addStyledParagraphOfText("Normal", "Escolaridad: " + params.victima.escolaridad)
      mainPart.addStyledParagraphOfText("Normal", "¿Tiene alguna relación con el imputado? Si[ ]    No [ ]")
      mainPart.addStyledParagraphOfText("Normal", "En caso afirmativo especificar qué tipo de relación: ")
      mainPart.addStyledParagraphOfText("Normal", "*¿Se omiten datos generales del denunciante o querellante por tratarse de denuncia anónima? Si[ ]  No[ ]")
      mainPart.addStyledParagraphOfText("Heading3", "\nDATOS GENERALES DEL IMPUTADO O PRESUNTO RESPONSABLE")
      mainPart.addStyledParagraphOfText("Normal", "Nombre: " + params.imputado.nombre)
      mainPart.addStyledParagraphOfText("Normal", "Documento de identificación (especificar): ")
      mainPart.addStyledParagraphOfText("Normal", "Sexo: " + params.imputado.genero)
      mainPart.addStyledParagraphOfText("Normal", "Edad referida: " + params.imputado.edad + "                       Fecha nacimiento: ")
      mainPart.addStyledParagraphOfText("Normal", "Nacionalidad: ")
      mainPart.addStyledParagraphOfText("Normal", "Dirección: ")
      mainPart.addStyledParagraphOfText("Normal", "Teléfono(s):                             Correo electrónico: ")
      mainPart.addStyledParagraphOfText("Normal", "Religión:                                Pertenece a algún grupo étnico: Si[ ]   No[ ]")
      mainPart.addStyledParagraphOfText("Normal", "Estado civil: " + params.imputado.estadoCivil + "                 Ocupación: ")
      mainPart.addStyledParagraphOfText("Normal", "Escolaridad: " + params.imputado.escolaridad)
      mainPart.addStyledParagraphOfText("Heading3", "\nRELATO DE LOS HECHOS VERTIDO POR EL DENUNCIANTE O QUERELLANTE")
      mainPart.addStyledParagraphOfText("Normal", "")

      /* Add our list of Expedientes to the document
      Expediente.list().each { Expediente ->
        mainPart.addParagraphOfText(Expediente.numeroExpediente)
      }*/

      // write out our word doc to disk
      File file = File.createTempFile("wordexport-", ".docx")
      wordMLPackage.save file

      // and send it all back to the browser
      response.setHeader("Content-disposition", "attachment; filename=PlantillaDenuncia.docx");
      response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document")
      response.outputStream << file.readBytes()
      file.delete()

    }
    
    
}
