/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lucasian.nsjp.app

/**
 *
 * @author Angel
 */
class DenunciaCommand {
	Victima victima
        Imputado imputado
        ClasificacionDelito delito
        String toString(){
            delito.toString()+imputado.toString()+victima.toString()
        }
}

