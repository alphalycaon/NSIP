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

    private static final String GUEST_PREFIX = "Guest";

    private final AtomicInteger connectionIds = new AtomicInteger(0);
    private final Set<ChatMessageInbound> connections
            = new CopyOnWriteArraySet<ChatMessageInbound>();

    @Override
    protected StreamInbound createWebSocketInbound(String subProtocol,
            HttpServletRequest request) {

        String ppal = SecurityUtils.getSubject().getPrincipal().toString();
        System.out.println(ppal);
        Hashtable mapNotificaciones = (Hashtable) request.getAttribute("NSIP_NOTIFICACIONES");
        if (mapNotificaciones == null) {
            return new ChatMessageInbound(ppal, connectionIds.incrementAndGet());
        } else {
            return new ChatMessageInbound(ppal, connectionIds.incrementAndGet(), mapNotificaciones);
        }

    }

    private final class ChatMessageInbound extends MessageInbound {

        private final String nickname;
        private final int connected;
        private Hashtable notificaMap;

        private ChatMessageInbound(String name, int conected) {
            this.nickname = name;
            this.connected = conected;
            this.notificaMap = new Hashtable();
            notificaMap.put(TipoNotificacion.DENUNCIA, new AtomicInteger(0));
            notificaMap.put(TipoNotificacion.CORROBORACION, new AtomicInteger(0));
            notificaMap.put(TipoNotificacion.DOC_RELACIONADO, new AtomicInteger(0));
            notificaMap.put(TipoNotificacion.TEMPORAL, new AtomicInteger(0));
            notificaMap.put(TipoNotificacion.DEFINITIVO, new AtomicInteger(0));
            notificaMap.put(TipoNotificacion.IP, new AtomicInteger(0));
            notificaMap.put(TipoNotificacion.IPH, new AtomicInteger(0));
            notificaMap.put(TipoNotificacion.AUDIENCIA, new AtomicInteger(0));
            notificaMap.put(TipoNotificacion.SOLICITUD_AUDIENCIA, new AtomicInteger(0));
        }

        private ChatMessageInbound(String name, int conected, Hashtable mapNotificaciones) {
            this.nickname = name;
            this.connected = conected;
            this.notificaMap = mapNotificaciones;

        }

        public String getNickName() {
            return nickname;
        }

        @Override
        protected void onOpen(WsOutbound outbound) {
            connections.add(this);
            String message = String.format("{ ntf:0, joined:%s, connected:%d }",
                    nickname, connected);
            System.out.println(message);
            broadcast("*", message);
        }

        @Override
        protected void onClose(int status) {
            connections.remove(this);
            String message = String.format("* %s %s",
                    nickname, "has disconnected.");
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
                //System.out.println("TipoNotificacion.DENUNCIA:"+TipoNotificacion.DENUNCIA);
                TipoNotificacion tipoNotificacion = notifica.getNotificacion(dataParsed.get("notificacion").toString());
                AtomicInteger contador = (AtomicInteger) notificaMap.get(tipoNotificacion);

                System.err.println("dataParsed:" + dataParsed);
//                String filteredMessage = String.format("{%s: %s, %s: %s, %s: %d, %s: %d}",
//                        nickname, HTMLFilter.filter(message.toString()),
                String filteredMessage = String.format("{%s: %s, %s: %d, %s: %d}",
                        "notificacion", dataParsed.get("notificacion"),
                        "numNotificaciones", contador.incrementAndGet(),
                        "usersConnected", connections.size()
                );
                broadcast(dataParsed.get("msgTo").toString(), filteredMessage);
            } catch (Exception e) {
                System.err.println("Sin poder parsear msg:" + message + " from:" + nickname + " causa:" + e.getMessage());
            }

        }

        private void broadcast(String destinatario, String message) {
            for (ChatMessageInbound connection : connections) {
                try {
                    if ("*".equals(destinatario)) {
                        System.out.println("enviando broadcast a:" + connection.getNickName());
                        CharBuffer buffer = CharBuffer.wrap(message);
                        connection.getWsOutbound().writeTextMessage(buffer);
                    } else if (destinatario.equals(connection.getNickName())) {
                        System.out.println("enviando broadcast directo a:" + connection.getNickName());
                        CharBuffer buffer = CharBuffer.wrap(message);
                        connection.getWsOutbound().writeTextMessage(buffer);
                    }

                } catch (IOException ignore) {
                    // Ignore
                }
            }
        }
    }
}
