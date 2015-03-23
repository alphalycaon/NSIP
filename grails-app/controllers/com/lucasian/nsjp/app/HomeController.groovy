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
import org.apache.shiro.SecurityUtils
class HomeController {

    def index() { 
        def userName  = SecurityUtils.subject?.principal
        int userId = User.findByUsername(userName).getId()
        
        def ExpFiltrado = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + ")")
        
        def ExpCreados = Expediente.executeQuery("from Expediente where createdBy = '" + userName + "'")
        
        [expedientes: Expediente.list(), expedientesIph: ExpedienteIph.list(), expedientesFiltrados: ExpFiltrado, expedientesCreados: ExpCreados]
    }
    def Index_Corroboracion() { 
        def userName  = SecurityUtils.subject?.principal
        int userId = User.findByUsername(userName).getId()
        
        def ExpCompartidos = Expediente.executeQuery("from Expediente where id in(select expedienteId from UsuariosExpedientes where usuarioId = " + userId + ") and (createdBy <> '" + userName + "' or createdBy = null)")

        [expedientesCompartidos: ExpCompartidos]
    }
    def detail(Long id){
        def userName  = SecurityUtils.subject?.principal
        def userId = User.findByUsername(userName).getId()
        
        def expediente = Expediente.get(id)
        def defensores = User.executeQuery("from User where id in(select userId from UserRoles where roleId = (select id from Role where name = 'Defensor')) and id not in (select usuarioId from UsuariosExpedientes where expedienteId = " + id + ")")
        def usuarios = User.executeQuery("from User where id <> " + userId + " and id in(select userId from UserRoles where roleId <> (select id from Role where name = 'Defensor')) and id not in (select usuarioId from UsuariosExpedientes where expedienteId = " + id + ")")
        def usuariosDef = User.executeQuery("from User where id <> " + userId + " and id not in (select usuarioId from UsuariosExpedientes where expedienteId = " + id + ")")
        
        [expediente: expediente, usuarios: usuarios, defensores: defensores, usuariosDef: usuariosDef]        
    }
    def index_Iph() { 
        [expedientesIph: ExpedienteIph.list()]
    }
    def detail_Iph(Long id){
        def expedienteIph = ExpedienteIph.get(id)
        [expedienteIph: expedienteIph]
    }
    def detail_busqueda(){
        
    }
    def calendar(){
        def SolAudiencias = SolicitudAudiencia.executeQuery("from SolicitudAudiencia where estatus = 'N'")
        def jueces = User.executeQuery("from User where id in(select userId from UserRoles where roleId = (select id from Role where name = 'Juez'))")

        [SolicitudesAudiencias: SolAudiencias, jueces: jueces]
    }
    def mapa(){
        
    }
    
    def compartirExpediente() {
        print(params.listCompartir)
        def expediente = params.expedienteId
        if(params.listCompartir != null && params.listCompartir != ""){
            if(params.listCompartir instanceof String){
                int userId = User.findByUsername(params.listCompartir).getId()
                UsuariosExpedientes usuexp = new UsuariosExpedientes();
                usuexp.usuarioId = userId
                usuexp.expedienteId = Integer.parseInt(expediente)
                usuexp.save()
                print("usuario " + userId)
            }else{
                for(int i=0;i<params.listCompartir.size();i++){
                    int userId = User.findByUsername(params.listCompartir[i]).getId()
                    UsuariosExpedientes usuexp = new UsuariosExpedientes();
                    usuexp.usuarioId = userId
                    usuexp.expedienteId = Integer.parseInt(expediente)
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
        if(params.listCompartirDef != null && params.listCompartirDef != ""){
            if(params.listCompartirDef instanceof String){
                int userId = User.findByUsername(params.listCompartirDef).getId()
                UsuariosExpedientes usuexp = new UsuariosExpedientes();
                usuexp.usuarioId = userId
                usuexp.expedienteId = Integer.parseInt(expediente)
                usuexp.save()
                print("usuario " + userId)
            }else{
                for(int i=0;i<params.listCompartirDef.size();i++){
                    int userId = User.findByUsername(params.listCompartirDef[i]).getId()
                    UsuariosExpedientes usuexp = new UsuariosExpedientes();
                    usuexp.usuarioId = userId
                    usuexp.expedienteId = Integer.parseInt(expediente)
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
        print(params.listDefensor)
        if(params.listDefensor != null && params.listDefensor != ""){
            if(params.listDefensor instanceof String){
                int userId = User.findByUsername(params.listDefensor).getId()
                UsuariosExpedientes usuexp = new UsuariosExpedientes();
                usuexp.usuarioId = userId
                usuexp.expedienteId = Integer.parseInt(expediente)
                usuexp.save()
                print("usuario " + userId)
            }else{
                for(int i=0;i<params.listDefensor.size();i++){
                    int userId = User.findByUsername(params.listDefensor[i]).getId()
                    UsuariosExpedientes usuexp = new UsuariosExpedientes();
                    usuexp.usuarioId = userId
                    usuexp.expedienteId = Integer.parseInt(expediente)
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
}
