package com.lucasian.nsjp.app

class Delito {

    static constraints = {
        expediente (nullable: true, blank: true)
        id{nullable:true}
    }
    static hasOne = [victima: Victima, imputado: Imputado, testigo:Testigo, denunciante: Denunciante, clasificacionDelito: ClasificacionDelito]
    static belongsTo = [expediente: Expediente]
}
