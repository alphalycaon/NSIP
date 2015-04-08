/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package websocket.tc7.chat;

/**
 *
 * @author Catana360
 */
public class NotificaBean {

    String msgTo;
    TipoNotificacion notificacion;

    public static TipoNotificacion getNotificacion(String sNotificacion) {
        return getEnumFromString(TipoNotificacion.class, sNotificacion);
    }
  /*  
    public void getNotificacion(TipoNotificacion notificacion) {
       System.out.println("addNotificacion:" + notificacion);
        switch (notificacion) {
            case DENUNCIA:
                System.out.println("Esta agregando Notifica Denuncia");
                break;
        }
              
    }
*/
    public static <T extends Enum<T>> T getEnumFromString(Class<T> c, String string) {
        if (c != null && string != null) {
            try {
                return Enum.valueOf(c, string.trim().toUpperCase());
            } catch (IllegalArgumentException ex) {
            }
        }
        return null;
    }
}
