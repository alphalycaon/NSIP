package com.lucasian.nsjp.app

import org.docx4j.openpackaging.packages.WordprocessingMLPackage

import org.springframework.web.multipart.MultipartFile
import java.text.SimpleDateFormat
import org.apache.commons.io.FileUtils

import java.util.HashMap
import java.util.concurrent.atomic.AtomicInteger

import org.docx4j.XmlUtils
import org.docx4j.jaxb.Context
import org.docx4j.openpackaging.io.SaveToZipFile
import org.docx4j.openpackaging.packages.WordprocessingMLPackage
import org.docx4j.openpackaging.parts.WordprocessingML.MainDocumentPart
import org.docx4j.wml.Document
import org.apache.shiro.SecurityUtils
import websocket.tc7.chat.TipoNotificacion
import grails.converters.JSON
import java.text.DateFormat

class HomeController {
    
    def index(){ 
        def userName  = SecurityUtils.subject?.principal
        int userId = User.findByUsername(userName).getId()
      
        def ExpCreados = Expediente.executeQuery("from Expediente where createdBy = '" + userName + "' order by dateCreated desc")
        def ExpCompartidos = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + " and tipoExpediente = 'CR')")
        def ExpAJ = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + " and tipoExpediente = 'AJ')")
        def ExpAI = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + " and tipoExpediente = 'AI')")
    
        [expedientes: ExpCreados, iCorroboraciones:ExpCompartidos.size(), iInvestigaciones:ExpAI.size(), iJudicializados:ExpAJ.size()]

    }
    
    def bandeja(String tc){
        def userName  = SecurityUtils.subject?.principal
        int userId = User.findByUsername(userName).getId()
        println ('userId:'+ userId + ' tc:' + tc)
        //TODO: Falta incluir consultas de IPH Compartido, Solicitud Audiencia, Solucitud Defensores
        def ExpCompartidos = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + " and tipoExpediente = '" + tc + "')")

        [expedientesCompartidos: ExpCompartidos, tc: tc]
    }
        
    def denuncias() { 
        //   consultaNotificaciones();
        def subject = SecurityUtils.subject
        def userName  = subject?.principal
        int userId = User.findByUsername(userName).getId()
         
        def expedientes
        if (subject.hasRole("Ministerio")){
            expedientes = Expediente.executeQuery("from Expediente where createdBy = '" + userName + "' or id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + ")")
            
        }else if (subject.hasRole("CES")){//ssp
            //expedientes = Expediente.executeQuery("from Expediente where createdBy = '" + userName + "'")
            expedientes = Expediente.executeQuery("from Expediente where createdBy = '" + userName + "' or id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + ")")
            
            
            
        }else if (subject.hasRole("Juez")){
           expedientes = Expediente.executeQuery("from Expediente where id in(select expediente from SolicitudAudiencia where estatus = 'A' and upper(tipoAudiencia) not like '%PRIVADA%')")
        }else if (subject.hasRole("Defensor")){//tribunal            
          expedientes = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + ")")
          
        }
        println("expedientes:"+expedientes);
       
        
        //def ExpFiltrado = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + ")")
        
        //def ExpCreados = 
        
        def usuarios = User.executeQuery("from User where id <> " + userId + " order by institucion, puesto, nombre")
        
        //def ExpFiltradoJuez = Expediente.executeQuery("from Expediente where id in(select expediente from SolicitudAudiencia where estatus = 'A' and upper(tipoAudiencia) not like '%PRIVADA%')")
        
        //session.get
        
        //[expedientes: Expediente.list(), expedientesIph: ExpedienteIph.list(), usuarios: usuarios, expedientesFiltrados: ExpFiltrado, expedientesCreados: ExpCreados, expedientesFiltradosJuez: ExpFiltradoJuez]
          [expedientes:expedientes, usuarios:usuarios]
    }
    
    def index_Solicitudes() { 
        def userName  = SecurityUtils.subject?.principal
        int userId = User.findByUsername(userName).getId()
        
        def ExpFiltrado = Expediente.executeQuery("from Expediente where id in(select expediente from SolicitudAudiencia where estatus = 'N')")
        
        [expedientesFiltrados: ExpFiltrado]
    }
    
    def index_Cuadernillos() { 
        def userName  = SecurityUtils.subject?.principal
        int userId = User.findByUsername(userName).getId()
        
        def ExpFiltrado = Expediente.executeQuery("from Expediente where id in(select expediente from SolicitudAudiencia where estatus = 'A' and upper(tipoAudiencia) like '%PRIVADA%')")
        
        [expedientesFiltrados: ExpFiltrado]
    }
    
    def notifica() { 
     
    }
    
    def Index_Corroboracion() { 
        def userName  = SecurityUtils.subject?.principal
        int userId = User.findByUsername(userName).getId()
        
        def ExpCompartidos = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + " and tipoExpediente = 'CR')")

        [expedientesCompartidos: ExpCompartidos]
    }
    def index_Investigacion() { 
        def userName  = SecurityUtils.subject?.principal
        int userId = User.findByUsername(userName).getId()
        
        def ExpInvestigaciones = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + " and tipoExpediente = 'I')")

        [expedientesInvestigaciones: ExpInvestigaciones]
    }
    def index_Temporales() { 
        def userName  = SecurityUtils.subject?.principal
        int userId = User.findByUsername(userName).getId()
        
        def ExpTemporales = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + " and tipoExpediente = 'T')")

        [expedientesTemporales: ExpTemporales]
    }
    def index_Definitivos() { 
        def userName  = SecurityUtils.subject?.principal
        int userId = User.findByUsername(userName).getId()
        
        def ExpDefinitivos = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + " and tipoExpediente = 'D')")

        [expedientesDefinitivos: ExpDefinitivos]
    }
    def detail(Long id){
        def userName  = SecurityUtils.subject?.principal
        def userId = User.findByUsername(userName).getId()
        
        def expediente = Expediente.get(id)
        println("expediente:"+expediente)
        def defensores = User.executeQuery("from User where id in(select userId from UserRoles where roleId = (select id from Role where name = 'Defensor')) and id not in (select usuarioId from UsuariosExpedientes where expedienteId = " + id + ") order by institucion, puesto, nombre")
        def usuarios = User.executeQuery("from User where id <> " + userId + " and id in(select userId from UserRoles where roleId <> (select id from Role where name = 'Defensor')) and id not in (select usuarioId from UsuariosExpedientes where expedienteId = " + id + ") order by institucion, puesto, nombre")
        def usuariosDef = User.executeQuery("from User where id <> " + userId + " and id not in (select usuarioId from UsuariosExpedientes where expedienteId = " + id + ") order by institucion, puesto, nombre")
        def countInv = 0//UsuariosExpedientes.executeQuery("select count(*) from UsuariosExpedientes where usuarioId = " + userId + " and expedienteId = " + id + " and tipoExpediente = 'I' group by usuarioId, expedienteId, tipoExpediente")
        def countCorr = 0//UsuariosExpedientes.executeQuery("select count(*) from UsuariosExpedientes where usuarioId = " + userId + " and expedienteId = " + id + " and tipoExpediente = 'C' group by usuarioId, expedienteId, tipoExpediente")
        //int countI = Integer.parseInt(countInv.toString().replace("[", "").replace("]", ""))
        //int countC = Integer.parseInt(countCorr.toString().replace("[", "").replace("]", ""))
        //print(countC)
        String notifica = session.getAttribute("notifica");
        session.removeAttribute("notifica");
        //println("notifica:"+notifica)
        [expediente: expediente, usuarios: usuarios, defensores: defensores, usuariosDef: usuariosDef, countI: countInv, countC: countCorr, notifica:notifica, tiposAudiencias: TipoAudiencia.list()]        
    }
    def index_Iph() { 
        def userName  = SecurityUtils.subject?.principal
        int userId = User.findByUsername(userName).getId()
        
        def ExpIphFiltrado = Expediente.executeQuery("from ExpedienteIph where id in(select expedienteIphId from UsuariosExpedientesIph where usuarioId = " + userId + ")")
        
        def ExpIphCreados = Expediente.executeQuery("from ExpedienteIph where createdBy = '" + userName + "'")
        
        def usuarios = User.executeQuery("from User where id <> " + userId + " order by institucion, puesto, nombre")
        
        [expedientesIph: ExpedienteIph.list(), usuarios: usuarios, expedientesIphFiltrados: ExpIphFiltrado, expedientesIphCreados: ExpIphCreados]
    }
    def detail_Iph(Long id){
        def userName  = SecurityUtils.subject?.principal
        def userId = User.findByUsername(userName).getId()
        
        def expedienteIph = ExpedienteIph.get(id)
        def defensores = User.executeQuery("from User where id in(select userId from UserRoles where roleId = (select id from Role where name = 'Defensor')) and id not in (select usuarioId from UsuariosExpedientesIph where expedienteIphId = " + id + ")")
        def usuarios = User.executeQuery("from User where id <> " + userId + " and id in(select userId from UserRoles where roleId in (select id from Role where name in ('Ministerio', 'CES'))) and id not in (select usuarioId from UsuariosExpedientesIph where expedienteIphId = " + id + ")")
        def usuariosDef = User.executeQuery("from User where id <> " + userId + " and id not in (select usuarioId from UsuariosExpedientesIph where expedienteIphId = " + id + ")")
        
        [expedienteIph: expedienteIph, usuarios: usuarios, defensores: defensores, usuariosDef: usuariosDef]
    }
    def index_Ip() { 
        def userName  = SecurityUtils.subject?.principal
        int userId = User.findByUsername(userName).getId()
        
        def ExpIpFiltrado = Expediente.executeQuery("from ExpedienteIp where id in(select expedienteIpId from UsuariosExpedientesIp where usuarioId = " + userId + ")")
        
        def ExpIpCreados = Expediente.executeQuery("from ExpedienteIp where createdBy = '" + userName + "'")
        
        def usuarios = User.executeQuery("from User where id <> " + userId + " order by institucion, puesto, nombre")
        
        [expedientesIp: ExpedienteIp.list(), usuarios: usuarios, expedientesIpFiltrados: ExpIpFiltrado, expedientesIpCreados: ExpIpCreados]
    }
    def detail_Ip(Long id){
        def userName  = SecurityUtils.subject?.principal
        def userId = User.findByUsername(userName).getId()
        
        def expedienteIp = ExpedienteIp.get(id)
        def defensores = User.executeQuery("from User where id in(select userId from UserRoles where roleId = (select id from Role where name = 'Defensor')) and id not in (select usuarioId from UsuariosExpedientesIp where expedienteIpId = " + id + ")")
        def usuarios = User.executeQuery("from User where id <> " + userId + " and id in(select userId from UserRoles where roleId in (select id from Role where name in ('Ministerio', 'CES'))) and id not in (select usuarioId from UsuariosExpedientesIp where expedienteIpId = " + id + ")")
        def usuariosDef = User.executeQuery("from User where id <> " + userId + " and id not in (select usuarioId from UsuariosExpedientesIp where expedienteIpId = " + id + ")")
        
        [expedienteIp: expedienteIp, usuarios: usuarios, defensores: defensores, usuariosDef: usuariosDef]
    }
    def detail_busqueda(){
        
    }
    def calendar(){
        def solAudiencias = SolicitudAudiencia.executeQuery("from SolicitudAudiencia where estatus = 'N'")
        def jueces = User.executeQuery("from User where id in(select userId from UserRoles where roleId = (select id from Role where name = 'Juez'))")
                
        [SolicitudesAudiencias: solAudiencias, jueces: jueces, agendasAudiencias: AgendaAudiencias.list()]
    }
    def consultaCalendar(){
        def solAudiencias = SolicitudAudiencia.executeQuery("from SolicitudAudiencia where estatus = 'N'")
        def jueces = User.executeQuery("from User where id in(select userId from UserRoles where roleId = (select id from Role where name = 'Juez'))")
        def audiencia;
        
        def solAudienciasSet = solAudiencias.collect{ solAudiencia ->
            audiencia = [
                'numeroExpediente':solAudiencia.expediente.numeroExpediente,
                'tipoAudiencia':solAudiencia.tipoAudiencia,
                'id':solAudiencia.id,
                'victima':solAudiencia.expediente.delito.victima.nombre,
                'imputado':solAudiencia.expediente.delito.imputado.nombre,
                'delito':solAudiencia.expediente.delito.clasificacionDelito.nombre
            ]
        }   
        
        render solAudienciasSet as JSON
    }
    def agenda(){        
        
        [agendasAudiencias: AgendaAudiencias.list()]
    }
    def mapa(){
        
    }
    
    def compartirExpediente() {
        print(params.listCompartir)
        def expediente = params.expedienteId
        def mensajeExp = params.commentCompartir
        if(params.listCompartir != null && params.listCompartir != ""){
            if(params.listCompartir instanceof String){
                int userId = User.findByUsername(params.listCompartir).getId()
                UsuariosExpedientes usuexp = new UsuariosExpedientes();
                usuexp.usuarioId = userId
                usuexp.expedienteId = Integer.parseInt(expediente)
                usuexp.tipoExpediente = 'EE'
                usuexp.mensaje = mensajeExp
                usuexp.save()
                print("usuario " + userId)
            }else{
                for(int i=0;i<params.listCompartir.size();i++){
                    int userId = User.findByUsername(params.listCompartir[i]).getId()
                    UsuariosExpedientes usuexp = new UsuariosExpedientes();
                    usuexp.usuarioId = userId
                    usuexp.expedienteId = Integer.parseInt(expediente)
                    usuexp.tipoExpediente = 'EE'
                    usuexp.mensaje = mensajeExp
                    usuexp.save()
                    print("usuario " + userId)
                }
            }    
        }
        print("expediente " + Integer.parseInt(expediente))
        redirect(action: "detail", id: expediente)
    }
    
    def compartirExpedienteDef() {
        def expediente = params.expedienteId3
        def mensajeExp = params.commentCompartirDef
        if(params.listCompartirDef != null && params.listCompartirDef != ""){
            if(params.listCompartirDef instanceof String){
                int userId = User.findByUsername(params.listCompartirDef).getId()
                UsuariosExpedientes usuexp = new UsuariosExpedientes();
                usuexp.usuarioId = userId
                usuexp.expedienteId = Integer.parseInt(expediente)
                usuexp.tipoExpediente = 'C'
                usuexp.mensaje = mensajeExp
                usuexp.save()
                print("usuario " + userId)
            }else{
                for(int i=0;i<params.listCompartirDef.size();i++){
                    int userId = User.findByUsername(params.listCompartirDef[i]).getId()
                    UsuariosExpedientes usuexp = new UsuariosExpedientes();
                    usuexp.usuarioId = userId
                    usuexp.expedienteId = Integer.parseInt(expediente)
                    usuexp.tipoExpediente = 'C'
                    usuexp.mensaje = mensajeExp
                    usuexp.save()
                    print("usuario " + userId)
                }
            }    
        }
        print("expediente " + Integer.parseInt(expediente))
        session.setAttribute("notifica", "CAUSAS")
        redirect(action: "detail", id: expediente)
    }
    
    def asignarDefensor() {
        def expediente = params.expedienteId2
        def mensajeExp = params.comment
        print(params.listDefensor)
        if(params.listDefensor != null && params.listDefensor != ""){
            if(params.listDefensor instanceof String){
                int userId = User.findByUsername(params.listDefensor).getId()
                UsuariosExpedientes usuexp = new UsuariosExpedientes();
                usuexp.usuarioId = userId
                usuexp.expedienteId = Integer.parseInt(expediente)
                usuexp.tipoExpediente = 'D'
                usuexp.mensaje = mensajeExp
                usuexp.save()
                print("usuario " + userId)
            }else{
                for(int i=0;i<params.listDefensor.size();i++){
                    int userId = User.findByUsername(params.listDefensor[i]).getId()
                    UsuariosExpedientes usuexp = new UsuariosExpedientes();
                    usuexp.usuarioId = userId
                    usuexp.expedienteId = Integer.parseInt(expediente)
                    usuexp.tipoExpediente = 'D'
                    usuexp.save()
                    print("usuario " + userId)
                }
            }    
        }
        print("expediente " + Integer.parseInt(expediente))
        redirect(action: "detail", id: expediente)
    }
    
    def solicitarAudiencia(){      
        def expedienteId = params.expedienteId4
        def userName  = SecurityUtils.subject?.principal
        def expediente = Expediente.get(expedienteId)
        
        if(params.listAudiencia != null && params.listAudiencia != ""){
            SolicitudAudiencia solaud = new SolicitudAudiencia();
            solaud.estatus = 'N'
            solaud.tipoAudiencia = params.listAudiencia
            solaud.expediente = expediente
            solaud.comentarios = params.commentAudiencia
            solaud.createdBy = userName
            solaud.save()
            
        }
        print("expediente " + Integer.parseInt(expedienteId))
        
        
        session.setAttribute("notifica", "SOLICITUD_AUDIENCIA")
        redirect(action: "detail", id: expedienteId)
        
    }
    
    def compartirExpedienteIph() {
        print(params.listCompartir)
        def expediente = params.expedienteId
        if(params.listCompartir != null && params.listCompartir != ""){
            if(params.listCompartir instanceof String){
                int userId = User.findByUsername(params.listCompartir).getId()
                UsuariosExpedientesIph usuexp = new UsuariosExpedientesIph();
                usuexp.usuarioId = userId
                usuexp.expedienteIphId = Integer.parseInt(expediente)
                usuexp.save()
                print("usuario " + userId)
            }else{
                for(int i=0;i<params.listCompartir.size();i++){
                    int userId = User.findByUsername(params.listCompartir[i]).getId()
                    UsuariosExpedientesIph usuexp = new UsuariosExpedientesIph();
                    usuexp.usuarioId = userId
                    usuexp.expedienteIphId = Integer.parseInt(expediente)
                    usuexp.save()
                    print("usuario " + userId)
                }
            }    
        }
        print("expediente " + Integer.parseInt(expediente))
        redirect(action: "detail_Iph", id: expediente)
    }
    
    def compartirExpedienteIphDef() {
        def expediente = params.expedienteId3
        if(params.listCompartirDef != null && params.listCompartirDef != ""){
            if(params.listCompartirDef instanceof String){
                int userId = User.findByUsername(params.listCompartirDef).getId()
                UsuariosExpedientesIph usuexp = new UsuariosExpedientesIph();
                usuexp.usuarioId = userId
                usuexp.expedienteIphId = Integer.parseInt(expediente)
                usuexp.save()
                print("usuario " + userId)
            }else{
                for(int i=0;i<params.listCompartirDef.size();i++){
                    int userId = User.findByUsername(params.listCompartirDef[i]).getId()
                    UsuariosExpedientesIph usuexp = new UsuariosExpedientesIph();
                    usuexp.usuarioId = userId
                    usuexp.expedienteIphId = Integer.parseInt(expediente)
                    usuexp.save()
                    print("usuario " + userId)
                }
            }    
        }
        print("expediente " + Integer.parseInt(expediente))
        redirect(action: "detail_Iph", id: expediente)
    }
    
    def compartirExpedienteIp() {
        print(params.listCompartir)
        def expediente = params.expedienteId
        if(params.listCompartir != null && params.listCompartir != ""){
            if(params.listCompartir instanceof String){
                int userId = User.findByUsername(params.listCompartir).getId()
                UsuariosExpedientesIp usuexp = new UsuariosExpedientesIp();
                usuexp.usuarioId = userId
                usuexp.expedienteIpId = Integer.parseInt(expediente)
                usuexp.save()
                print("usuario " + userId)
            }else{
                for(int i=0;i<params.listCompartir.size();i++){
                    int userId = User.findByUsername(params.listCompartir[i]).getId()
                    UsuariosExpedientesIp usuexp = new UsuariosExpedientesIp();
                    usuexp.usuarioId = userId
                    usuexp.expedienteIpId = Integer.parseInt(expediente)
                    usuexp.save()
                    print("usuario " + userId)
                }
            }    
        }
        print("expediente " + Integer.parseInt(expediente))
        redirect(action: "detail_Ip", id: expediente)
    }
    
    def compartirExpedienteIpDef() {
        def expediente = params.expedienteId3
        if(params.listCompartirDef != null && params.listCompartirDef != ""){
            if(params.listCompartirDef instanceof String){
                int userId = User.findByUsername(params.listCompartirDef).getId()
                UsuariosExpedientesIp usuexp = new UsuariosExpedientesIp();
                usuexp.usuarioId = userId
                usuexp.expedienteIpId = Integer.parseInt(expediente)
                usuexp.save()
                print("usuario " + userId)
            }else{
                params.listCompartirDef.each({
                        int userId = User.findByUsername($it).getId()
                        UsuariosExpedientesIp usuexp = new UsuariosExpedientesIp();
                        usuexp.usuarioId = userId
                        usuexp.expedienteIpId = Integer.parseInt(expediente)
                        usuexp.save()
                        print("usuario " + userId)     
                    })
            }    
        }
        print("expediente " + Integer.parseInt(expediente))
        redirect(action: "detail_Ip", id: expediente)
    }
    
    def asignarIphDefensor() {
        def expediente = params.expedienteId2
        print(params.listDefensor)
        if(params.listDefensor != null && params.listDefensor != ""){
            if(params.listDefensor instanceof String){
                int userId = User.findByUsername(params.listDefensor).getId()
                UsuariosExpedientesIph usuexp = new UsuariosExpedientesIph();
                usuexp.usuarioId = userId
                usuexp.expedienteIphId = Integer.parseInt(expediente)
                usuexp.save()
                print("usuario " + userId)
            }else{
                for(int i=0;i<params.listDefensor.size();i++){
                    int userId = User.findByUsername(params.listDefensor[i]).getId()
                    UsuariosExpedientesIph usuexp = new UsuariosExpedientesIph();
                    usuexp.usuarioId = userId
                    usuexp.expedienteIphId = Integer.parseInt(expediente)
                    usuexp.save()
                    print("usuario " + userId)
                }
            }    
        }
        print("expediente " + Integer.parseInt(expediente))
        redirect(action: "detail_Iph", id: expediente)
    }
    
    def moverDenuncias() {
        def userName  = SecurityUtils.subject?.principal
        def userId = User.findByUsername(userName).getId()
        def parametros = params.toString().replace("[", "").replace("]", "").split(", ")
        print(params)
        for(int i=0;i<parametros.size();i++){
            //int userId = User.findByUsername(params[i]).getId()
            def valores = parametros[i].split(":")
            if(valores[0].contains('checkbox')){
                def idExpediente = valores[0].replace('checkbox', '')
                print(idExpediente)
                /*def usuexpId = UsuariosExpedientes.executeQuery("select id from UsuariosExpedientes where expedienteId = " + idExpediente + " and usuarioId = " + userId + " and tipoExpediente = 'C'")
                int usuexpId2 = Integer.parseInt(usuexpId.toString().replace("[", "").replace("]", ""))
                print(usuexpId2)
                UsuariosExpedientes usuexp = UsuariosExpedientes.get(usuexpId2)
                if(usuexp) {
                print(usuexp)
                usuexp.tipoExpediente = "I"
                usuexp.save()   
                }*/
                UsuariosExpedientes.executeUpdate("update UsuariosExpedientes set tipoExpediente='I' where expedienteId = " + idExpediente + " and usuarioId = " + userId + " and tipoExpediente = 'C'")
            }
        }
        
        redirect(action: "Index_Corroboracion")
    }
    
    def moverDenuncia() {
        def userName  = SecurityUtils.subject?.principal
        def userId = User.findByUsername(userName).getId()
        def idExpediente = params.idExpediente
        print(idExpediente)
        UsuariosExpedientes.executeUpdate("update UsuariosExpedientes set tipoExpediente='I' where expedienteId = " + idExpediente + " and usuarioId = " + userId + " and tipoExpediente = 'C'")
            
        redirect(action: "detail", id: idExpediente)
    }
    
    def archivosTemporales() {
        def userName  = SecurityUtils.subject?.principal
        def userId = User.findByUsername(userName).getId()
        //def parametros = params.toString().replace("[", "").replace("]", "").split(", ")
        print(params)
        params.keySet().each({
                def valores = params[it].split(":")
                valores.each({
                        if(it.contains('checkbox')){
                            def idExpediente = valores[0].replace('checkbox', '')
                            print(idExpediente)
                            UsuariosExpedientes.executeUpdate("update UsuariosExpedientes set tipoExpediente='T' where expedienteId = " + idExpediente + " and usuarioId = " + userId + " and tipoExpediente = 'I'")
                        }
                    })
            })
        /*
        for(int i=0;i<parametros.size();i++){
        //int userId = User.findByUsername(params[i]).getId()
        def valores = parametros[i].split(":")
        if(valores[0].contains('checkbox')){
        def idExpediente = valores[0].replace('checkbox', '')
        print(idExpediente)
        /*def usuexpId = UsuariosExpedientes.executeQuery("select id from UsuariosExpedientes where expedienteId = " + idExpediente + " and usuarioId = " + userId + " and tipoExpediente = 'C'")
        int usuexpId2 = Integer.parseInt(usuexpId.toString().replace("[", "").replace("]", ""))
        print(usuexpId2)
        UsuariosExpedientes usuexp = UsuariosExpedientes.get(usuexpId2)
        if(usuexp) {
        print(usuexp)
        usuexp.tipoExpediente = "I"
        usuexp.save()   
        }
        UsuariosExpedientes.executeUpdate("update UsuariosExpedientes set tipoExpediente='T' where expedienteId = " + idExpediente + " and usuarioId = " + userId + " and tipoExpediente = 'I'")
        }
        }*/
        
        redirect(action: "index_Investigacion")
    }
    
    def archivoTemporal() {
        def userName  = SecurityUtils.subject?.principal
        def userId = User.findByUsername(userName).getId()
        def idExpediente = params.idExpediente
        print(idExpediente)
        UsuariosExpedientes.executeUpdate("update UsuariosExpedientes set tipoExpediente='T' where expedienteId = " + idExpediente + " and usuarioId = " + userId + " and tipoExpediente = 'I'")
            
        redirect(action: "detail", id: idExpediente)
    }
    
    def archivosDefinitivos() {
        def userName  = SecurityUtils.subject?.principal
        def userId = User.findByUsername(userName).getId()
        def parametros = params.toString().replace("[", "").replace("]", "").split(", ")
        print(params)
        for(int i=0;i<parametros.size();i++){
            //int userId = User.findByUsername(params[i]).getId()
            def valores = parametros[i].split(":")
            if(valores[0].contains('checkbox')){
                def idExpediente = valores[0].replace('checkbox', '')
                print(idExpediente)
                /*def usuexpId = UsuariosExpedientes.executeQuery("select id from UsuariosExpedientes where expedienteId = " + idExpediente + " and usuarioId = " + userId + " and tipoExpediente = 'C'")
                int usuexpId2 = Integer.parseInt(usuexpId.toString().replace("[", "").replace("]", ""))
                print(usuexpId2)
                UsuariosExpedientes usuexp = UsuariosExpedientes.get(usuexpId2)
                if(usuexp) {
                print(usuexp)
                usuexp.tipoExpediente = "I"
                usuexp.save()   
                }*/
                UsuariosExpedientes.executeUpdate("update UsuariosExpedientes set tipoExpediente='D' where expedienteId = " + idExpediente + " and usuarioId = " + userId + " and tipoExpediente = 'I'")
            }
        }
        
        redirect(action: "index_Investigacion")
    }
    
    def archivoDefinitivo() {
        def userName  = SecurityUtils.subject?.principal
        def userId = User.findByUsername(userName).getId()
        def idExpediente = params.idExpediente
        print(idExpediente)
        UsuariosExpedientes.executeUpdate("update UsuariosExpedientes set tipoExpediente='D' where expedienteId = " + idExpediente + " and usuarioId = " + userId + " and tipoExpediente = 'I'")
            
        redirect(action: "detail", id: idExpediente)
    }
    
    def compartirVariosExp() {
        redirect(action: "index")
    }
    
    def compartirVariosExpIph() {
        redirect(action: "index_Iph")
    }    
    def compartirVariosExpIp() {
        redirect(action: "index_Ip")
    }
    
    def guardarAudiencia(){
        
        def idSolicitud = params.solicitudId
        def inicio = params.inicio
        def juez = params.selectJuez
        def resultado = "{Msg: 'No se ha guardado la audiencia'}"
        
        print('id='+idSolicitud+', inicio='+inicio+', juez='+juez)
        
        if(idSolicitud != null && idSolicitud!= ""){
            SolicitudAudiencia solicitudAudiencia = SolicitudAudiencia.get(idSolicitud)

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss")
            Date fechaInicio = sdf.parse(inicio)
             
            Date fechaFin = new Date(fechaInicio.getTime());
            fechaFin.setHours(fechaFin.getHours()+2);
            print('' + fechaInicio + ' a ' + fechaFin + '')

            AgendaAudiencias aud = new AgendaAudiencias();
            aud.inicio = fechaInicio
            aud.fin = fechaFin
            aud.juez = juez
            aud.solicitudAudiencia = solicitudAudiencia
            aud.save()

            SolicitudAudiencia.executeUpdate("update SolicitudAudiencia set estatus='A' where id = " + idSolicitud)
            resultado = "{Msg: 'Se ha guardado la audiencia'}"
        }
        print(resultado)
            
        render resultado
    }
    
    def updateAudiencia(){
        
        def idAgenda = params.id
        def inicio = params.inicio
        def fin = params.fin
        def resultado = "{Msg: 'No se ha guardado la audiencia'}"
        
        print('id='+idAgenda+', inicio='+inicio+', fin='+fin)
        
        if(idAgenda != null && idAgenda!= ""){
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss")            
            Date fechaInicio = sdf.parse(inicio)
            Date fechaFin = sdf.parse(fin)
            
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            print('' + sdf2.format(fechaInicio) + ' a ' + sdf2.format(fechaFin) + '')

            def audiencia = AgendaAudiencias.get(idAgenda)
            audiencia.inicio = Date.parse('yyyy-MM-dd HH:mm:ss', sdf2.format(fechaInicio))
            audiencia.fin = Date.parse('yyyy-MM-dd HH:mm:ss', sdf2.format(fechaFin))
            audiencia.save()
            
            resultado = "{Msg: 'Se ha guardado la audiencia'}"
        }
        print(resultado)
            
        render resultado
    }
    
    def consultaNotificaciones(){
        //si trae el atributo de force obliga a consultar nuevamente la base de datos, si no se trae lo que tenga en session
        def force = request.getParameter("force")
        def notificaMap = session.getAttribute("NSIP_NOTIFICACIONES")
        if(notificaMap==null || force!=null){
            notificaMap = new HashMap()
            def userName  = SecurityUtils.subject?.principal
            int userId = User.findByUsername(userName).getId()

            def ExpFiltrado = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + ")")
            def ExpCreados = Expediente.executeQuery("from Expediente where createdBy = '" + userName + "'")
            def ExpCompartidos = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + " and tipoExpediente = 'C')")
            
            def ExpIphCreados = Expediente.executeQuery("from ExpedienteIph where createdBy = '" + userName + "'")
        
            def ExpIphFiltrado = Expediente.executeQuery("from ExpedienteIph where id in(select expedienteIphId from UsuariosExpedientesIph where usuarioId = " + userId + ")")
            def ExpTemporales = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + " and tipoExpediente = 'T')")
            def ExpDefinitivos = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + " and tipoExpediente = 'D')")
            def SolAudiencias = SolicitudAudiencia.executeQuery("from SolicitudAudiencia where estatus = 'N' ")
        
            def ExpInvestigaciones = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + " and tipoExpediente = 'I')")
        
            // def notificaMap = new HashMap();
            notificaMap.put(TipoNotificacion.DENUNCIA, new AtomicInteger(ExpCreados.size()));
            notificaMap.put(TipoNotificacion.CORROBORACION, new AtomicInteger(ExpCompartidos.size() ));
            notificaMap.put(TipoNotificacion.CAUSAS, new AtomicInteger(ExpFiltrado.size() ));
            
            
            notificaMap.put(TipoNotificacion.DOC_RELACIONADO, new AtomicInteger(ExpInvestigaciones.size()));
            notificaMap.put(TipoNotificacion.TEMPORAL, new AtomicInteger(ExpTemporales.size()));
            notificaMap.put(TipoNotificacion.DEFINITIVO, new AtomicInteger(ExpDefinitivos.size()));
            notificaMap.put(TipoNotificacion.IP, new AtomicInteger(0));
            notificaMap.put(TipoNotificacion.IPH, new AtomicInteger(ExpIphCreados.size()));
            notificaMap.put(TipoNotificacion.AUDIENCIA, new AtomicInteger(0));
            notificaMap.put(TipoNotificacion.SOLICITUD_AUDIENCIA, new AtomicInteger(SolAudiencias.size()));
            System.out.println("consultaNotificaciones:>>"+notificaMap)
            session.setAttribute("NSIP_NOTIFICACIONES", notificaMap)
        }
        
        render  notificaMap as JSON
    }
    
}
