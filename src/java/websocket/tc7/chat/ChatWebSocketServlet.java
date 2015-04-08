/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
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
        System.out.println("mapNotificaciones:" + mapNotificaciones);
        mapNotifica.put(ppal, mapNotificaciones);
        System.out.println("mapNotificaSocketServlets:" + mapNotifica);
        /*
         if(mapNotificaciones==null)
         return new ChatMessageInbound(ppal);
         else
         */
        return new ChatMessageInbound(ppal, connectionIds.incrementAndGet());

    }

    private final class ChatMessageInbound extends MessageInbound {

        private final String nickname;
        private final int connected;

        /*
         private ChatMessageInbound(String name) {
         System.out.println("creando nuevo contenedor para "+name);
         this.nickname = name;
         //this.connected = conected;
         this.notificaMap = new HashMap();
         notificaMap.put(TipoNotificacion.DENUNCIA, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.CORROBORACION, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.DOC_RELACIONADO, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.TEMPORAL, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.DEFINITIVO, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.IP, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.IPH, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.AUDIENCIA, new AtomicInteger(0));
         notificaMap.put(TipoNotificacion.SOLICITUD_AUDIENCIA, new AtomicInteger(0));
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
            mapConnections.put(nickname+connectionIds, this);
            String message = String.format("{ \"notificacion\":\"%s\", \"nickname\": \"%s\" }",
                    "JOIN", nickname);
            System.out.println("opened" + message);
            broadcast("*", message);
            System.out.println("sesioens_:" + mapConnections);
            /*
             Set<TipoNotificacion> set = notificaMap.keySet();
             TipoNotificacion str;
             Iterator<TipoNotificacion> itr = set.iterator();
             while (itr.hasNext()) {
             str = itr.next();
             AtomicInteger contador = (AtomicInteger) notificaMap.get(str);

             String filteredMessage = String.format("{\"%s\": \"%s\", \"%s\": \"%d\", \"%s\": \"%d\"}",
             "notificacion", str,
             "numNotificaciones", contador.get(),
             "usersConnected", connections.size()
             );
             //System.out.println(str + ": " + balance.get(str));
             System.out.println(":"+filteredMessage);
             broadcast(nickname, filteredMessage);
             }
             */
        }

        @Override
        protected void onClose(int status) {
            mapConnections.remove(nickname+connected);
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
            System.out.println("message:" + message);
            try {
                NotificaBean notifica = new NotificaBean();
                Map<String, String> dataParsed = (Map<String, String>) JSON.parse(message.toString());
                System.out.println("dataParsed:" + dataParsed);

                TipoNotificacion tipoNotificacion = notifica.getNotificacion(dataParsed.get("notificacion").toString());
                System.out.println("TipoNotificacion:" + tipoNotificacion);
                String msgTo = dataParsed.get("msgTo").toString();
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
            System.out.println("msgToNotifica:" + mapNotifica.get(sMsgTo));
            AtomicInteger contador = (AtomicInteger) mapNotifica.get(sMsgTo).get(tipoNotificacion);

            String filteredMessage = String.format("{\"%s\": \"%s\", \"%s\": \"%d\", \"%s\": \"%d\"}",
                    "notificacion", tipoNotificacion.toString(),
                    "numNotificaciones", contador.incrementAndGet(),
                    "usersConnected", mapConnections.size()
            );
            System.out.println("filteredMessage:" + filteredMessage);

            broadcast(sMsgTo, filteredMessage);
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
