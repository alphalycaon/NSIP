package com.lucasian.nsjp.app

class Iph {

    static constraints = {
    }
    static hasOne = [victimaIph: VictimaIph, imputadoIph: ImputadoIph, datosIph: DatosIph]
    static belongsTo = [expedienteIph: ExpedienteIph]
    
}
