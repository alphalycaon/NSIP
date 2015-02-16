package com.lucasian.nsjp.app

class RepositoryController {
    def repositoryService
    def index() {

    }
    def document(){
        def file
        def version
        if(params.version == null){
            version = "1.0"
        }else{
            version = params.version
        }
        def ubicacion = ""
        if(params.ubicacion){
            ubicacion = params.ubicacion
        }
        if(!ubicacion.startsWith('/')){
            ubicacion = "/"+ubicacion
        }
        file = repositoryService.getVersionContent(ubicacion, version)
        render file: file.stream, contentType: file.mime
    }
    def browse(){
        def ubicacion = ""
        if(params.ubicacion != null){
            ubicacion = params.ubicacion
        }
        if(!ubicacion.startsWith('/')){
            ubicacion = "/"+ubicacion
        }
        def items = repositoryService.listItemsInPath(ubicacion)
        def ultimaPosicion = ubicacion.lastIndexOf("/")
        def padre = ""
        if(ultimaPosicion>0){
            padre = ubicacion.substring(0,ultimaPosicion)
        }
        model: [ items:items , padre: padre ]
    }
    def saveFile(){
        def f = request.getFile("myFile")
        RepositoryCommand document = new RepositoryCommand(
                ruta : params.path,
                nombre : f.originalFilename,
                mime: f.contentType,
                binario: f.inputStream
        )
        repositoryService.storeNode(document)
        redirect action:"index", method:"GET"
    }
    def query(){

    }
    def executeQuery(){
        def ubicacion = ""
        if(params.path){
            ubicacion = params.path
        }
        def items = repositoryService.query(ubicacion)
        def ultimaPosicion = ubicacion.lastIndexOf("/")
        def padre = ""
        if(ultimaPosicion>0){
            padre = ubicacion.substring(0,ultimaPosicion)
        }
        render(view: "browse", model: [ items:items , padre: padre ])
    }
}
