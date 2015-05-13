package websocket.tc7.chat;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicInteger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.websocket.MessageInbound;
import org.apache.catalina.websocket.StreamInbound;
import org.apache.catalina.websocket.WebSocketServlet;
import org.apache.catalina.websocket.WsOutbound;
import org.apache.shiro.SecurityUtils;

import util.HTMLFilter;

import grails.converters.JSON;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.codehaus.groovy.grails.web.json.JSONElement;

/**
 * Example web socket servlet for chat.
 *
 * @deprecated See {@link websocket.chat.ChatAnnotation}
 */
@Deprecated
public class ChatWebSocketServlet extends WebSocketServlet {

    private static final long serialVersionUID = 1L;

    //private static final String GUEST_PREFIX = "Guest";
    private static HashMap<String, ChatMessageInbound> mapConnections = new HashMap<String, ChatMessageInbound>();
    private static Hashtable<String, Map> mapNotifica = new Hashtable<String, Map>();

    private final AtomicInteger connectionIds = new AtomicInteger(0);
    //private final Set<ChatMessageInbound> connections            = new CopyOnWriteArraySet<ChatMessageInbound>();
    @Override
    protected StreamInbound createWebSocketInbound(String subProtocol,
            HttpServletRequest request) {

        String ppal = SecurityUtils.getSubject().getPrincipal().toString();
        System.out.println(ppal);
        HttpSession session = request.getSession(true);
        /*Enumeration enames = session.getAttributeNames();
         while (enames.hasMoreElements()) {
         String name = (String) enames.nextElement();
         //String value = "" + session.getAttribute(name);
         //map.put(name, value);
         System.out.println("name:"+name+" value:"+session.getAttribute(name));
         }*/

        HashMap mapNotificaciones = (HashMap) session.getAttribute("NSIP_NOTIFICACIONES");
        if(mapNotificaciones==null)
            mapNotificaciones =  createEmptyMapNotificaciones();
        System.out.println("mapNotificaciones:" + mapNotificaciones);
        mapNotifica.put(ppal, mapNotificaciones);
        
        System.out.println("mapNotificaSocketServlets:" + mapNotifica);
       
        
        return new ChatMessageInbound(ppal, connectionIds.incrementAndGet());

    }
    private HashMap createEmptyMapNotificaciones(){
         HashMap notificaMap = new HashMap();
         notificaMap.put(TipoNotificacion.INDICIOS_INVESTIGACION, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.CONCLUIDOS, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.CONTROL_INTERNO, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.CAUSA_CONCLUIDA, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.PENAL_PARTICULAR, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.CUADERNILLO_CAUSA, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.CAUSA, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.JUDICIALIZADOS, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.BANDEJA_ENTRADA, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.DENUNCIA, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.CORROBORACION, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.DOC_RELACIONADO, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.TEMPORAL, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.DEFINITIVO, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.IP, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.IPH, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.AUDIENCIA, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.SOLICITUD_AUDIENCIA, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.CAUSAS, new AtomicInteger(0));
         return notificaMap;
         
    }
    private final class ChatMessageInbound extends MessageInbound {

        private final String nickname;
        private final int connected;

        /*
         private ChatMessageInbound(String name) {
         System.out.println("creando nuevo contenedor para "+name);
         this.nickname = name;
         //this.connected = conected;
         }*/
        private ChatMessageInbound(String name, int connected) {
            
            this.nickname = name;
            this.connected = connected;

        }

        public String getNickName() {
            return nickname;
        }

        @Override
        protected void onOpen(WsOutbound outbound) {
            //connections.add(this);
            //mapConnections.remove(nickname);
            mapConnections.put(nickname+"_"+connected, this);
            String message = String.format("{ \"notificacion\":\"%s\", \"nickname\": \"%s\" }",
                    "JOIN", nickname);
            //System.out.println("Message join opened:" + message);
            broadcast("*", message);
            System.out.println("Sessions registrated:" + mapConnections);
            
            
        }

        @Override
        protected void onClose(int status) {
            mapConnections.remove(nickname+"_"+connected);
            String message = String.format("{ \"notificacion\":\"%s\", \"nickname\": \"%s\" }",
                    "CLOSED", nickname);
            broadcast("*", message);
        }

        @Override
        protected void onBinaryMessage(ByteBuffer message) throws IOException {
            throw new UnsupportedOperationException(
                    "Binary message not supported.");
        }

        @Override
        protected void onTextMessage(CharBuffer message) throws IOException {
            // Never trust the client
            System.out.println("onTextMessage:" + message);
            try {
               // NotificaBean notifica = new NotificaBean();
                Map<String, String> dataParsed = (Map<String, String>) JSON.parse(message.toString());
                System.out.println("Data JSON parsed:" + dataParsed);
 
                TipoNotificacion tipoNotificacion = NotificaBean.getNotificacion(dataParsed.get("notificacion").toString());
                System.out.println("TipoNotificacion:" + tipoNotificacion);
                String msgTo = dataParsed.get("msgTo").toString();
                System.out.println("msgTo:" + msgTo);
                
                if ("*".equals(msgTo)) {
                    Enumeration en = mapNotifica.keys();
                    String key;
                    while (en.hasMoreElements()) {
                        key = (String) en.nextElement();
                        System.out.println("enviando broadcast a:" + key);
                        broadcastNotificaciones(tipoNotificacion, key);

                    }
                } else {
                    broadcastNotificaciones(tipoNotificacion, msgTo);
                }

            } catch (Exception e) {
                e.printStackTrace();
                System.err.println("Sin poder parsear msg:" + message + " from:" + nickname + " causa:" + e.getMessage());
            }

        }

        private void broadcastNotificaciones(TipoNotificacion tipoNotificacion, String sMsgTo) {
            System.out.println("msgToNotifica:" + mapNotifica.get(nickname));
            AtomicInteger contador = (AtomicInteger) mapNotifica.get(nickname).get(tipoNotificacion);

            String responseMessageBroadcast = String.format("{\"%s\": \"%s\", \"%s\": \"%d\", \"%s\": \"%d\"}",
                    "notificacion", tipoNotificacion.toString(),
                    "numNotificaciones", contador.incrementAndGet(),
                    "usersConnected", mapConnections.size()
            );
            System.out.println("responseMessageBroadcast:" + responseMessageBroadcast);

            broadcast(sMsgTo, responseMessageBroadcast);
        }

        private void broadcast(String destinatario, String message) {

            try {
                if ("*".equals(destinatario)) {
                    for (ChatMessageInbound connection : mapConnections.values()) {
                        System.out.println("enviando broadcast a:" + connection.getNickName());
                        CharBuffer buffer = CharBuffer.wrap(message);
                        connection.getWsOutbound().writeTextMessage(buffer);
                    }
                } else {
                    for (ChatMessageInbound connection : mapConnections.values()) {
                        //ChatMessageInbound connection = mapConnections.get(destinatario);
                        if(destinatario.equals(connection.getNickName())){
                            System.out.println("enviando broadcast directo a:" + destinatario);
                            CharBuffer buffer = CharBuffer.wrap(message);
                            connection.getWsOutbound().writeTextMessage(buffer);
                        }
                    }
                }

            } catch (IOException ignore) {
                // Ignore
            }

        }
    }
}
