package com.lucasian.nsjp.app

class Iph {

    static constraints = {
        expedienteIph(nullable: true)
    }
    static hasOne = [victimaIph: VictimaIph, imputadoIph: ImputadoIph, datosIph: DatosIph]
    static belongsTo = [expedienteIph: ExpedienteIph]
    
}
