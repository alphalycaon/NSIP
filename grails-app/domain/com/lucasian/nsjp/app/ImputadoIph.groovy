package com.lucasian.nsjp.app

class ImputadoIph {

    static constraints = {
    }
    static belongsTo = [iph: Iph]
    String nombre
    String apellidoPaterno
    String apellidoMaterno
    Integer edad
    String sexo
    String delito
    String toString(){
        ""+nombre+" "+apellidoPaterno+" "+apellidoMaterno+":"+edad
    }
}
