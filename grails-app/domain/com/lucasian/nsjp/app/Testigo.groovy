package com.lucasian.nsjp.app

class Testigo {

    static constraints = {
        delito(nullable: true)
    }
    static belongsTo = [delito: Delito]
    String nombre
    Integer edad
    String escolaridad
    String estadoCivil
    String genero
    String toString(){
        "Testigo: "+nombre+":"+edad
    }
}
