package com.lucasian.nsjp.app

class IpController {

    def create() {
    }
    def guardarIp(IpCommand command){
        println("GUARDANDO IP")
        println("*:"+command)
        [command]
    }
}
