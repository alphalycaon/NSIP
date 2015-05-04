package com.lucasian.nsjp.app

class Delito {

    static constraints = {
        expediente (nullable: true, blank: true)
        id{nullable:true}
    }
    static hasOne = [victima: Victima, imputado: Imputado, denunciante: Denunciante, clasificacionDelito: ClasificacionDelito]
    static belongsTo = [expediente: Expediente]
}
