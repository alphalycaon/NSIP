/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lucasian.nsjp.app

/**
 *
 * @author FranciscoJavier
 */
class IpCommand {
	VictimaIp victimaIp
        DatosIp datosIp
        String toString(){
            datosIp.toString()+victimaIp.toString()
        }
}

