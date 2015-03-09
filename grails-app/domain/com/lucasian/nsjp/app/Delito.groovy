package com.lucasian.nsjp.app

class Delito {

    static constraints = {
        expediente (nullable: true, blank: true)
    }
    static hasOne = [victima: Victima, imputado: Imputado, clasificacionDelito: ClasificacionDelito]
    static belongsTo = [expediente: Expediente]
}
