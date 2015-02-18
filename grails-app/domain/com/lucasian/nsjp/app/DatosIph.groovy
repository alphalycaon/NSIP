package com.lucasian.nsjp.app

class DatosIph {

    static constraints = {
    }
    static belongsTo = [iph: Iph]
    Date fechaEvento
    String horaEvento
    String asunto
    String participacion
    String operativo
    String ubicacion
    String toString(){
        ""+asunto+":"+fechaEvento+":"+horaEvento+":"+ubicacion
    }
}
