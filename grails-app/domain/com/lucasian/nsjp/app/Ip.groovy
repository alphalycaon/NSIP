package com.lucasian.nsjp.app

class Ip {

    static constraints = {
        expedienteIp(nullable: true)
    }
    static hasOne = [victimaIp: VictimaIp, datosIp: DatosIp]
    static belongsTo = [expedienteIp: ExpedienteIp]
}
