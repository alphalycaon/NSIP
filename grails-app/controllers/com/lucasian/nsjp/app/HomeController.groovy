package com.lucasian.nsjp.app

import org.docx4j.openpackaging.packages.WordprocessingMLPackage

import org.springframework.web.multipart.MultipartFile
import java.text.SimpleDateFormat
import org.apache.commons.io.FileUtils

import java.util.HashMap

import org.docx4j.XmlUtils
import org.docx4j.jaxb.Context
import org.docx4j.openpackaging.io.SaveToZipFile
import org.docx4j.openpackaging.packages.WordprocessingMLPackage
import org.docx4j.openpackaging.parts.WordprocessingML.MainDocumentPart
import org.docx4j.wml.Document
class HomeController {

    def index() { 
        [expedientes: Expediente.list(), expedientesIph: ExpedienteIph.list()]
    }
    def detail(){
        
    }
    def calendar(){
        
    }
    def mapa(){
        
    }
 
    def plantillaDenuncia = {
      WordprocessingMLPackage wordMLPackage = WordprocessingMLPackage.createPackage()
      def mainPart = wordMLPackage.getMainDocumentPart()
      SimpleDateFormat format1 = new SimpleDateFormat("dd/MM/yyyy")
      SimpleDateFormat format2 = new SimpleDateFormat("hh:mm:ss a")

      // create some styled heading...
      mainPart.addStyledParagraphOfText("Heading1", "ACTA DE DENUNCIA O QUERELLA")
      mainPart.addStyledParagraphOfText("Heading3", "DATOS GENERALES DE LA DENUNCIA")
      mainPart.addStyledParagraphOfText("Normal", "Número de denuncia:                                                                                         Fecha: " + format1.format(Calendar.getInstance().getTime()).toString())
      mainPart.addStyledParagraphOfText("Normal", "Número del IPH vinculado:                                                                                   Hora: " + format2.format(Calendar.getInstance().getTime()).toString())
      mainPart.addStyledParagraphOfText("Normal", "Agencia: ")
      mainPart.addStyledParagraphOfText("Normal", "Nombre Delito: ")
      mainPart.addStyledParagraphOfText("Normal", "Modalidad del Delito: ")
      mainPart.addStyledParagraphOfText("Normal", "Modus del Delito: ")
      mainPart.addStyledParagraphOfText("Heading3", "IDIOMA DEL  DENUNCIANTE  O  QUERELLANTE")
      mainPart.addStyledParagraphOfText("Normal", "Habla español: Si[ ]   No[ ]")
      mainPart.addStyledParagraphOfText("Normal", "En caso negativo especificar idioma o lengua: ")
      mainPart.addStyledParagraphOfText("Normal", "Nombre del intérprete: ")
      mainPart.addStyledParagraphOfText("Heading3", "\nDATOS GENERALES DEL  DENUNCIANTE  O  QUERELLANTE")
      mainPart.addStyledParagraphOfText("Normal", "Nombre: ")
      mainPart.addStyledParagraphOfText("Normal", "Documento de identificación (especificar): ")
      mainPart.addStyledParagraphOfText("Normal", "Sexo: ")
      mainPart.addStyledParagraphOfText("Normal", "Edad referida:                       Fecha nacimiento: ")
      mainPart.addStyledParagraphOfText("Normal", "Nacionalidad: ")
      mainPart.addStyledParagraphOfText("Normal", "Dirección: ")
      mainPart.addStyledParagraphOfText("Normal", "Teléfono(s):                             Correo electrónico: ")
      mainPart.addStyledParagraphOfText("Normal", "Religión:                                Pertenece a algún grupo étnico: Si[ ]   No[ ]")
      mainPart.addStyledParagraphOfText("Normal", "Estado civil:                            Ocupación: ")
      mainPart.addStyledParagraphOfText("Normal", "Escolaridad: ")
      mainPart.addStyledParagraphOfText("Normal", "¿Tiene alguna relación con el imputado? Si[ ]    No [ ]")
      mainPart.addStyledParagraphOfText("Normal", "En caso afirmativo especificar qué tipo de relación: ")
      mainPart.addStyledParagraphOfText("Normal", "*¿Se omiten datos generales del denunciante o querellante por tratarse de denuncia anónima? Si[ ]  No[ ]")
      mainPart.addStyledParagraphOfText("Heading3", "\nDATOS GENERALES DEL IMPUTADO O PRESUNTO RESPONSABLE")
      mainPart.addStyledParagraphOfText("Normal", "Nombre: ")
      mainPart.addStyledParagraphOfText("Normal", "Documento de identificación (especificar): ")
      mainPart.addStyledParagraphOfText("Normal", "Sexo: ")
      mainPart.addStyledParagraphOfText("Normal", "Edad referida:                       Fecha nacimiento: ")
      mainPart.addStyledParagraphOfText("Normal", "Nacionalidad: ")
      mainPart.addStyledParagraphOfText("Normal", "Dirección: ")
      mainPart.addStyledParagraphOfText("Normal", "Teléfono(s):                             Correo electrónico: ")
      mainPart.addStyledParagraphOfText("Normal", "Religión:                                Pertenece a algún grupo étnico: Si[ ]   No[ ]")
      mainPart.addStyledParagraphOfText("Normal", "Estado civil:                            Ocupación: ")
      mainPart.addStyledParagraphOfText("Normal", "Escolaridad: ")
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
 
    def plantillaIPH = {
      WordprocessingMLPackage wordMLPackage = WordprocessingMLPackage.createPackage()
      def mainPart = wordMLPackage.getMainDocumentPart()
      SimpleDateFormat format1 = new SimpleDateFormat("dd/MM/yyyy")
      SimpleDateFormat format2 = new SimpleDateFormat("hh:mm:ss a")

      // create some styled heading...
      mainPart.addStyledParagraphOfText("Heading1", "INFORME POLICIAL HOMOLOGADO")
      mainPart.addStyledParagraphOfText("Heading3", "Datos Generales")
      mainPart.addStyledParagraphOfText("Normal", "Fecha del evento: " + format1.format(Calendar.getInstance().getTime()).toString() + "                                   Hora del evento: " + format2.format(Calendar.getInstance().getTime()).toString())
      mainPart.addStyledParagraphOfText("Normal", "Asunto:")
      mainPart.addStyledParagraphOfText("Normal", "Participación:                                  Operativo: ")
      mainPart.addStyledParagraphOfText("Normal", "Ubicación: ")
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
      mainPart.addStyledParagraphOfText("Normal", "Apellido Paterno:                       Apellido Materno:                   Nombre(s): ")
      mainPart.addStyledParagraphOfText("Normal", "Edad:                           Sexo: ")
      
      mainPart.addStyledParagraphOfText("Heading3", "Probable Responsable Involucrado")
      mainPart.addStyledParagraphOfText("Normal", "Apellido Paterno:                       Apellido Materno:                   Nombre(s): ")
      mainPart.addStyledParagraphOfText("Normal", "Edad:                           Sexo: ")
      mainPart.addStyledParagraphOfText("Normal", "Probables delitos o faltas administrativas: ")
      
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
    
    def replaceDenuncia = {
      // Exclude context init from timing
        org.docx4j.wml.ObjectFactory foo = Context.getWmlObjectFactory()

        // Input docx has variables in it: ${colour}, ${icecream}
        String inputfilepath = "C:/Users/FranciscoJavier/Documents/GitHub/NSIP/web-app/Plantillas/PlantillaDenunciaPrueba.docx"

        boolean save = true
        String outputfilepath = "C:/Users/FranciscoJavier/Documents/GitHub/NSIP/web-app/Plantillas/OUT_PlantillaDenunciaPrueba.docx"

        WordprocessingMLPackage wordMLPackage = WordprocessingMLPackage.load(new java.io.File(inputfilepath))
        MainDocumentPart documentPart = wordMLPackage.getMainDocumentPart()

        HashMap<String, String> mappings = new HashMap<String, String>()
        mappings.put("colour", "green")
        mappings.put("icecream", "chocolate")

        long start = System.currentTimeMillis()

        // Approach 1 (from 3.0.0; faster if you haven't yet caused unmarshalling to occur):

//                documentPart.variableReplace(mappings)

		// Approach 2 (original)

                // unmarshallFromTemplate requires string input
                String xml = XmlUtils.marshaltoString(documentPart.getJaxbElement(), true)
                // Do it...
                Object obj = XmlUtils.unmarshallFromTemplate(xml, mappings)
                // Inject result into docx
                documentPart.setJaxbElement((Document) obj)


        long end = System.currentTimeMillis()
        long total = end - start
        System.out.println("Time: " + total)

        // Save it
        if (save) {
                SaveToZipFile saver = new SaveToZipFile(wordMLPackage)
                saver.save(outputfilepath)
        } else {
                System.out.println(XmlUtils.marshaltoString(documentPart.getJaxbElement(), true, true));
        }          
    }
}
