/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lucasian.nsjp.app

/**
 *
 * @author Angel
 */
class RepositoryCommand {
	String nombre
       String ruta
       String tipo
       String id
       Map propiedades
       String mime
       String version
       InputStream binario
       Long userId
       String toString(){
              "nombre["+nombre+"] ruta["+ruta+"] tipo["+tipo+"] id["+id+"] propiedades["+propiedades+"] mime["+mime+"]"
       }
}

