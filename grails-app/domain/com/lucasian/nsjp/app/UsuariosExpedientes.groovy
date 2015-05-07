package com.lucasian.nsjp.app

class UsuariosExpedientes {
    int usuarioId
    int expedienteId 
    String mensaje
    String tipoExpediente
    boolean leido
    String urgencia
    
    static constraints = {
        mensaje (nullable: true, blank: true)
        tipoExpediente (nullable: true, blank: true)
        leido (nullable: true, blank: true)
    }
}
