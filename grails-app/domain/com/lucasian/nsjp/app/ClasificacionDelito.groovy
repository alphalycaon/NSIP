package com.lucasian.nsjp.app

class ClasificacionDelito {

    static constraints = {
        id{nullable:true}
    }
    static belongsTo = [delito: Delito]
    String nombre
    String modalidad
    String modus
    String prioridad
    String toString(){
        ""+nombre+":"+modalidad+":"+modus
    }
}
