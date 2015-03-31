<html>
    <head>
        <meta charset="utf-8">
        <meta name="layout" content="main"/>
        <meta http-equiv="Content-Type" content="text/html">
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'select2.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/bootstrap', file: 'bootstrap.min.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-default.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-style-growl.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-style-bar.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-style-attached.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-style-other.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-style-theme.css')}"/>

  <!--<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jstree/3.0.4/themes/default/style.min.css">-->

        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'jcarousel.connected-carousels.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'style.css')}"/>

        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap-tagsinput.css')}"/>
        <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/css/bootstrap.min.css">-->

        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'js-image-slider.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css/', file: 'tabs.css')}">

        <style type="text/css">
            #myTab{border-bottom-color: transparent; background-color: white;}
            #myTabArchivos{border-bottom-color: transparent; background-color: white;}            
        </style>
        
        <link href="${resource(dir: 'centaurus/assets/css/', file: 'video-default.css')}" rel="stylesheet">
        
        <style type="text/css">
            .not-active {
                cursor: no-drop;
             }
         </style> 
         
        <title>Detalles</title>
    </head>
    <body>
        <div class="row" style="opacity: 1;">
            <div class="col-lg-12">
                <div id="email-box" class="clearfix">
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="email-header-mobile" class="visible-xs visible-sm clearfix">
                                <div id="email-header-title-mobile" class="pull-left">
                                    <i class="fa fa-inbox"></i> Expedientes
                                </div>                                
                            </div>
                            <header id="email-header" class="clearfix">
                                <div id="email-header-title" class="visible-md visible-lg">
                                    <i class="fa fa-inbox"></i> Menú
                                </div>
                                <div id="email-header-tools" class="pull-right">                                   
                                    <a href="${request.contextPath}" class="btn btn-primary">                                            
                                        <span class="fa fa-chevron-left" style="padding-right: 10px;"></span> Regresar
                                    </a>
                                </div>
                                <!--<div id="email-header-pagination" class="pull-right">
                                    <div class="btn-group pagination pull-right">
                                        <button class="btn btn-primary" type="button" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Previous">
                                            <i class="fa fa-chevron-left"></i>
                                        </button>
                                        <button class="btn btn-primary" type="button" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Next">
                                            <i class="fa fa-chevron-right"></i>
                                        </button>
                                    </div>
                                    <div class="num-items pull-right hidden-xs">
                                        1-2 de 2
                                    </div>
                                </div>-->
                            </header>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">                                                     
                            <shiro:hasRole name="Juez">
                                <div id="email-detail" class="email-detail-nano has-scrollbar" style="min-height: 650px;">
                                    <div class="email-detail-nano-content" tabindex="0" style="right: -16px;">
                                        <div id="email-detail-inner">
                                            <div id="email-detail-subject" class="clearfix">
                                                <span class="subject">Caso: ${expediente.numeroExpediente}</span>
                                                <span class="label label-success">Capturado</span>
                                            </div>

                                            <div id="email-body">      
                                            </div>  
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="main-box clearfix">                                                    
                                                        <div class="main-box-body clearfix">
                                                            <div class="tabs-wrapper" style="background-color: white;">
                                                                <div class="board-inner">
                                                                    <ul class="nav nav-tabs" id="myTab">
                                                                        <div class="liner"></div>
                                                                        <li class="active">
                                                                            <a href="#tab-delito" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Delito">
                                                                                <span class="round-tabs one">
                                                                                    <i class="glyphicon glyphicon-fire"></i>
                                                                                </span> 
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="#tab-victima" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Víctima">
                                                                                <span class="round-tabs two">
                                                                                    <i class="glyphicon glyphicon-user"></i>
                                                                                </span> 
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="#tab-denunciante" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Denunciante">
                                                                                <span class="round-tabs three">
                                                                                    <i class="glyphicon glyphicon-bullhorn"></i>
                                                                                </span> 
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="#tab-responsable" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Imputado">
                                                                                <span class="round-tabs four">
                                                                                    <i class="glyphicon glyphicon-hand-right"></i>
                                                                                </span> 
                                                                            </a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <div class="tab-content">
                                                                    <div class="tab-pane fade in active" id="tab-delito">
                                                                        <br/>
                                                                        <h3>Datos del delito</h3>
                                                                        <div class="form-group">
                                                                            <label for="delito">Nombre</label>
                                                                            <input disabled="" type="text" class="form-control" name="clasificacionDelito.nombre" value="${expediente.delito.clasificacionDelito.nombre}">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Modalidad </label>
                                                                            <input disabled="" type="text" class="form-control" name="clasificacionDelito.modalidad" value="${expediente.delito.clasificacionDelito.modalidad}">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Modus</label>
                                                                            <input disabled="" type="text" class="form-control" name="clasificacionDelito.modus" value="${expediente.delito.clasificacionDelito.modus}">
                                                                        </div>
                                                                    </div>
                                                                    <div class="tab-pane fade" id="tab-victima">
                                                                        <br/>
                                                                        <h3>Datos de la víctima</h3>
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Nombre </label>
                                                                            <input disabled="" type="text" class="form-control" name="victima.nombre" value="${expediente.delito.victima.nombre}">
                                                                        </div>                                                
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Genero </label>
                                                                            <input disabled="" type="text" class="form-control" name="victima.genero" value="${expediente.delito.victima.genero}">
                                                                        </div>                                                
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Edad</label>
                                                                            <input disabled="" type="text" class="form-control" name="victima.edad" value="${expediente.delito.victima.edad}">
                                                                        </div>                                                
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Estado Civil</label>
                                                                            <input disabled="" type="text" class="form-control" name="victima.estadoCivil" value="${expediente.delito.victima.estadoCivil}">
                                                                        </div>                                                
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Escolaridad</label>
                                                                            <input disabled="" type="text" class="form-control" name="victima.escolaridad" value="${expediente.delito.victima.escolaridad}">
                                                                        </div>
                                                                    </div> 
                                                                    <div class="tab-pane fade" id="tab-denunciante">
                                                                        <br/>
                                                                        <h3>Datos del denunciante</h3>
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Nombre </label>
                                                                            <input disabled="" type="text" class="form-control" name="denunciante.nombre" value="${expediente.delito.denunciante.nombre}">
                                                                        </div>                                                
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Genero </label>
                                                                            <input disabled="" type="text" class="form-control" name="denunciante.genero" value="${expediente.delito.denunciante.genero}">
                                                                        </div>                                                
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Edad</label>
                                                                            <input disabled="" type="text" class="form-control" name="denunciante.edad" value="${expediente.delito.denunciante.edad}">
                                                                        </div>                                                
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Estado Civil</label>
                                                                            <input disabled="" type="text" class="form-control" name="denunciante.estadoCivil" value="${expediente.delito.denunciante.estadoCivil}">
                                                                        </div>                                                
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Escolaridad</label>
                                                                            <input disabled="" type="text" class="form-control" name="denunciante.escolaridad" value="${expediente.delito.denunciante.escolaridad}">
                                                                        </div>
                                                                    </div>                                                                    
                                                                    <div class="tab-pane fade" id="tab-responsable">
                                                                        <br/>
                                                                        <h3>Datos del imputado</h3>
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Nombre </label>
                                                                            <input disabled="" type="text" class="form-control" name="imputado.nombre" value="${expediente.delito.imputado.nombre}">
                                                                        </div>                                                
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Genero </label>
                                                                            <input disabled="" type="text" class="form-control" name="imputado.genero" value="${expediente.delito.imputado.genero}" >
                                                                        </div>                                                
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Edad</label>
                                                                            <input disabled="" type="text" class="form-control" name="imputado.edad" value="${expediente.delito.imputado.edad}">
                                                                        </div>                                                
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Estado Civil</label>
                                                                            <input disabled="" type="text" class="form-control" name="imputado.estadoCivil" value="${expediente.delito.imputado.estadoCivil}">
                                                                        </div>                                                
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Escolaridad</label>
                                                                            <input disabled="" type="text" class="form-control" name="imputado.escolaridad" value="${expediente.delito.imputado.escolaridad}">
                                                                        </div>
                                                                    </div>                                                                
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                                                                                                        
                                    </div>
                                <div class="nano-pane" style="display: none;"><div class="nano-slider" style="height: 611px; transform: translate(0px, 0px);"></div>
                                </div>
                             </div>                  
                        </shiro:hasRole>
                        <shiro:hasRole name="Ministerio">
                            <div id="email-detail" class="email-detail-nano has-scrollbar" style="min-height: 650px;">
                                <div class="email-detail-nano-content" tabindex="0" style="right: -16px;">
                                    <div id="email-detail-inner">
                                        <div id="email-detail-subject" class="clearfix">
                                            <span class="subject">${expediente.numeroExpediente}</span>
                                            <span class="label label-success">Capturado</span>
                                             <button type="button" class="btn btn-primary pull-right" style=" margin-left: 3px" data-toggle="modal" data-target="#myModalDefensor">Solicitar Defensor</button>&nbsp; 
                                             <button type="button" class="btn btn-primary pull-right" style=" margin-left: 3px" data-toggle="modal" data-target="#myModalCompartir">Compartir Documento</button>&nbsp; 
                                             <button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#myModalAudiencia">Solicitar Audiencia</button>
                                        </div>
                                        <div id="email-body">      
                                        </div>  
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="main-box clearfix">                                                    
                                                    <div class="main-box-body clearfix">
                                                        <div class="tabs-wrapper" style="background-color: white;">
                                                            <div class="board-inner">
                                                                <ul class="nav nav-tabs" id="myTab">
                                                                    <div class="liner"></div>
                                                                    <li class="active">
                                                                        <a href="#tab-delito" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Delito">
                                                                            <span class="round-tabs one">
                                                                                <i class="glyphicon glyphicon-fire"></i>
                                                                            </span> 
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#tab-victima" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Víctima">
                                                                            <span class="round-tabs two">
                                                                                <i class="glyphicon glyphicon-user"></i>
                                                                            </span> 
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#tab-denunciante" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Denunciante">
                                                                            <span class="round-tabs three">
                                                                                <i class="glyphicon glyphicon-bullhorn"></i>
                                                                            </span> 
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#tab-responsable" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Imputado">
                                                                            <span class="round-tabs four">
                                                                                <i class="glyphicon glyphicon-hand-right"></i>
                                                                            </span> 
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <div class="tab-content">
                                                                <div class="tab-pane fade in active" id="tab-delito">
                                                                    <br/>
                                                                    <h3>Datos del delito</h3>
                                                                    <div class="form-group">
                                                                        <label for="delito">Nombre</label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.nombre" value="${expediente.delito.clasificacionDelito.nombre}">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Modalidad </label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.modalidad" value="${expediente.delito.clasificacionDelito.modalidad}">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Modus</label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.modus" value="${expediente.delito.clasificacionDelito.modus}">
                                                                    </div>
                                                                </div>
                                                                <div class="tab-pane fade" id="tab-victima">
                                                                    <br/>
                                                                    <h3>Datos de la víctima</h3>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nombre </label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.nombre" value="${expediente.delito.victima.nombre}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Genero </label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.genero" value="${expediente.delito.victima.genero}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Edad</label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.edad" value="${expediente.delito.victima.edad}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Estado Civil</label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.estadoCivil" value="${expediente.delito.victima.estadoCivil}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Escolaridad</label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.escolaridad" value="${expediente.delito.victima.escolaridad}">
                                                                    </div>
                                                                </div>  
                                                                <div class="tab-pane fade" id="tab-denunciante">
                                                                    <br/>
                                                                    <h3>Datos del denunciante</h3>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nombre </label>
                                                                        <input disabled="" type="text" class="form-control" name="denunciante.nombre" value="${expediente.delito.denunciante.nombre}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Genero </label>
                                                                        <input disabled="" type="text" class="form-control" name="denunciante.genero" value="${expediente.delito.denunciante.genero}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Edad</label>
                                                                        <input disabled="" type="text" class="form-control" name="denunciante.edad" value="${expediente.delito.denunciante.edad}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Estado Civil</label>
                                                                        <input disabled="" type="text" class="form-control" name="denunciante.estadoCivil" value="${expediente.delito.denunciante.estadoCivil}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Escolaridad</label>
                                                                        <input disabled="" type="text" class="form-control" name="denunciante.escolaridad" value="${expediente.delito.denunciante.escolaridad}">
                                                                    </div>
                                                                </div>                                                                          
                                                                <div class="tab-pane fade" id="tab-responsable">
                                                                    <br/>
                                                                    <h3>Datos del imputado</h3>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nombre </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.nombre" value="${expediente.delito.imputado.nombre}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Genero </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.genero" value="${expediente.delito.imputado.genero}" >
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Edad</label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.edad" value="${expediente.delito.imputado.edad}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Estado Civil</label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.estadoCivil" value="${expediente.delito.imputado.estadoCivil}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Escolaridad</label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.escolaridad" value="${expediente.delito.imputado.escolaridad}">
                                                                    </div>
                                                                </div>                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="main-box clearfix">
                                                    <header class="main-box-header clearfix">                                                        
                                                        <h3>Documentos Relacionados</h3>
                                                    </header>
                                                    <div class="main-box-body clearfix">
                                                        <div class="row cf nestable-lists" id="user-profile">                                                            
                                                            <div class="col-lg-12" >                                                                
                                                                <div class="main-box clearfix">                                                    
                                                                    <div class="main-box-body clearfix">
                                                                        <div class="tabs-wrapper" style="background-color: white;">
                                                                            <div class="board-inner">
                                                                                <ul class="nav nav-tabs2" id="myTabArchivos">
                                                                                    <div class="liner2"></div>
                                                                                    <li class="active">
                                                                                        <a href="#tab-archivos" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Archivos">
                                                                                            <span class="round-tabs five">
                                                                                                <i class="glyphicon glyphicon-folder-open"></i>
                                                                                            </span> 
                                                                                        </a>
                                                                                    </li>
                                                                                    <li>
                                                                                        <a href="#tab-imagenes" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Imágenes">
                                                                                            <span class="round-tabs six">
                                                                                                <i class="glyphicon glyphicon-picture"></i>
                                                                                            </span> 
                                                                                        </a>
                                                                                    </li>
                                                                                    <li>
                                                                                        <a href="#tab-videos" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Vídeos">
                                                                                            <span class="round-tabs seven">
                                                                                                <i class="glyphicon glyphicon-facetime-video"></i>
                                                                                            </span> 
                                                                                        </a>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                            <div class="tab-content">
                                                                                <div class="tab-pane fade in active" id="tab-archivos">
                                                                                    <doc:explorerAndUpload numeroExpediente="${expediente.numeroExpediente}"/>
                                                                                </div>
                                                                                <div class="tab-pane fade" id="tab-imagenes">
                                                                                    <div class="wrapper" id="divImagenes">            
                                                                                        <div class="connected-carousels">                                                                    
                                                                                            <div class="stage" style="width:500px; height:300px">
                                                                                                <div class="carousel carousel-stage">
                                                                                                    <ul>                                                                                       
                                                                                                        <li><a href="#" data-toggle="modal" data-target="#myModal2" onclick="document.getElementById('frameImagenes').src = '${resource(dir: 'images/img', file: 'img1.jpg')}'"><img src="${resource(dir: 'images/img', file: 'img1.jpg')}" width="500" height="300" alt=""></a></li>
                                                                                                        <li><a href="#" data-toggle="modal" data-target="#myModal2" onclick="document.getElementById('frameImagenes').src = '${resource(dir: 'images/img', file: 'img2.jpg')}'"><img src="${resource(dir: 'images/img', file: 'img2.jpg')}" width="500" height="300" alt=""></a></li>
                                                                                                        <li><a href="#" data-toggle="modal" data-target="#myModal2" onclick="document.getElementById('frameImagenes').src = '${resource(dir: 'images/img', file: 'img3.jpg')}'"><img src="${resource(dir: 'images/img', file: 'img3.jpg')}" width="500" height="300" alt=""></a></li>
                                                                                                        <li><a href="#" data-toggle="modal" data-target="#myModal2" onclick="document.getElementById('frameImagenes').src = '${resource(dir: 'images/img', file: 'img4.jpg')}'"><img src="${resource(dir: 'images/img', file: 'img4.jpg')}" width="500" height="300" alt=""></a></li>
                                                                                                    </ul>
                                                                                                </div>
                                                                                                    <!--<a href="#" class="prev prev-stage" style="left: 270px"><span>&lsaquo;</span></a>
                                                                                                    <a href="#" class="next next-stage"><span>&rsaquo;</span></a> -->                                                                          
                                                                                            </div>
                                                                                            <div class="navigation">
                                                                                                <a href="#" class="prev prev-navigation" style="left: -35px">&lsaquo;</a>
                                                                                                <a href="#" class="next next-navigation">&rsaquo;</a>
                                                                                                <div class="carousel carousel-navigation">
                                                                                                    <ul>
                                                                                                        <li><img src="${resource(dir: 'images/img', file: 'img1_thumb.jpg')}" width="50" height="50" alt=""></li>
                                                                                                        <li><img src="${resource(dir: 'images/img', file: 'img2_thumb.jpg')}" width="50" height="50" alt=""></li>
                                                                                                        <li><img src="${resource(dir: 'images/img', file: 'img3_thumb.jpg')}" width="50" height="50" alt=""></li>
                                                                                                        <li><img src="${resource(dir: 'images/img', file: 'img4_thumb.jpg')}" width="50" height="50" alt=""></li>
                                                                                                    </ul>                                                                                   
                                                                                                </div>  
                                                                                            </div>
                                                                                            <div>
                                                                                                <input type="text" value="Imagen de aprobatoria,Imagen de la defensoria,Anexos al caso,Imagenes Refentes" data-role="tagsinput"/>
                                                                                            </div>  
                                                                                        </div>
                                                                                    </div>
                                                                                 <!--Fin Modal-->                                                                         
                                                                                <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="alignment-adjust:auto">
                                                                                    <div class="modal-dialog modal-lg">
                                                                                        <div class="modal-content" style="width:920px">
                                                                                            <div class="modal-header" style="width:920px">
                                                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                                                <h4 class="modal-title" id="myModalLabel">Fotografía</h4>
                                                                                            </div>
                                                                                            <div class="modal-body" style="width:900px; height:520px">
                                                                                                <div class="embed-responsive embed-responsive-16by9">
                                                                                                    <iframe style="width:900px; height:520px" id="frameImagenes" class="embed-responsive-item" src="" allowfullscreen=""></iframe>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="modal-footer" style="width:920px">
                                                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div> 
                                                                                </div>  
                                                                          <!--Fin Modal-->
                                                                                </div>
                                                                                <div class="tab-pane fade" id="tab-videos">
                                                                                    <div class="col-lg-12">
                                                                                        <div class="col-md-6 dd">
                                                                                            <div>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video1.mp4'">1.- Introducción</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video2.mp4'">2.- Audiencia Inicial</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video3.mp4'">3.- Apertura de la audiencia</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video4.mp4'">4.- Control de la detención</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video5.mp4'">5.- Formulación de la imputación y declaración del imputado</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video6.mp4'">6.- Vinculación a proceso</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video7.mp4'">7.- Medidas cautelares</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video8.mp4'">8.- Plazo de cierre de la investigación</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video9.mp4'">9.- Ultimas manifestaciones y cierre de la audiencia</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video10.mp4'">10.- Etapa intermedia</a></b>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-md-6 dd">
                                                                                                </br>
                                                                                            <div class="videoUiWrapper thumbnail">
                                                                                              <video width="483" height="282" id="demo1">
                                                                                                <source src="http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video1.mp4" type="video/mp4">
                                                                                                Your browser does not support the video tag.
                                                                                              </video>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>   
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>                                                                                                                        
                                        </div>
                                    </div>
                                    <div class="nano-pane" style="display: none;"><div class="nano-slider" style="height: 611px; transform: translate(0px, 0px);"></div>
                                    </div>
                                </div>     
                            </div>                       
                        </shiro:hasRole>
                        <shiro:hasRole name="Defensor">
                            <div id="email-detail" class="email-detail-nano has-scrollbar" style="height: 627px;">
                                <div class="email-detail-nano-content" tabindex="0" style="right: -16px;">
                                    <div id="email-detail-inner">
                                        <div id="email-detail-subject" class="clearfix">
                                            <span class="subject">${expediente.numeroExpediente}</span>
                                            <span class="label label-success">Capturado</span>
                                            <button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#myModalCompartirDef">Compartir Documento</button>
                                        </div>

                                        <div id="email-body">      
                                        </div>  
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="main-box clearfix">                                                    
                                                    <div class="main-box-body clearfix">
                                                        <div class="tabs-wrapper" style="background-color: white;">
                                                            <div class="board-inner">
                                                                <ul class="nav nav-tabs" id="myTab">
                                                                    <div class="liner"></div>
                                                                    <li class="active">
                                                                        <a href="#tab-delito" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Delito">
                                                                            <span class="round-tabs one">
                                                                                <i class="glyphicon glyphicon-fire"></i>
                                                                            </span> 
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#tab-victima" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Víctima">
                                                                            <span class="round-tabs two">
                                                                                <i class="glyphicon glyphicon-user"></i>
                                                                            </span> 
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#tab-denunciante" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Denunciante">
                                                                            <span class="round-tabs three">
                                                                                <i class="glyphicon glyphicon-bullhorn"></i>
                                                                            </span> 
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#tab-responsable" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Imputado">
                                                                            <span class="round-tabs four">
                                                                                <i class="glyphicon glyphicon-hand-right"></i>
                                                                            </span> 
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <div class="tab-content">
                                                                <div class="tab-pane fade in active" id="tab-delito">
                                                                    <br/>
                                                                    <h3>Datos del delito</h3>
                                                                    <div class="form-group">
                                                                        <label for="delito">Nombre</label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.nombre" value="${expediente.delito.clasificacionDelito.nombre}">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Modalidad </label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.modalidad" value="${expediente.delito.clasificacionDelito.modalidad}">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Modus</label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.modus" value="${expediente.delito.clasificacionDelito.modus}">
                                                                    </div>
                                                                </div>
                                                                <div class="tab-pane fade" id="tab-victima">
                                                                    <br/>
                                                                    <h3>Datos de la víctima</h3>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nombre </label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.nombre" value="${expediente.delito.victima.nombre}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Genero </label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.genero" value="${expediente.delito.victima.genero}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Edad</label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.edad" value="${expediente.delito.victima.edad}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Estado Civil</label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.estadoCivil" value="${expediente.delito.victima.estadoCivil}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Escolaridad</label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.escolaridad" value="${expediente.delito.victima.escolaridad}">
                                                                    </div>
                                                                </div>   
                                                                <div class="tab-pane fade" id="tab-denunciante">
                                                                    <br/>
                                                                    <h3>Datos del denunciante</h3>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nombre </label>
                                                                        <input disabled="" type="text" class="form-control" name="denunciante.nombre" value="${expediente.delito.denunciante.nombre}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Genero </label>
                                                                        <input disabled="" type="text" class="form-control" name="denunciante.genero" value="${expediente.delito.denunciante.genero}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Edad</label>
                                                                        <input disabled="" type="text" class="form-control" name="denunciante.edad" value="${expediente.delito.denunciante.edad}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Estado Civil</label>
                                                                        <input disabled="" type="text" class="form-control" name="denunciante.estadoCivil" value="${expediente.delito.denunciante.estadoCivil}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Escolaridad</label>
                                                                        <input disabled="" type="text" class="form-control" name="denunciante.escolaridad" value="${expediente.delito.denunciante.escolaridad}">
                                                                    </div>
                                                                </div>                                                                         
                                                                <div class="tab-pane fade" id="tab-responsable">
                                                                    <br/>
                                                                    <h3>Datos del imputado</h3>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nombre </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.nombre" value="${expediente.delito.imputado.nombre}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Genero </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.genero" value="${expediente.delito.imputado.genero}" >
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Edad</label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.edad" value="${expediente.delito.imputado.edad}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Estado Civil</label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.estadoCivil" value="${expediente.delito.imputado.estadoCivil}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Escolaridad</label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.escolaridad" value="${expediente.delito.imputado.escolaridad}">
                                                                    </div>
                                                                </div>                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <!--<div id="div_aceptar_rechazar">
                                                    <button type="button" onclick="aceptarCaso()" class="btn btn-primary">Aceptar caso</button>
                                                    <a href="${request.contextPath}" class="btn btn-danger">Rechazar caso</a>
                                                    </br></br></br></br></br></br></br>
                                                </div>-->
                                                <div class="main-box clearfix" id="div_archivos">
                                                    <header class="main-box-header clearfix">                                                        
                                                        <h3>Archivos</h3>
                                                    </header>
                                                    <div class="main-box-body clearfix">
                                                        <div class="row cf nestable-lists" id="user-profile">                                                            
                                                            <div class="col-lg-12" >                                                                
                                                                <div class="main-box clearfix">                                                    
                                                                    <div class="main-box-body clearfix">
                                                                        <div class="tabs-wrapper" style="background-color: white;">
                                                                            <div class="board-inner">
                                                                                <ul class="nav nav-tabs2" id="myTabArchivos">
                                                                                    <div class="liner2"></div>
                                                                                    <li class="active">
                                                                                        <a href="#tab-archivos" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Archivos">
                                                                                            <span class="round-tabs five">
                                                                                                <i class="glyphicon glyphicon-folder-open"></i>
                                                                                            </span> 
                                                                                        </a>
                                                                                    </li>
                                                                                    <li>
                                                                                        <a href="#tab-imagenes" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Imágenes">
                                                                                            <span class="round-tabs six">
                                                                                                <i class="glyphicon glyphicon-picture"></i>
                                                                                            </span> 
                                                                                        </a>
                                                                                    </li>
                                                                                    <li>
                                                                                        <a href="#tab-videos" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Vídeos">
                                                                                            <span class="round-tabs seven">
                                                                                                <i class="glyphicon glyphicon-facetime-video"></i>
                                                                                            </span> 
                                                                                        </a>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                            <div class="tab-content">
                                                                                <div class="tab-pane fade in active" id="tab-archivos">
                                                                                    <doc:explorerAndUpload numeroExpediente="${expediente.numeroExpediente}"/>
                                                                                </div>
                                                                                <div class="tab-pane fade" id="tab-imagenes">
                                                                                    <div class="wrapper" id="divImagenes">            
                                                                                        <div class="connected-carousels">                                                                    
                                                                                            <div class="stage" style="width:500px; height:300px">
                                                                                                <div class="carousel carousel-stage">
                                                                                                    <ul>                                                                                       
                                                                                                        <li><a href="#" data-toggle="modal" data-target="#myModal2" onclick="document.getElementById('frameImagenes').src = '${resource(dir: 'images/img', file: 'img1.jpg')}'"><img src="${resource(dir: 'images/img', file: 'img1.jpg')}" width="500" height="300" alt=""></a></li>
                                                                                                        <li><a href="#" data-toggle="modal" data-target="#myModal2" onclick="document.getElementById('frameImagenes').src = '${resource(dir: 'images/img', file: 'img2.jpg')}'"><img src="${resource(dir: 'images/img', file: 'img2.jpg')}" width="500" height="300" alt=""></a></li>
                                                                                                        <li><a href="#" data-toggle="modal" data-target="#myModal2" onclick="document.getElementById('frameImagenes').src = '${resource(dir: 'images/img', file: 'img3.jpg')}'"><img src="${resource(dir: 'images/img', file: 'img3.jpg')}" width="500" height="300" alt=""></a></li>
                                                                                                        <li><a href="#" data-toggle="modal" data-target="#myModal2" onclick="document.getElementById('frameImagenes').src = '${resource(dir: 'images/img', file: 'img4.jpg')}'"><img src="${resource(dir: 'images/img', file: 'img4.jpg')}" width="500" height="300" alt=""></a></li>
                                                                                                    </ul>
                                                                                                </div>
                                                                                                    <!--<a href="#" class="prev prev-stage" style="left: 270px"><span>&lsaquo;</span></a>
                                                                                                    <a href="#" class="next next-stage"><span>&rsaquo;</span></a> -->                                                                          
                                                                                            </div>
                                                                                            <div class="navigation">
                                                                                                <a href="#" class="prev prev-navigation" style="left: -35px">&lsaquo;</a>
                                                                                                <a href="#" class="next next-navigation">&rsaquo;</a>
                                                                                                <div class="carousel carousel-navigation">
                                                                                                    <ul>
                                                                                                        <li><img src="${resource(dir: 'images/img', file: 'img1_thumb.jpg')}" width="50" height="50" alt=""></li>
                                                                                                        <li><img src="${resource(dir: 'images/img', file: 'img2_thumb.jpg')}" width="50" height="50" alt=""></li>
                                                                                                        <li><img src="${resource(dir: 'images/img', file: 'img3_thumb.jpg')}" width="50" height="50" alt=""></li>
                                                                                                        <li><img src="${resource(dir: 'images/img', file: 'img4_thumb.jpg')}" width="50" height="50" alt=""></li>
                                                                                                    </ul>                                                                                   
                                                                                                </div>  
                                                                                            </div>
                                                                                            <div>
                                                                                                <input type="text" value="Imagen de aprobatoria,Imagen de la defensoria,Anexos al caso,Imagenes Refentes" data-role="tagsinput"/>
                                                                                            </div>  
                                                                                        </div>
                                                                                    </div>
                                                                                 <!--Fin Modal-->                                                                         
                                                                                <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="alignment-adjust:auto">
                                                                                    <div class="modal-dialog modal-lg">
                                                                                        <div class="modal-content" style="width:920px">
                                                                                            <div class="modal-header" style="width:920px">
                                                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                                                <h4 class="modal-title" id="myModalLabel">Fotografía</h4>
                                                                                            </div>
                                                                                            <div class="modal-body" style="width:900px; height:520px">
                                                                                                <div class="embed-responsive embed-responsive-16by9">
                                                                                                    <iframe style="width:900px; height:520px" id="frameImagenes" class="embed-responsive-item" src="" allowfullscreen=""></iframe>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="modal-footer" style="width:920px">
                                                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div> 
                                                                                </div>  
                                                                          <!--Fin Modal-->
                                                                                </div>
                                                                                <div class="tab-pane fade" id="tab-videos">
                                                                                    <div class="col-lg-12">
                                                                                        <div class="col-md-6 dd">
                                                                                            <div>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video1.mp4'">1.- Introducción</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video2.mp4'">2.- Audiencia Inicial</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video3.mp4'">3.- Apertura de la audiencia</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video4.mp4'">4.- Control de la detención</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video5.mp4'">5.- Formulación de la imputación y declaración del imputado</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video6.mp4'">6.- Vinculación a proceso</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video7.mp4'">7.- Medidas cautelares</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video8.mp4'">8.- Plazo de cierre de la investigación</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video9.mp4'">9.- Ultimas manifestaciones y cierre de la audiencia</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video10.mp4'">10.- Etapa intermedia</a></b>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-md-6 dd">
                                                                                                </br>
                                                                                            <div class="videoUiWrapper thumbnail">
                                                                                              <video width="483" height="282" id="demo1">
                                                                                                <source src="http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video1.mp4" type="video/mp4">
                                                                                                Your browser does not support the video tag.
                                                                                              </video>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>   
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                                                                                                        
                                    </div>
                                </div>
                                <div class="nano-pane" style="display: none;"><div class="nano-slider" style="height: 611px; transform: translate(0px, 0px);"></div>
                                </div>
                            </div>                            
                        </shiro:hasRole>
                        <shiro:hasRole name="CES">
                            <div id="email-detail" class="email-detail-nano has-scrollbar" style="height: 627px;">
                                <div class="email-detail-nano-content" tabindex="0" style="right: -16px;">
                                    <div id="email-detail-inner">
                                        <div id="email-detail-subject" class="clearfix">
                                            <span class="subject">${expediente.numeroExpediente}</span>
                                            <span class="label label-success">Capturado</span>
                                            <button type="button" class="btn btn-primary pull-right" data-toggle="modal" style=" margin-left: 3px" data-target="#myModalCompartir">Compartir Documento</button> 
                                            <button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#myModalDefensor">Solicitar Defensor</button>
                                        </div>

                                        <div id="email-body">      
                                        </div>  
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="main-box clearfix">                                                    
                                                    <div class="main-box-body clearfix">
                                                        <div class="tabs-wrapper" style="background-color: white;">
                                                            <div class="board-inner">
                                                                <ul class="nav nav-tabs" id="myTab">
                                                                    <div class="liner"></div>
                                                                    <li class="active">
                                                                        <a href="#tab-delito" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Delito">
                                                                            <span class="round-tabs one">
                                                                                <i class="glyphicon glyphicon-fire"></i>
                                                                            </span> 
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#tab-victima" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Víctima">
                                                                            <span class="round-tabs two">
                                                                                <i class="glyphicon glyphicon-user"></i>
                                                                            </span> 
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#tab-denunciante" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Denunciante">
                                                                            <span class="round-tabs three">
                                                                                <i class="glyphicon glyphicon-bullhorn"></i>
                                                                            </span> 
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#tab-responsable" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Imputado">
                                                                            <span class="round-tabs four">
                                                                                <i class="glyphicon glyphicon-hand-right"></i>
                                                                            </span> 
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <div class="tab-content">
                                                                <div class="tab-pane fade in active" id="tab-delito">
                                                                    <br/>
                                                                    <h3>Datos del delito</h3>
                                                                    <div class="form-group">
                                                                        <label for="delito">Nombre</label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.nombre" value="${expediente.delito.clasificacionDelito.nombre}">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Modalidad </label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.modalidad" value="${expediente.delito.clasificacionDelito.modalidad}">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Modus</label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.modus" value="${expediente.delito.clasificacionDelito.modus}">
                                                                    </div>
                                                                </div>
                                                                <div class="tab-pane fade" id="tab-victima">
                                                                    <br/>
                                                                    <h3>Datos de la víctima</h3>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nombre </label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.nombre" value="${expediente.delito.victima.nombre}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Genero </label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.genero" value="${expediente.delito.victima.genero}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Edad</label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.edad" value="${expediente.delito.victima.edad}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Estado Civil</label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.estadoCivil" value="${expediente.delito.victima.estadoCivil}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Escolaridad</label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.escolaridad" value="${expediente.delito.victima.escolaridad}">
                                                                    </div>
                                                                </div>   
                                                                <div class="tab-pane fade" id="tab-denunciante">
                                                                    <br/>
                                                                    <h3>Datos del denunciante</h3>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nombre </label>
                                                                        <input disabled="" type="text" class="form-control" name="denunciante.nombre" value="${expediente.delito.denunciante.nombre}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Genero </label>
                                                                        <input disabled="" type="text" class="form-control" name="denunciante.genero" value="${expediente.delito.denunciante.genero}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Edad</label>
                                                                        <input disabled="" type="text" class="form-control" name="denunciante.edad" value="${expediente.delito.denunciante.edad}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Estado Civil</label>
                                                                        <input disabled="" type="text" class="form-control" name="denunciante.estadoCivil" value="${expediente.delito.denunciante.estadoCivil}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Escolaridad</label>
                                                                        <input disabled="" type="text" class="form-control" name="denunciante.escolaridad" value="${expediente.delito.denunciante.escolaridad}">
                                                                    </div>
                                                                </div>                                                                         
                                                                <div class="tab-pane fade" id="tab-responsable">
                                                                    <br/>
                                                                    <h3>Datos del imputado</h3>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nombre </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.nombre" value="${expediente.delito.imputado.nombre}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Genero </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.genero" value="${expediente.delito.imputado.genero}" >
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Edad</label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.edad" value="${expediente.delito.imputado.edad}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Estado Civil</label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.estadoCivil" value="${expediente.delito.imputado.estadoCivil}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Escolaridad</label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.escolaridad" value="${expediente.delito.imputado.escolaridad}">
                                                                    </div>
                                                                </div>                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                                                                                                     
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="main-box clearfix">
                                                    <header class="main-box-header clearfix">                                                       
                                                        <h3>Documentos Relacionados</h3>
                                                    </header>
                                                    <div class="main-box-body clearfix">
                                                        <div class="row cf nestable-lists" id="user-profile">                                                            
                                                            <div class="col-lg-12" >                                                                
                                                                <div class="main-box clearfix">                                                    
                                                                    <div class="main-box-body clearfix">
                                                                        <div class="tabs-wrapper" style="background-color: white;">
                                                                            <div class="board-inner">
                                                                                <ul class="nav nav-tabs2" id="myTabArchivos">
                                                                                    <div class="liner2"></div>
                                                                                    <li class="active">
                                                                                        <a href="#tab-archivos" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Archivos">
                                                                                            <span class="round-tabs five">
                                                                                                <i class="glyphicon glyphicon-folder-open"></i>
                                                                                            </span> 
                                                                                        </a>
                                                                                    </li>
                                                                                    <li>
                                                                                        <a href="#tab-imagenes" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Imágenes">
                                                                                            <span class="round-tabs six">
                                                                                                <i class="glyphicon glyphicon-picture"></i>
                                                                                            </span> 
                                                                                        </a>
                                                                                    </li>
                                                                                    <li>
                                                                                        <a href="#tab-videos" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Vídeos">
                                                                                            <span class="round-tabs seven">
                                                                                                <i class="glyphicon glyphicon-facetime-video"></i>
                                                                                            </span> 
                                                                                        </a>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                            <div class="tab-content">
                                                                                <div class="tab-pane fade in active" id="tab-archivos">
                                                                                    <doc:explorerAndUpload numeroExpediente="${expediente.numeroExpediente}"/>
                                                                                </div>
                                                                                <div class="tab-pane fade" id="tab-imagenes">
                                                                                    <div class="wrapper" id="divImagenes">            
                                                                                        <div class="connected-carousels">                                                                    
                                                                                            <div class="stage" style="width:500px; height:300px">
                                                                                                <div class="carousel carousel-stage">
                                                                                                    <ul>                                                                                       
                                                                                                        <li><a href="#" data-toggle="modal" data-target="#myModal2" onclick="document.getElementById('frameImagenes').src = '${resource(dir: 'images/img', file: 'img1.jpg')}'"><img src="${resource(dir: 'images/img', file: 'img1.jpg')}" width="500" height="300" alt=""></a></li>
                                                                                                        <li><a href="#" data-toggle="modal" data-target="#myModal2" onclick="document.getElementById('frameImagenes').src = '${resource(dir: 'images/img', file: 'img2.jpg')}'"><img src="${resource(dir: 'images/img', file: 'img2.jpg')}" width="500" height="300" alt=""></a></li>
                                                                                                        <li><a href="#" data-toggle="modal" data-target="#myModal2" onclick="document.getElementById('frameImagenes').src = '${resource(dir: 'images/img', file: 'img3.jpg')}'"><img src="${resource(dir: 'images/img', file: 'img3.jpg')}" width="500" height="300" alt=""></a></li>
                                                                                                        <li><a href="#" data-toggle="modal" data-target="#myModal2" onclick="document.getElementById('frameImagenes').src = '${resource(dir: 'images/img', file: 'img4.jpg')}'"><img src="${resource(dir: 'images/img', file: 'img4.jpg')}" width="500" height="300" alt=""></a></li>
                                                                                                    </ul>
                                                                                                </div>
                                                                                                    <!--<a href="#" class="prev prev-stage" style="left: 270px"><span>&lsaquo;</span></a>
                                                                                                    <a href="#" class="next next-stage"><span>&rsaquo;</span></a> -->                                                                          
                                                                                            </div>
                                                                                            <div class="navigation">
                                                                                                <a href="#" class="prev prev-navigation" style="left: -35px">&lsaquo;</a>
                                                                                                <a href="#" class="next next-navigation">&rsaquo;</a>
                                                                                                <div class="carousel carousel-navigation">
                                                                                                    <ul>
                                                                                                        <li><img src="${resource(dir: 'images/img', file: 'img1_thumb.jpg')}" width="50" height="50" alt=""></li>
                                                                                                        <li><img src="${resource(dir: 'images/img', file: 'img2_thumb.jpg')}" width="50" height="50" alt=""></li>
                                                                                                        <li><img src="${resource(dir: 'images/img', file: 'img3_thumb.jpg')}" width="50" height="50" alt=""></li>
                                                                                                        <li><img src="${resource(dir: 'images/img', file: 'img4_thumb.jpg')}" width="50" height="50" alt=""></li>
                                                                                                    </ul>                                                                                   
                                                                                                </div>  
                                                                                            </div>
                                                                                            <div>
                                                                                                <input type="text" value="Imagen de aprobatoria,Imagen de la defensoria,Anexos al caso,Imagenes Refentes" data-role="tagsinput"/>
                                                                                            </div>  
                                                                                        </div>
                                                                                    </div>
                                                                                 <!--Fin Modal-->                                                                         
                                                                                <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="alignment-adjust:auto">
                                                                                    <div class="modal-dialog modal-lg">
                                                                                        <div class="modal-content" style="width:920px">
                                                                                            <div class="modal-header" style="width:920px">
                                                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                                                <h4 class="modal-title" id="myModalLabel">Fotografía</h4>
                                                                                            </div>
                                                                                            <div class="modal-body" style="width:900px; height:520px">
                                                                                                <div class="embed-responsive embed-responsive-16by9">
                                                                                                    <iframe style="width:900px; height:520px" id="frameImagenes" class="embed-responsive-item" src="" allowfullscreen=""></iframe>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="modal-footer" style="width:920px">
                                                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div> 
                                                                                </div>  
                                                                          <!--Fin Modal-->
                                                                                </div>
                                                                                <div class="tab-pane fade" id="tab-videos">
                                                                                    <div class="col-lg-12">
                                                                                        <div class="col-md-6 dd">
                                                                                            <div>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video1.mp4'">1.- Introducción</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video2.mp4'">2.- Audiencia Inicial</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video3.mp4'">3.- Apertura de la audiencia</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video4.mp4'">4.- Control de la detención</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video5.mp4'">5.- Formulación de la imputación y declaración del imputado</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video6.mp4'">6.- Vinculación a proceso</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video7.mp4'">7.- Medidas cautelares</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video8.mp4'">8.- Plazo de cierre de la investigación</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video9.mp4'">9.- Ultimas manifestaciones y cierre de la audiencia</a></b>
                                                                                                </br>
                                                                                                <b><a href="#" onclick="document.getElementById('demo1').src = 'http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video10.mp4'">10.- Etapa intermedia</a></b>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-md-6 dd">
                                                                                                </br>
                                                                                            <div class="videoUiWrapper thumbnail">
                                                                                              <video width="483" height="282" id="demo1">
                                                                                                <source src="http://www.setec.gob.mx/work/models/SETEC/Macroflujo_conceptual/videos/video1.mp4" type="video/mp4">
                                                                                                Your browser does not support the video tag.
                                                                                              </video>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>   
                                                    </div>
                                                </div>
                                            </div>                                                                                                                        
                                        </div>                                                                                                                        
                                    </div>
                                </div>
                                <div class="nano-pane" style="display: none;"><div class="nano-slider" style="height: 611px; transform: translate(0px, 0px);"></div>
                                </div>
                            </div>     
                        </shiro:hasRole>
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">Grabacion de la Audiencia</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="embed-responsive embed-responsive-16by9">
                                            <iframe class="embed-responsive-item" src="//player.vimeo.com/video/73437656" allowfullscreen=""></iframe>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <!--Modal-->
                        <div class="modal fade" id="myModalPlantillas" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">Plantillas</h4>
                                    </div>
                                    <div class="modal-body">
                                        <li>
                                            <a href=${resource(dir: 'Plantillas', file: 'PlantillaIph.docx')} title="Descargar">
                                                <span class="fa fa-file-word-o" style="padding-right: 10px;"></span> Plantilla IPH
                                            </a>
                                        </li>
                                        <li>
                                            <a href=${resource(dir: 'Plantillas', file: 'PlantillaDenuncia.docx')} title="Descargar">
                                                <span class="fa fa-file-word-o" style="padding-right: 10px;"></span> Plantilla Denuncia
                                            </a>
                                        </li>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                  <!--Fin Modal--> 
                        <!--    -->
                        <div class="modal fade" id="myModalDefensor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <g:form name="formAsignar">  
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel">Solicitar Defensor</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form role="form">
                                                <div class="form-group form-group-select2">
                                                    <label>Asignar a:</label>
                                                    <input type="hidden" name="expedienteId2" value="${expediente.id}">
                                                    <select style="width:570px" name="listDefensor" id="listDefensor" multiple>
                                                        <g:each in="${defensores}" var="defensor" status="i">
                                                            <option value="${defensor.username}">${defensor.institucion} - ${defensor.puesto} - ${defensor.nombre}</option>
                                                        </g:each>
                                                    </select>
                                                </div>
                                            </form>        
                                        </div> 
                                        <div class="modal-footer">
                                            <textarea class="form-control" rows="3" name="comment" id="comment" placeholder="Mensaje (Opcional)"></textarea>
                                            </br>
                                            <!--<a data-dismiss="modal" href="#"  class="btn btn-primary" id="notificacionDefensor">                                            
                                                 <span  style="padding-right: 10px;"></span> Aceptar
                                             </a>  --> 
                                            <g:actionSubmit id="btnModalAsignar" class="btn btn-primary" value="Aceptar" action="asignarDefensor" controller="home"/>
                                            <a data-dismiss="modal" class="btn btn-danger">                                             
                                                <span style="padding-right: 10px;"></span> Cancelar
                                            </a>
                                        </div> 
                                    </div>
                                </div>
                            </g:form>
                        </div>
                <!-- -->                                                        
                        <div class="modal fade" id="myModalCompartir" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <g:form name="formCompartir">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel">Compartir Documento</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form role="form">
                                                <div class="form-group form-group-select2">
                                                    <label>Compartir a:</label>
                                                    <input type="hidden" name="expedienteId" value="${expediente.id}">
                                                    <select style="width:570px" name="listCompartir" id="listCompartir" multiple >
                                                        <g:each in="${usuarios}" var="usuario" status="i">
                                                            <option value="${usuario.username}">${usuario.institucion} - ${usuario.puesto} - ${usuario.nombre}</option>
                                                        </g:each>
                                                    </select>
                                                </div>
                                            </form>      
                                        </div>
                                        <div class="modal-footer">                                                                           
                                            <textarea class="form-control" rows="3" name="commentCompartir" id="commentCompartir" placeholder="Mensaje (Opcional)"></textarea>
                                            </br>
                                             <!--<a data-dismiss="modal" class="btn btn-primary" id="notificacionCompartir">                                            
                                                 <span  style="padding-right: 10px;"></span> Aceptar
                                             </a> -->  
                                            <g:actionSubmit id="btnModalCompartir" class="btn btn-primary" value="Aceptar" action="compartirExpediente" controller="home"/>
                                            <a data-dismiss="modal" class="btn btn-danger">                                            
                                                <span style="padding-right: 10px;"></span> Cancelar
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </g:form>
                        </div>
                     <!--  -->                                                 
                        <div class="modal fade" id="myModalCompartirDef" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <g:form name="formCompartirDef">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel">Compartir Documento</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form role="form">
                                                <div class="form-group form-group-select2">
                                                    <label>Compartir a:</label>
                                                    <input type="hidden" name="expedienteId3" value="${expediente.id}">
                                                    <select style="width:570px" name="listCompartirDef" id="listCompartirDef" multiple >
                                                        <g:each in="${usuariosDef}" var="usuario" status="i">
                                                            <option value="${usuario.username}">${usuario.institucion} - ${usuario.puesto} - ${usuario.nombre}</option>
                                                        </g:each>
                                                    </select>
                                                </div>
                                            </form>      
                                        </div>
                                        <div class="modal-footer">                                                                           
                                            <textarea class="form-control" rows="3" name="commentCompartirDef" id="commentCompartirDef" placeholder="Mensaje (Opcional)"></textarea>
                                            </br>
                                             <!--<a data-dismiss="modal" class="btn btn-primary" id="notificacionCompartir">                                            
                                                 <span  style="padding-right: 10px;"></span> Aceptar
                                             </a> -->  
                                            <g:actionSubmit id="btnModalCompartirDef" class="btn btn-primary" value="Aceptar" action="compartirExpedienteDef" controller="home"/>
                                            <a data-dismiss="modal" class="btn btn-danger">                                            
                                                <span style="padding-right: 10px;"></span> Cancelar
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </g:form>
                        </div>
                     <!--  --> 
                     <!-- -->                                                        
                        <div class="modal fade" id="myModalAudiencia" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <g:form name="formCompartir">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel">Solicitar Audiencia</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form role="form">
                                                <input type="hidden" name="expedienteId4" value="${expediente.id}">
                                                <div class="form-group form-group-select2">
                                                    <label>Tipo de Audiencia:</label>
                                                    <select style="width:570px" class="form-control" name="listAudiencia" id="listAudiencia">
                                                        <option value="Audiencia privada">Audiencia privada</option>
                                                        <option value="Vinculación al proceso">Vinculación al proceso</option>
                                                    </select>
                                                </div>
                                            </form>      
                                        </div>
                                        <div class="modal-footer">                                                                           
                                            <textarea class="form-control" rows="3" name="commentAudiencia" id="commentAudiencia" placeholder="Mensaje (Opcional)"></textarea>
                                            </br>
                                             <!--<a data-dismiss="modal" class="btn btn-primary" id="notificacionCompartir">                                            
                                                 <span  style="padding-right: 10px;"></span> Aceptar
                                             </a> -->  
                                            <g:actionSubmit id="btnModalAudiencia" class="btn btn-primary" value="Aceptar" action="solicitarAudiencia" controller="home"/>
                                            <a data-dismiss="modal" class="btn btn-danger">                                            
                                                <span style="padding-right: 10px;"></span> Cancelar
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </g:form>
                        </div>
                     <!--  -->                         
                    </div>
                </div>
            </div>
        </div>
     </div>

        <script src="${resource(dir: 'centaurus/js', file: 'jquery.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'bootstrap.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'jquery.nanoscroller.min.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'select2.min.js')}"></script>

        <script src="${resource(dir: 'centaurus/js', file: 'modernizr.custom.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'snap.svg-min.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'classie.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'scripts.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'pace.min.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'notificationFx.js')}"></script>

