package com.lucasian.nsjp.app

class VictimaIp {

    static constraints = {
        ip(nullable: true)
    }
    static belongsTo = [ip: Ip]
    String nombre
    String apellidoPaterno
    String apellidoMaterno
    Integer edad
    String sexo
    String toString(){
        ""+nombre+" "+apellidoPaterno+" "+apellidoMaterno+":"+edad
    }
}
