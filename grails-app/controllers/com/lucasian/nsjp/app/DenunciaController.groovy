package com.lucasian.nsjp.app

class DenunciaController {

    def create() {
    }
    def guardarDenuncia(DenunciaCommand command){
        println("GUARDANDO DENUNCIDA")
        println("*:"+command)
        [command]
    }
}
