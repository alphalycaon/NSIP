package com.lucasian.nsjp.app

class IphController {

    def create() {
    }
    def guardarIph(IphCommand command){
        println("GUARDANDO IPH")
        println("*:"+command)
        [command]
    }
}
