package com.lucasian.nsjp.notificacion

class notificacion {
    
    String usuario =""
    private HashMap mapaNotificaciones    
     public static final int ASIGNA_DEFENSOR = 0
     public static final int GENERA_IPH = 1
     public static final int GENERA_DENUNCIA = 2
     public static final int NOTIFICA_ESTATUS_CASO = 3
     public static final int COMPARTIR_CASO = 4
     public static final int AGENDA_AUDIENCIA = 5
        
    
    public notificacion(){
        
    }    
    
    public notificacion(String nomUsuario){
        mapaNotificaciones = new HashMap();
        usuario = nomUsuario
        // 
        mapaNotificaciones.put(ASIGNA_DEFENSOR,0)
        mapaNotificaciones.put(GENERA_IPH,0) 
        mapaNotificaciones.put(GENERA_DENUNCIA,0) 
        mapaNotificaciones.put(NOTIFICA_ESTATUS_CASO,0) 
        mapaNotificaciones.put(COMPARTIR_CASO,0) 
        mapaNotificaciones.put(AGENDA_AUDIENCIA,0)         
    }
    
    public  inicializarValores(){
        //Se implementara posteriormente
    }
    
    public agregarNotificacion(tipoNotificacion){
        int valorNotificacion
       
        valorNotificacion = mapaNotificaciones.get(tipoNotificacion)          
        valorNotificacion++
        System.out.println(valorNotificacion)
        mapaNotificaciones.put(tipoNotificacion, valorNotificacion)       
            
        return valorNotificacion
    }
    
    public  eliminarNotificacion(tipoNotificacion){
        int valorNotificacion
          
        valorNotificacion = mapaNotificaciones.get(tipoNotificacion)
        valorNotificacion--
        if(valorNotificacion < 0){
        valorNotificacion = 0
        }
        System.out.println(valorNotificacion)
        mapaNotificaciones.put(tipoNotificacion, valorNotificacion)       
            
        return valorNotificacion
    }
    
    
}
