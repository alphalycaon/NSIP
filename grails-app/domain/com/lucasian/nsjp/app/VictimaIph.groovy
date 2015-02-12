package com.lucasian.nsjp.app

class VictimaIph {

    static constraints = {
        iph(nullable: true)
    }
    static belongsTo = [iph: Iph]
    String nombre
    String apellidoPaterno
    String apellidoMaterno
    Integer edad
    String sexo
    String toString(){
        ""+nombre+" "+apellidoPaterno+" "+apellidoMaterno+":"+edad
    }
}
