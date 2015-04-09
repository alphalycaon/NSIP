package com.lucasian.nsjp.app

class ExpedienteIp {

    static constraints = {
    }
    Date dateCreated 
    Date lastUpdated 
    static hasOne = [ip: Ip]
    String numeroIp
    String createdBy
}
