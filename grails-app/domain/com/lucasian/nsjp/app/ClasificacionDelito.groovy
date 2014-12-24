package com.lucasian.nsjp.app

class ClasificacionDelito {

    static constraints = {
    }
    static belongsTo = [delito: Delito]
    String nombre
    String modalidad
    String modus
    String toString(){
        ""+nombre+":"+modalidad+":"+modus
    }
}
