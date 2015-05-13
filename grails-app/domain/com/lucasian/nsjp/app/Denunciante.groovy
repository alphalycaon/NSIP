package com.lucasian.nsjp.app

class Denunciante {

    static constraints = {
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
