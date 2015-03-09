package com.lucasian.nsjp.app

class DocumentsTagLib {
    static encodeAsForTags = [tagName: 'raw']
    //static encodeAsForTags = [tagName: 'raw']
    def headers = ["Nombre", "Tipo", "Modificado"]
    static namespace = "doc"
    /**
     * Esta tag permite mostrar una tabla con los items encontrados en el repositorio para el numero de expediente

     * @attr numeroExpediente El numero del expediente que se mostrara
     *
     */
    def explorer ={attrs, body ->
        def writter= out 
        out<<explorerTable(attrs)
    }
    /**
     * Este tag permite mostrar una tabla con los items encontrados en el repositorio para el numero de expediente,
     * ademas permite la carga de archivos y creacion de carpetas en la estructura
     *
     * @attr numeroExpediente El numero del expediente que se mostrara
     */
    def explorerAndUpload={attrs, body ->
        def writter= out
        out<<explorerTable(attrs)
        out<<explorerUpload(attrs)
        out<<explorerCreateFolder(attrs)
    }    
    def explorerHeader = {attrs, body->
        out<<'<div class="row"><div class="col-lg-12">'
        out<<'<div class="clearfix">'
        out<<'<h1 class="pull-left">Archivos en : </h1>'
        out<<'<div class="pull-right btn-group">'
        out<<'</div>'
        out<<'</div>'
        out<<'</div></div>'

    }
    def explorerUpload = {attrs, body->
        out<<'<div id="uploadModal" class="modal"  aria-hidden="false"><div class="modal-dialog"><div class="modal-content"><div class="modal-header">'
        out<<'<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>'
        out<<'<h4 class="modal-title">Cargar archivos</h4></div>'
        out<<'<div class="modal-body">'
        out<<g.uploadForm([controller:'documents',action:'upload',name:"fileUpload",class:"dropzone",name:"subirArchivo",id:"documentoProbatorios"],'<input type="hidden" id="folder" name="folder" value=""/><div class="fallback"><input type="file" name="file" multiple="" /></div>')
        out<<'</div>'
        out<<'<div class="modal-footer"><button onclick="closeUploadModal(\''+attrs.numeroExpediente+'\');" type="button" class="btn btn-primary">Terminar</button></div>'
        out<<'</div></div></div>'        
    }
    
    def explorerCreateFolder = {attrs, body->
        out<<'<div id="createFolderModal" class="modal"  aria-hidden="false"><div class="modal-dialog"><div class="modal-content"><div class="modal-header">'
        out<<'<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>'
        out<<'<h4 class="modal-title">Crear carpeta</h4></div>'
        out<<'<div class="modal-body">'
        out<<'Nombre de la carpeta:<input type="text" name="folderName" id="folderName"/>'
        out<<'</div>'
        out<<'<div class="modal-footer"><button onclick="closeCreateFolderModal(\''+attrs.numeroExpediente+'\');" type="button" class="btn btn-primary">Terminar</button></div>'
        out<<'</div></div></div>'        
    }
    def explorerTable = {attrs, body->
        out<<'<script src="'
        out<<resource(dir: 'centaurus/js', file: 'fileExplorer.js')
        out<<'"></script>'
        out<<'<div class="row"  style = "padding: 0px 25px 25px 25px;"><div class="col-lg-12">'
        out<<'<div class="main-box clearfix"><header class="main-box-header clearfix">'
        out<<'<h2 class="pull-left">Archivos en : <span id="ruta"></span></h2><div class="filter-block pull-right">'
        out<<'<a href="#" class="btn btn-primary " role="button" onclick="openUploadModal();"><i class="fa fa-cloud-upload fa-lg"></i>Cargar archivos</a>'
        out<<'<a href="#" class="btn btn-primary " role="button" onclick="openCreateFolderModal();"><i class="fa fa-cloud-upload fa-lg"></i>Nueva carpeta</a>'
        out<<'</div></header>'
        out<<'<div class="main-box-body clearfix"><div class="table-responsive clearfix">'
        out<<'<table class="table">'
        out<<'<thead>'
        out<<'<tr>'
        headers.each{
            out<<'<th>'
            out<<it
            out<<'</th>'
        }
        out<<'<th></th>'
        out<<'</tr>'
        out<<'</thead>'
        out<<'<tbody id="items">'
        out<<'</tbody>'
        out<<'</table>'
        out<<'</div></div></div>'
        out<<'</div>'
        out<<'</div>'
        out<<'<script type="text/javascript">'
        out<<'loadExplorer("'+attrs.numeroExpediente+'","/");'
        out<<'</script>'



        }
    }
