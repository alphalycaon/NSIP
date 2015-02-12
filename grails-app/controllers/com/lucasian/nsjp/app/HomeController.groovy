package com.lucasian.nsjp.app

class HomeController {

    def index() { 
        [expedientes: Expediente.list(), iphs: Iph.list()]
    }
    def detail(){
        
    }
    def calendar(){
        
    }
    def mapa(){
        
    }
}
