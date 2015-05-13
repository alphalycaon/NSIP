package com.lucasian.nsjp.app

class Victima {

    static constraints = {
        delito(nullable: true)
    }
    static belongsTo = [delito: Delito]
    String nombre
    Integer edad
    String escolaridad
    String estadoCivil
    String genero
    String direccion
    String toString(){
        ""+nombre+":"+edad
    }
}
