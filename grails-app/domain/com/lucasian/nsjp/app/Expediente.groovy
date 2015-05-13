package com.lucasian.nsjp.app

class Expediente {

    static constraints = {
        id {nullable:true }
    }
    Date dateCreated 
    Date lastUpdated 
    static hasOne = [delito: Delito]
    static hasMany = [solicitudAudiencia: SolicitudAudiencia]
    String numeroExpediente
    String createdBy
    String toString(){
        "{numeroExpediente:"+numeroExpediente+" createdBy:"+createdBy+"}"
    } 
}
