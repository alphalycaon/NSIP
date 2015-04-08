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

class HomeController {
    
    def index() { 
     //   consultaNotificaciones();
        def userName  = SecurityUtils.subject?.principal
        int userId = User.findByUsername(userName).getId()
        
        def ExpFiltrado = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + ")")
        
        def ExpCreados = Expediente.executeQuery("from Expediente where createdBy = '" + userName + "'")
        
        def usuarios = User.executeQuery("from User where id <> " + userId + " order by institucion, puesto, nombre")
        
        
        
        //session.get
        
        [expedientes: Expediente.list(), expedientesIph: ExpedienteIph.list(), usuarios: usuarios, expedientesFiltrados: ExpFiltrado, expedientesCreados: ExpCreados]
    }
    
    def notifica() { 
     
    }
    
    def Index_Corroboracion() { 
        def userName  = SecurityUtils.subject?.principal
        int userId = User.findByUsername(userName).getId()
        
        def ExpCompartidos = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + " and tipoExpediente = 'C')")

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
        def defensores = User.executeQuery("from User where id in(select userId from UserRoles where roleId = (select id from Role where name = 'Defensor')) and id not in (select usuarioId from UsuariosExpedientes where expedienteId = " + id + ") order by institucion, puesto, nombre")
        def usuarios = User.executeQuery("from User where id <> " + userId + " and id in(select userId from UserRoles where roleId <> (select id from Role where name = 'Defensor')) and id not in (select usuarioId from UsuariosExpedientes where expedienteId = " + id + ") order by institucion, puesto, nombre")
        def usuariosDef = User.executeQuery("from User where id <> " + userId + " and id not in (select usuarioId from UsuariosExpedientes where expedienteId = " + id + ") order by institucion, puesto, nombre")
        def countInv = UsuariosExpedientes.executeQuery("select count(*) from UsuariosExpedientes where usuarioId = " + userId + " and expedienteId = " + id + " and tipoExpediente = 'I'")
        def countCorr = UsuariosExpedientes.executeQuery("select count(*) from UsuariosExpedientes where usuarioId = " + userId + " and expedienteId = " + id + " and tipoExpediente = 'C'")
        int countI = Integer.parseInt(countInv.toString().replace("[", "").replace("]", ""))
        int countC = Integer.parseInt(countCorr.toString().replace("[", "").replace("]", ""))
        print(countC)
        [expediente: expediente, usuarios: usuarios, defensores: defensores, usuariosDef: usuariosDef, countI: countI, countC: countC]        
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
    def detail_busqueda(){
        
    }
    def calendar(){
        def SolAudiencias = SolicitudAudiencia.executeQuery("from SolicitudAudiencia where estatus = 'N'")
        def jueces = User.executeQuery("from User where id in(select userId from UserRoles where roleId = (select id from Role where name = 'Juez'))")

        [SolicitudesAudiencias: SolAudiencias, jueces: jueces]
    }
    def agenda(){
        
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
                usuexp.tipoExpediente = 'C'
                usuexp.mensaje = mensajeExp
                usuexp.save()
                print("usuario " + userId)
            }else{
                for(int i=0;i<params.listCompartir.size();i++){
                    int userId = User.findByUsername(params.listCompartir[i]).getId()
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
                UsuariosExpedientes.executeUpdate("update UsuariosExpedientes set tipoExpediente='T' where expedienteId = " + idExpediente + " and usuarioId = " + userId + " and tipoExpediente = 'I'")
            }
        }
        
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
    
    def consultaNotificaciones(){
        //si trae el atributo de force obliga a consultar nuevamente la base de datos, si no se trae lo que tenga en session
        def force = request.getParameter("force")
        def notificaMap = session.getAttribute("NSIP_NOTIFICACIONES")
        if(notificaMap==null || force!=null){
            notificaMap = new HashMap()
            def userName  = SecurityUtils.subject?.principal
            int userId = User.findByUsername(userName).getId()

            //def ExpFiltrado = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + ")")
            def ExpCreados = Expediente.executeQuery("from Expediente where createdBy = '" + userName + "'")
            def ExpCompartidos = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + " and tipoExpediente = 'C')")
            
            def ExpIphCreados = Expediente.executeQuery("from ExpedienteIph where createdBy = '" + userName + "'")
        
            def ExpIphFiltrado = Expediente.executeQuery("from ExpedienteIph where id in(select expedienteIphId from UsuariosExpedientesIph where usuarioId = " + userId + ")")
            def ExpTemporales = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + " and tipoExpediente = 'T')")
            def ExpDefinitivos = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + " and tipoExpediente = 'D')")
            def SolAudiencias = SolicitudAudiencia.executeQuery("from SolicitudAudiencia where estatus = 'N'")
        
            def ExpInvestigaciones = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + " and tipoExpediente = 'I')")
        
           // def notificaMap = new HashMap();
            notificaMap.put(TipoNotificacion.DENUNCIA, new AtomicInteger(ExpCreados.size()));
            notificaMap.put(TipoNotificacion.CORROBORACION, new AtomicInteger(ExpCompartidos.size() ));
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
