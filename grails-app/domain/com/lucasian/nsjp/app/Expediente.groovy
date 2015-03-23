package com.lucasian.nsjp.app

class Expediente {

    static constraints = {
    }
    Date dateCreated 
    Date lastUpdated 
    static hasOne = [delito: Delito]
    static hasMany = [solicitudAudiencia: SolicitudAudiencia]
    String numeroExpediente
    String createdBy
}
