package com.lucasian.nsjp.app

class DocumentsTagLib {
    static encodeAsForTags = [tagName: 'raw']
    //static encodeAsForTags = [tagName: 'raw']
    def headers = ["Tipo","Nombre", "Modificado"]
    def documentService
    static namespace = "doc"
    def explorer ={attrs, body ->
        def writter= out 
        out<<explorerTable(attrs)
    }
    def explorerAndUpload={attrs, body ->
        def writter= out
        out<<explorerTable(attrs)
        out<<explorerUpload(attrs)
        out<<explorerCreateFolder(attrs)
    }    
    def gallery = {attrs, body ->
        def writer = out
        def imagenes = documentService.searchImages(attrs.numeroExpediente)
        out<<'<div class="wrapper" id="divImagenes">'
        out<<'<div class="connected-carousels">'                                                                    
        out<<'<div class="stage" style="width:500px; height:300px">'
        out<<'<div class="carousel carousel-stage">'
        out<<'<ul>'                                                                                       
        imagenes.each{
            out<<'<li><a href="#" data-toggle="modal" data-target="#myModal2" onclick="document.getElementById(\'frameImagenes\').src = \''+g.createLink([action:'file', controller:'documents', params:[numeroExpediente:attrs.numeroExpediente, path:it.ruta]])+'\'"><img src="'+g.createLink([action:'file', controller:'documents', params:[numeroExpediente:attrs.numeroExpediente, path:it.ruta]])+'" width="500" height="300" alt=""></a></li>'
        }
        out<<'</ul>'
        out<<'</div>'
        out<<'</div>'
        out<<'<div class="navigation">'
        out<<'<a href="#" class="prev prev-navigation" style="left: -35px">&lsaquo;</a>'
        out<<'<a href="#" class="next next-navigation">&rsaquo;</a>'
        out<<'<div class="carousel carousel-navigation">'
        out<<'<ul>'
        imagenes.each{
            out<<'<li><img src="'+g.createLink([action:'file', controller:'documents', params:[numeroExpediente:attrs.numeroExpediente, path:it.ruta]])+'" width="50" height="50" alt=""></li>'
        }
        out<<'</ul>'                                                                                   
        out<<'</div>'
        out<<'</div>'
        out<<'<div>'
        out<<'<input type="text" value="Imagen de aprobatoria,Imagen de la defensoria,Anexos al caso,Imagenes Refentes" data-role="tagsinput"/>'
        out<<'</div>'
        out<<'</div>'
        out<<'</div>'
                                                                                 
        out<<'<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="alignment-adjust:auto">'
        out<<'<div class="modal-dialog modal-lg">'
        out<<'<div class="modal-content" style="width:920px">'
        out<<'<div class="modal-header" style="width:920px">'
        out<<'<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'
        out<<'<h4 class="modal-title" id="myModalLabel">Fotografía</h4>'
        out<<'</div>'
        out<<'<div class="modal-body" style="width:900px; height:520px">'
        out<<'<div class="embed-responsive embed-responsive-16by9">'
        out<<'<iframe style="width:900px; height:520px" id="frameImagenes" class="embed-responsive-item" src="" allowfullscreen=""></iframe>'
        out<<'</div>'
        out<<'</div>'
        out<<'<div class="modal-footer" style="width:920px">'
        out<<'<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>'
        out<<'</div>'
        out<<'</div>'
        out<<'</div>'
        out<<'</div>'
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
        out<<g.uploadForm([controller:'documents',action:'upload',name:"fileUpload",name:"subirArchivo",id:"documentoProbatorios"],'<input type="hidden" id="folder" name="folder" value=""/><input type="hidden" id="tags" name="tags" value=""/><div class="fallback"><input type="file" name="file" multiple="" /></div>')
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
        out<<'<h2 class="pull-left">Archivos en : <span id="ruta"></span></h2><div class="filter-block pull-right" id="botones">'
        out<<'<a href="#" class="btn btn-primary " role="button" onclick="openUploadModal();"><i class="fa fa-cloud-upload fa-lg" style="color:white;"></i>Cargar archivos</a>'
        out<<'<a href="#" class="btn btn-primary " role="button" onclick="openCreateFolderModal();"><i class="fa fa-cloud-upload fa-lg"  style="color:white;"></i>Nueva carpeta</a>'
        out<<'</div></header>'
        out<<'<div class="main-box-body clearfix">'
        out<<'<div class="row">'        
        out<<'<div class="col-lg-5">'
        out<<'<div class="input-group">'
        out<<'<div class="input-group-btn">'
        out<<'<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Buscar <span class="caret"></span></button>'
        out<<'<ul class="dropdown-menu" role="menu">'
        out<<'<li class="divider"></li>'
        out<<'<li><a href="#" onclick="searchType(\''+attrs.numeroExpediente+'\',\'\')">Buscar</a></li>'
        out<<'<li class="divider"></li>'
        out<<'<li><a href="#" onclick="searchType(\''+attrs.numeroExpediente+'\',\'pdf\')">PDF</a></li>'
        out<<'<li><a href="#" onclick="searchType(\''+attrs.numeroExpediente+'\',\'img\')">Imagenes</a></li>'
        out<<'<li><a href="#" onclick="searchType(\''+attrs.numeroExpediente+'\',\'doc\')">Word</a></li>'
        out<<'<li><a href="#" onclick="searchType(\''+attrs.numeroExpediente+'\',\'excel\')">Excel</a></li>'        
        out<<'</ul>'
        out<<'</div>'
        out<<'<input type="text" class="form-control" aria-label="..." placeholder="Tag ..." id="tag">'
        out<<'</div>'
        out<<'</div>'
        out<<'</div>'
        out<<'<br/>'
        out<<'<div class="table-responsive clearfix">'
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
