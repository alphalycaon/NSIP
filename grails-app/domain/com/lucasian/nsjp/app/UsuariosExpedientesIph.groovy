package com.lucasian.nsjp.app

class UsuariosExpedientesIph {
    int usuarioId
    int expedienteIphId
    String expedienteIphNombre
    Date dateCreated 
    Date lastUpdated 
    String compartidoPor
    String mensaje
    String tipoExpediente
    boolean leido
    String urgencia

    static constraints = {
    }
}
