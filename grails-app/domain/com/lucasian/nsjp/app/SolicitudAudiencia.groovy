package com.lucasian.nsjp.app

class SolicitudAudiencia {

    static constraints = {
        comentarios (nullable: true, blank: true)
    }
    String estatus
    String tipoAudiencia
    String comentarios
    String createdBy
    
    static mapping = {
        estatus defaultValue: "'N'"
     }
     static belongsTo = [expediente: Expediente]
     static hasMany = [agendaAudiencias: AgendaAudiencias]
}
