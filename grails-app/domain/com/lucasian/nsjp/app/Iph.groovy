package com.lucasian.nsjp.app

class Iph {

    static constraints = {
    }
    Date dateCreated 
    Date lastUpdated 
    String numeroIph
    static hasOne = [datosIph: DatosIph, victimaIph: VictimaIph, imputadoIph: ImputadoIph]
}
