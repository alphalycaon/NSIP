package com.lucasian.nsjp.app

class HomeController {

    def index() { 
        [expedientes: Expediente.list()]
    }
    def detail(){
        
    }
}
