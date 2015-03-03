package com.lucasian.nsjp.app

import org.docx4j.openpackaging.packages.WordprocessingMLPackage

import org.springframework.web.multipart.MultipartFile
import java.text.SimpleDateFormat
import org.apache.commons.io.FileUtils
class CesController {
    def grailsApplication
    def iph() { }
    def guardarIph(Iph iph){          
        iph.save()
        ExpedienteIph expedienteIph = new ExpedienteIph(iph: iph);
        iph.expedienteIph = expedienteIph
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
 
    def plantillaIPH = {
      WordprocessingMLPackage wordMLPackage = WordprocessingMLPackage.createPackage()
      def mainPart = wordMLPackage.getMainDocumentPart()
      SimpleDateFormat format1 = new SimpleDateFormat("dd/MM/yyyy")
      SimpleDateFormat format2 = new SimpleDateFormat("hh:mm:ss a")

      // create some styled heading...
      mainPart.addStyledParagraphOfText("Heading1", "INFORME POLICIAL HOMOLOGADO")
      mainPart.addStyledParagraphOfText("Heading3", "Datos Generales")
      mainPart.addStyledParagraphOfText("Normal", "Fecha del evento: " + format1.format(Calendar.getInstance().getTime()).toString() + "                                   Hora del evento: " + format2.format(Calendar.getInstance().getTime()).toString())
      mainPart.addStyledParagraphOfText("Normal", "Asunto: " + params.datosIph.asunto)
      mainPart.addStyledParagraphOfText("Normal", "Participación: " + params.datosIph.participacion + "                    Operativo: " + params.datosIph.operativo)
      mainPart.addStyledParagraphOfText("Normal", "Ubicación: " + params.datosIph.ubicacion)
      mainPart.addStyledParagraphOfText("Normal", "Descripción de los hechos: \n\
                                                    \n\
                                                    \n\
                                                    \n\
                                                    \n\
                                                    \n\
                                                    \n\
                                                    \n\
                                                    \n\
                                                    \n\
                                                    \n\
                                                    \n\
                                                    ")
        
      mainPart.addStyledParagraphOfText("Heading3", "Victima Involucrada")
      mainPart.addStyledParagraphOfText("Normal", "Apellido Paterno: " + params.victimaIph.apellidoPaterno + "             Apellido Materno: " + params.victimaIph.apellidoMaterno + "            Nombre(s): " + params.victimaIph.nombre)
      mainPart.addStyledParagraphOfText("Normal", "Edad: " + params.victimaIph.edad + "                  Sexo: "+ params.victimaIph.sexo)
      
      mainPart.addStyledParagraphOfText("Heading3", "Probable Responsable Involucrado")
      mainPart.addStyledParagraphOfText("Normal", "Apellido Paterno: " + params.imputadoIph.apellidoPaterno + "             Apellido Materno: " + params.imputadoIph.apellidoMaterno + "            Nombre(s): " + params.imputadoIph.nombre)
      mainPart.addStyledParagraphOfText("Normal", "Edad: " + params.imputadoIph.edad + "                  Sexo: "+ params.imputadoIph.sexo)
      mainPart.addStyledParagraphOfText("Normal", "Probables delitos o faltas administrativas: " + params.imputadoIph.delito)
      
      mainPart.addStyledParagraphOfText("Heading3", "Medios de transporte Involucrados")
      mainPart.addStyledParagraphOfText("Normal", "Tipo:   Terrestre[ ]      Matítimo[ ]     Aéreo[ ]          Especifíque: ")
      mainPart.addStyledParagraphOfText("Normal", "Asegurado[ ]       Relacionado[ ]      Revisado[ ]      Involurado[ ]       Recuperado:  Con Detenido[ ]      Sin Detenido[ ]")
      mainPart.addStyledParagraphOfText("Normal", "Marca:                          Submarca:                   Modelo/Año: ")
      mainPart.addStyledParagraphOfText("Normal", "Placa/Matrícula:            Color:              Número de motor:          Serie: ")
      mainPart.addStyledParagraphOfText("Normal", "Procedencia:                    Uso:                        Cantidad de pasajeros: ")
      mainPart.addStyledParagraphOfText("Normal", "Capacidad de carga/Tipo de carga:                           Origen: ")
      mainPart.addStyledParagraphOfText("Normal", "Destino:                                                    Empresa: ")
      mainPart.addStyledParagraphOfText("Normal", "Observaciones: ")
      
      mainPart.addStyledParagraphOfText("Heading3", "Drogas Involucradas")
      mainPart.addStyledParagraphOfText("Normal", "Tipo:                       Unidad de medida:                   Cantidad: ")
      
      mainPart.addStyledParagraphOfText("Heading3", "Armas Involucradas")
      mainPart.addStyledParagraphOfText("Normal", "Tipo:  Corta[ ]     Larga[ ]     Blanca[ ]          Descripción del arma: ")
      mainPart.addStyledParagraphOfText("Normal", "Marca:                          Tipo:                       Calibre: ")
      mainPart.addStyledParagraphOfText("Normal", "Matrícula:                      Serie:                      Inventario: ")
      mainPart.addStyledParagraphOfText("Heading4", "Cargador/Cartuchos")
      mainPart.addStyledParagraphOfText("Normal", "No. de cartuchos/municiones:                      Cartuchos:  Útiles:           Percutidos:         No. Cargadoress: ")
        
      /* Add our list of Expedientes to the document
      Expediente.list().each { Expediente ->
        mainPart.addParagraphOfText(Expediente.numeroExpediente)
      }*/

      // write out our word doc to disk
      File file = File.createTempFile("wordexport-", ".docx")
      wordMLPackage.save file

      // and send it all back to the browser
      response.setHeader("Content-disposition", "attachment; filename=PlantillaIPH.docx");
      response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document")
      response.outputStream << file.readBytes()
      file.delete()

    }
}
