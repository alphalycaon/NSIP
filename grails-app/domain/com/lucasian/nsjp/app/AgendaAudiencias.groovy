package com.lucasian.nsjp.app

class AgendaAudiencias {
    Date inicio
    Date fin
    String juez
    
    static constraints = {
    }
     static belongsTo = [solicitudAudiencia: SolicitudAudiencia]
}
