package com.lucasian.nsjp.app

class SolicitudAudiencia {

    static constraints = {
        fechaAudiencia (nullable: true, blank: true)
        horaAudiencia (nullable: true, blank: true)
        juezAsignado (nullable: true, blank: true)
        comentarios (nullable: true, blank: true)
    }
    String estatus
    String tipoAudiencia
    String fechaAudiencia
    String horaAudiencia
    int juezAsignado
    String comentarios
    String createdBy
    
    static mapping = {
        estatus defaultValue: "'N'"
     }
     static belongsTo = [expediente: Expediente]
}
