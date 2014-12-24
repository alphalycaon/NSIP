package com.lucasian.nsjp.app

class Expediente {

    static constraints = {
    }
    Date dateCreated 
    Date lastUpdated 
    static hasOne = [delito: Delito]
    String numeroExpediente
}