<!--<script src="${resource(dir: 'js', file: 'jquery.js')}"></script>-->
        <script src="${resource(dir: 'js', file: 'jquery.jcarousel.min.js')}"></script>
        <script src="${resource(dir: 'js', file: 'jcarousel.connected-carousels.js')}"></script>

        <script src="${resource(dir: 'js', file: 'bootstrap-tagsinput.min.js')}"></script>
        <!--<script src="${resource(dir: 'js', file: 'jquery-1.10.2.min.js')}"></script>-->

        <script src="${resource(dir: 'js', file: 'js-image-slider.js')}"></script>
        <script src="${resource(dir: 'js', file: 'mcVideoPlugin.js')}"></script>  

        <script src="${resource(dir: 'js', file: 'jquery.media.js')}"></script>

         

        <script type="text/javascript" src="${resource(dir: 'centaurus/assets/js/', file: 'jquery.video-ui.js')}"></script>
        
        <script type="text/javascript">
            $('#demo1').videoUI({
              'autoHide':false
            });
        </script>

        <script type="text/javascript">
            $('a.media').media({width:500, height:400});
        </script> 

        <script type="text/javascript">

            $(document).ready(function() {
		$('#email-list li > .star > a').on('click', function() {
            $(this).toggleClass('starred');
            });

            $(".has-tooltip").each(function (index, el) {
            $(el).tooltip({
            placement: $(this).data("placement") || 'bottom'
            });
            });

            setHeightEmailContent();

            initEmailScroller();
            });

            $(window).smartresize(function(){
            setHeightEmailContent();

            initEmailScroller();
            });

            function setHeightEmailContent() {
		if ($( document ).width() >= 992) {
            var windowHeight = $(window).height();
            var staticContentH = $('#header-navbar').outerHeight() + $('#email-header').outerHeight();
            staticContentH += ($('#email-box').outerHeight() - $('#email-box').height());

            $('#email-detail').css('height', windowHeight - staticContentH);
            }
            else {
            $('#email-detail').css('height', '');
            }
            }

            function initEmailScroller() {
		if ($( document ).width() >= 992) {
            $('#email-navigation').nanoScroller({
            alwaysVisible: false,
            iOSNativeScrolling: false,
            preventPageScrolling: true,
            contentClass: 'email-nav-nano-content'
            });

            $('#email-detail').nanoScroller({
            alwaysVisible: false,
            iOSNativeScrolling: false,
            preventPageScrolling: true,
            contentClass: 'email-detail-nano-content'
            });
            }
            }
        </script> 
        <script>
            $(document).ready(function() {

            // activate Nestable for list 1
            $('.nestable').nestable({
            group: 1
            });


            // output initial serialised data
            $('#nestable-menu').on('click', function(e){
            var target = $(e.target),
            action = target.data('action');
            if (action === 'expand-all') {
            $('.dd').nestable('expandAll');
            }
            if (action === 'collapse-all') {
            $('.dd').nestable('collapseAll');
            }
            });
            });
        </script>
        <script> 
            function aceptarCaso() { 
            document.getElementById('div_archivos').style.display='block';
            document.getElementById('div_aceptar_rechazar').style.display='none';
            } 
        </script>
        <script type="text/javascript">
            var showOnlyOptionsSimilarToText = function (selectionEl, str, isCaseSensitive) {
            if (isCaseSensitive)
            str = str.toLowerCase();
    // cache the jQuery object of the <select> element
            var $el = $(selectionEl);
            if (!$el.data("options")) {
        // cache all the options inside the <select> element for easy recover
            $el.data("options", $el.find("option").clone());
            }
            var newOptions = $el.data("options").filter(function () {
            var text = $(this).text();
            if (isCaseSensitive)
            text = text.toLowerCase();
            return text.match(str);
            });
            $el.empty().append(newOptions);
            };

            $("#SearchBox").on("keyup", function () {
            var userInput = $("#SearchBox").val();
            showOnlyOptionsSimilarToText($("#CustomerSelect"), userInput.toUpperCase());
            });
        </script>  

        <script type="text/javascript">
            var showOnlyOptionsSimilarToText = function (selectionEl, str, isCaseSensitive) {
            if (isCaseSensitive)
            str = str.toLowerCase();
    // cache the jQuery object of the <select> element
            var $el = $(selectionEl);
            if (!$el.data("options")) {
        // cache all the options inside the <select> element for easy recover
            $el.data("options", $el.find("option").clone());
            }
            var newOptions = $el.data("options").filter(function () {
            var text = $(this).text();
            if (isCaseSensitive)
            text = text.toLowerCase();
            return text.match(str);
            });
            $el.empty().append(newOptions);
        };
        
        $("#SearchCompartir").on("keyup", function () {
        var userInput = $("#SearchCompartir").val();
        showOnlyOptionsSimilarToText($("#CompartirSelect"), userInput.toUpperCase());
        });
    </script>
    <script type="text/javascript">
        function compartir(){
        valor = document.getElementById('commentCompartir').value;
        if(valor==''){
        document.getElementById('commentCompartir').value += CompartirSelect.value;
        }else{        
        if(valor.indexOf(CompartirSelect.value)<0){
        document.getElementById('commentCompartir').value += '\n'+CompartirSelect.value;
        }
        }
        }
    </script>
    <script type="text/javascript">
        $(function($) {		
        $('#listDefensor').select2({
        placeholder: 'Escribir defensor a asignar',
        allowClear: true
        });		
        });
    </script>

    <script type="text/javascript">
        $(function($) {		
        $('#listCompartir').select2({
        placeholder: 'Nombre de la persona',
        allowClear: true
        });		
        });
    </script> 

    <script type="text/javascript">
        $(function($) {		
        $('#listCompartirDef').select2({
        placeholder: 'Nombre de la persona',
        allowClear: true
        });		
        });
    </script>   

    <script>   
        (function() {
        var bttnNotificacionDefensor = document.getElementById( 'btnModalAsignar' );  
        bttnNotificacionDefensor.disabled = false;
        bttnNotificacionDefensor.addEventListener( 'click', function() {
        var notification = new NotificationFx({       
                                    message : '<span class="icon fa fa-users fa-2x"></span><p>Se asigno correctamente al defesor o defesores.</p>',
        layout : 'bar',
        effect : 'exploader',
        type : 'success', 
        onClose : function() {  
        var userNombre = $('#usershiro').val();
        var userAsignar = 1;
        var userMensaje = "prueba";        
        bttnNotificacionDefensor.disabled = false;
        }
        });
        notification.show();
                        //this.disabled = true;
        document.getElementById( 'myModalDefensor' ).close();
        } );
        })();

        (function() {
        var bttnNotificacionCompartir = document.getElementById( 'btnModalCompartir' );
        bttnNotificacionCompartir.disabled = false;
        bttnNotificacionCompartir.addEventListener( 'click', function() {
        var notification = new NotificationFx({
                                    message : '<span class="icon fa fa-inbox fa-2x"></span><p>Se compartieron los archivo(s) correctamente.</p>',
        layout : 'bar',
        effect : 'exploader',
        type : 'success',
        onClose : function() {
        bttnNotificacionCompartir.disabled = false;
        }
        });
        notification.show();
        //this.disabled = true;
        document.getElementById('myModalCompartir').close();
        } );
        })();

        (function() {
        var bttnNotificacionCompartir = document.getElementById( 'btnModalCompartirDef' );
        bttnNotificacionCompartir.disabled = false;
        bttnNotificacionCompartir.addEventListener( 'click', function() {
        var notification = new NotificationFx({
                                    message : '<span class="icon fa fa-inbox fa-2x"></span><p>Se compartieron los archivo(s) correctamente.</p>',
        layout : 'bar',
        effect : 'exploader',
        type : 'success',
        onClose : function() {
        bttnNotificacionCompartir.disabled = false;
        }
        });
        notification.show();
        //this.disabled = true;
        document.getElementById('myModalCompartir').close();
        } );
        })();

        (function() {
        var bttnNotificacionCompartir = document.getElementById( 'btnModalAudiencia' );
        bttnNotificacionCompartir.disabled = false;
        bttnNotificacionCompartir.addEventListener( 'click', function() {
        var notification = new NotificationFx({
                                    message : '<span class="icon fa fa-inbox fa-2x"></span><p>Se ha solicitado la audiencia correctamente.</p>',
        layout : 'bar',
        effect : 'exploader',
        type : 'success',
        onClose : function() {
        btnModalAudiencia.disabled = false;
        }
        });
        notification.show();
        //this.disabled = true;
        document.getElementById('myModalAsignar').close();
        } );
        })();
    </script>

    <script> 
        function mostrarImagenes() { 
        document.getElementById('divImagenes').style.display='block'; 
        document.getElementById('divVideos').style.display='none';
        document.getElementById('sliderFrame2').style.display='none';
        }

        function mostrarVideos() { 
        document.getElementById('divVideos').style.display='block'; 
        document.getElementById('divImagenes').style.display='none';
        document.getElementById('sliderFrame2').style.display='none';
        }

        function mostrarArchivos() { 
        document.getElementById('sliderFrame2').style.display='block'; 
        document.getElementById('divVideos').style.display='none';
        document.getElementById('divImagenes').style.display='none';
        }
    </script>
    <script>
        $(function(){
        $('a[title]').tooltip();
        });
    </script>

  </body>
</html>
