package com.lucasian.nsjp.app

class ExpedienteIph {

    static constraints = {
    }
    Date dateCreated 
    Date lastUpdated 
    static hasOne = [iph: Iph]
    String numeroIph
    String createdBy
}
