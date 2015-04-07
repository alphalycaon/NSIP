package com.lucasian.nsjp.app

class DatosIp {

    static constraints = {
    }
    static belongsTo = [ip: Ip]
    String fechaEvento
    String horaEvento
    String asunto
    String participacion
    String operativo
    String ubicacion
    String toString(){
        ""+asunto+":"+fechaEvento+":"+horaEvento+":"+ubicacion
    }
}
