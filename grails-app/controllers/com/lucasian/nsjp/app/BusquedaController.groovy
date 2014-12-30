package com.lucasian.nsjp.app
import grails.converters.*

class BusquedaController {
    def index() { 
        
    }
    def suggest(){
        def data = ["Robo", "Robo con violencia", "Robo con arma blanca", "Secuestro", "Narcomenudeo", "Saltillo", "Revolver"]
        render data as JSON
    }
}
