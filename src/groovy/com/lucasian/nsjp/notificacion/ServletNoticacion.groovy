package com.lucasian.nsjp.notificacion

import grails.converters.JSON
import grails.util.Environment
import grails.web.JSONBuilder

import javax.servlet.ServletContext
import javax.servlet.ServletContextEvent
import javax.servlet.ServletContextListener
import javax.servlet.annotation.WebListener
import javax.websocket.OnClose
import javax.websocket.OnError
import javax.websocket.OnMessage
import javax.websocket.OnOpen
import javax.websocket.Session
import javax.websocket.server.ServerContainer
import javax.websocket.server.ServerEndpoint

import org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes as GA
import org.slf4j.Logger
import org.slf4j.LoggerFactory

import java.lang.Enum


@ServerEndpoint("/notificacionEndpoint")
@WebListener
public class ServletNoticacion implements ServletContextListener {
    
    static final HashMap<String,Session> chatroomUsers = (new HashMap()).asSynchronized()
    static final HashMap<String,notificacion> notificacionesUsuario = (new HashMap()).asSynchronized()
    
    
    private final Logger log = LoggerFactory.getLogger(getClass().name)
    
    @Override
    public void contextInitialized(ServletContextEvent event) {
        ServletContext servletContext = event.servletContext
        final ServerContainer serverContainer = servletContext.getAttribute("javax.websocket.server.ServerContainer")
        try {
            if (Environment.current == Environment.DEVELOPMENT) {
                serverContainer.addEndpoint(ServletNoticacion)				
            }

            def ctx = servletContext.getAttribute(GA.APPLICATION_CONTEXT)

            def grailsApplication = ctx.grailsApplication

            def config = grailsApplication.config
            int defaultMaxSessionIdleTimeout = config.myservlet.timeout ?: 0
            serverContainer.defaultMaxSessionIdleTimeout = defaultMaxSessionIdleTimeout
        }
        catch (IOException e) {
            log.error e.message, e
        }
    }
	
    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
    }
    
    @OnOpen
    public void handleOpen(Session userSession) {   
        
        String username = userSession.getUserPrincipal()
        Integer idUser = userSession.getId()        
        if(username == null){
            username="anonimo"
        }
        System.out.println("este es el mensaje1 del open: "+username+" este es el mensaje2 del open: "+idUser)
        def notificacionUser = new notificacion(username)       
        notificacionUser.inicializarValores()
        chatroomUsers.put(username,userSession)        
        notificacionesUsuario.put(username,notificacionUser)
    } 
        
    @OnMessage
    public String mensaje(String message,Session userSession) {
        def jSON = new JSONBuilder() 
        def myMsg=[:]  
        String usernameFrom = userSession.getUserPrincipal()      
        String userMensaje
        String usuarioTipoNot
        String userTO        
        int tipoNotUser
        int contador
        //leer el json para el tipo de notificacion
        System.out.println("este es el mensaje: "+message)
        def oJson = JSON.parse(message); 
        userTO = oJson.getString("userto").toString() 
        usuarioTipoNot = oJson.getString("tipoN").toString()
        userMensaje = oJson.getString("msg").toString()            
           
        System.out.println(userTO+" "+usuarioTipoNot+" "+userMensaje+" "+usernameFrom)
           
        int tipoNotificacion = Integer.parseInt(usuarioTipoNot)                   
        
        def tipoNotificacionUsuario = new notificacion()
        
        switch(tipoNotificacion){
        case 0:
            tipoNotUser = tipoNotificacionUsuario.ASIGNA_DEFENSOR  
            break;
        case 1:
            tipoNotUser = tipoNotificacionUsuario.GENERA_IPH
            break;
        case 2:
            tipoNotUser = tipoNotificacionUsuario.GENERA_DENUNCIA
            break;
        case 3:
            tipoNotUser = tipoNotificacionUsuario.NOTIFICA_ESTATUS_CASO
            break;
        case 4:
            tipoNotUser = tipoNotificacionUsuario.COMPARTIR_CASO
            break;
        case 5:
            tipoNotUser = tipoNotificacionUsuario.AGENDA_AUDIENCIA 
            break;
        default:
              
            break;    
        }                  
        if(userTO != null){
            System.out.println("Entro al primer if")
            def userSessionTo = chatroomUsers.get(userTO)
            if(userSessionTo != null){ 
                System.out.println("Entro al segundo if") 
                def notificacionUser = notificacionesUsuario.get(userTO)  
                //El regreso es parte del json que envia el cliente destino que se leyo la notificación
                if(userMensaje.equals("regreso")){
                     contador = notificacionUser.eliminarNotificacion(tipoNotUser)
                }else{                
                     contador = notificacionUser.agregarNotificacion(tipoNotUser)   
                    //def root = jSON contador:contador,notificacionUser:notificacionUser
                    //System.out.println(jSON)                   
                }
                 userSessionTo.getBasicRemote().sendText(contador  as String)
            }
        } 

    }
    
    @OnClose
    public void handeClose(Session userSession) { 
        chatroomUsers.remove(userSession)
    }
    
    @OnError
    public void handleError(Throwable t) {
        t.printStackTrace()
    }
	
}