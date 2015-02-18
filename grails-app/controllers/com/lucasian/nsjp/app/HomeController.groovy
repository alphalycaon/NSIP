package com.lucasian.nsjp.app

class HomeController {

    def index() { 
        [expedientes: Expediente.list(), expedientesIph: ExpedienteIph.list()]
    }
    def detail(){
        
    }
    def calendar(){
        
    }
    def mapa(){
        
    }
}
