package com.lucasian.nsjp.app

/**
 *
 * @author FranciscoJavier
 */
class IphCommand {
	VictimaIph victimaIph
        ImputadoIph imputadoIph
        DatosIph datosIph
        String toString(){
            datosIph.toString()+imputadoIph.toString()+victimaIph.toString()
        }
	
}

