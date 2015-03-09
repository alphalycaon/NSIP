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
        
        <style type="text/css">
            #myTab li.active a {border-bottom-color: transparent; background-color: #E33C3C; color: white;}
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
                                <div id="email-header-tools" style=" left: 985px">
                                    <a href="${request.contextPath}/home/index_Iph" class="btn btn-primary">                                            
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
                        <shiro:hasRole name="CES">   
                            <div id="email-navigation" class="email-nav-nano hidden-xs hidden-sm has-scrollbar">
                                <div class="email-nav-nano-content" tabindex="0" style="right: -16px;">                                    
                                    <ul id="email-nav-items" class="clearfix">
                                        <li>
                                            <a href="${request.contextPath}">
                                                <i class="fa fa-folder-o"></i>
                                                Denuncias
                                                <span class="label label-primary pull-right">12</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-link"></i>
                                                Cadena de custodia
                                            </a>
                                        </li>
                                        <li>
                                            <a href="${request.contextPath}/home/index_Iph">
                                                <i class="fa fa-inbox"></i>
                                                Informes policiales homologados
                                                    <span class="label label-primary pull-right">8</span>
                                                <!--
                                                <span class="label label-default pull-right">1,292</span>
                                                -->
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-times-circle"></i>
                                                Detenidos
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-inbox"></i>
                                                Informes policiales
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-arrow-circle-o-up"></i>
                                                Solicitar defensor público
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-play-circle-o"></i>
                                                Notificar a Unidad de Atención a Víctimas del Delito
                                                <!--
                                                <span class="label label-default pull-right">1,292</span>
                                                -->
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                            <i class="fa fa-exclamation-triangle"></i>
                                                Mis notificaciones
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" data-toggle="modal" data-target="#myModalPlantillas">
                                            <i class="fa fa-file-word-o"></i>
                                                Mis plantillas
                                            </a>
                                        </li>
                                    </ul>                                    
                                </div>
                                <div class="nano-pane" style="display: block;"><div class="nano-slider" style="height: 400px; transform: translate(0px, 0px);"></div></div>
                            </div>
                        </shiro:hasRole>
                        <shiro:hasRole name="CES">
                            <div id="email-detail" class="email-detail-nano has-scrollbar" style="height: 627px;">
                                <div class="email-detail-nano-content" tabindex="0" style="right: -16px;">
                                    <div id="email-detail-inner">
                                        <div id="email-detail-subject" class="clearfix">
                                            <span class="subject property-value">${expedienteIph.numeroIph}</span>
                                        </div>

                                        <div id="email-body">      
                                        </div>  
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="main-box clearfix">                                                    
                                                    <div class="main-box-body clearfix">
                                                        <div class="tabs-wrapper">
                                                            <ul class="nav nav-tabs nav-justified" id="myTab">
                                                                <li class="active"><a href="#tab-general" data-toggle="tab">Datos Generales</a></li>
                                                                <li><a href="#tab-victima" data-toggle="tab">Victima</a></li>                                                               
                                                                <li><a href="#tab-responsable" data-toggle="tab">Probable Responsable</a></li>                                                               
                                                            </ul>
                                                            <div class="tab-content">
                                                                <div class="tab-pane fade in active" id="tab-general">
                                                                    <br/>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Fecha del evento</label>
                                                                        <input disabled="" type="text" class="form-control" name="datosIph.fechaEvento" value="${expedienteIph.iph.datosIph.fechaEvento}">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Hora del evento</label>
                                                                        <input disabled="" type="text" class="form-control" name="datosIph.horaEvento" value="${expedienteIph.iph.datosIph.horaEvento}">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Asunto</label>
                                                                        <input disabled="" type="text" class="form-control" name="datosIph.asunto" value="${expedienteIph.iph.datosIph.asunto}">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Participación</label>
                                                                        <input disabled="" type="text" class="form-control" name="datosIph.participacion" value="${expedienteIph.iph.datosIph.participacion}">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Operativo</label>
                                                                        <input disabled="" type="text" class="form-control" name="datosIph.operativo" value="${expedienteIph.iph.datosIph.operativo}">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Ubicación</label>
                                                                        <input disabled="" type="text" class="form-control" name="datosIph.ubicacion" value="${expedienteIph.iph.datosIph.ubicacion}">
                                                                    </div>
                                                                </div>
                                                                <div class="tab-pane fade" id="tab-victima">
                                                                    <br/>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nombre(s) </label>
                                                                        <input disabled="" type="text" class="form-control" name="victimaIph.nombre" value="${expedienteIph.iph.victimaIph.nombre}">
                                                                    </div> 
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Apellido Paterno </label>
                                                                        <input disabled="" type="text" class="form-control" name="victimaIph.apellidoPaterno" value="${expedienteIph.iph.victimaIph.apellidoPaterno}">
                                                                    </div> 
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Apellido Materno </label>
                                                                        <input disabled="" type="text" class="form-control" name="victimaIph.apellidoMaterno" value="${expedienteIph.iph.victimaIph.apellidoMaterno}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Edad</label>
                                                                        <input disabled="" type="text" class="form-control" name="victimaIph.edad" value="${expedienteIph.iph.victimaIph.edad}">
                                                                    </div>                                          
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Sexo </label>
                                                                        <input disabled="" type="text" class="form-control" name="victimaIph.sexo" value="${expedienteIph.iph.victimaIph.sexo}">
                                                                    </div>                               
                                                                </div>                                                                
                                                                <div class="tab-pane fade" id="tab-responsable">
                                                                    <br/>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nombre(s) </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputadoIph.nombre" value="${expedienteIph.iph.imputadoIph.nombre}">
                                                                    </div> 
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Apellido Paterno </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputadoIph.apellidoPaterno" value="${expedienteIph.iph.imputadoIph.apellidoPaterno}">
                                                                    </div> 
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Apellido Materno </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputadoIph.apellidoMaterno" value="${expedienteIph.iph.imputadoIph.apellidoMaterno}">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Edad</label>
                                                                        <input disabled="" type="text" class="form-control" name="imputadoIph.edad" value="${expedienteIph.iph.imputadoIph.edad}">
                                                                    </div>                                          
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Sexo </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputadoIph.sexo" value="${expedienteIph.iph.imputadoIph.sexo}">
                                                                    </div>                                        
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Probables delitos o faltas administrativas </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputadoIph.delito" value="${expedienteIph.iph.imputadoIph.delito}">
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
                                                        <h2>Carpeta de investigación</h2>
                                                    </header>
                                                    <div class="main-box-body clearfix">
                                                        <div id="nestable-menu">
                                                            <button type="button" class="btn btn-primary" data-action="expand-all">Expandir Todos</button>
                                                            <button type="button" class="btn btn-danger" data-action="collapse-all">Contraer Todos</button>
                                                        </div>
                                                    <div class="row cf nestable-lists" id="user-profile">                                                            
                                                        <div class="col-md-6 dd nestable" >
                                                            <ol class="dd-list dd-nodrag">                                         
                                                                <li class="dd-item dd-item-list " data-id="13"><button data-action="collapse" type="button" style="display: block;">Collapse</button><button data-action="expand" type="button" style="display: none;">Expand</button>
                                                                    <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                    <div class="dd-handle dd-nodrag"><a href="#">Media filiacion</a></div>
                                                                    <ol class="dd-list" style="">
                                                                        <li class="dd-item dd-item-list" data-id="16">
                                                                            <div class="dd-handle-list"><i class="fa fa-file-pdf-o"></i></div>
                                                                            <div class="dd-handle "><a href="#"  onclick="mostrarArchivos()">Somática_General.pdf</a></div>
                                                                        </li>
                                                                        <li class="dd-item dd-item-list" data-id="17">
                                                                            <div class="dd-handle-list"><i class="fa fa-file-pdf-o"></i></div>
                                                                            <div class="dd-handle "><a href="#"  onclick="mostrarArchivos()">Ficha_Signalética.pdf</a></div>
                                                                        </li>
                                                                        <li class="dd-item dd-item-list" data-id="18">
                                                                            <div class="dd-handle-list"><i class="fa fa-file-image-o"></i></div>
                                                                            <div class="dd-handle "><a href="#"  onclick="mostrarImagenes()">Retrato_Hablado.jpg</a></div>
                                                                        </li>
                                                                    </ol>
                                                                </li>
                                                                <li class="dd-item dd-item-list" data-id="14"><button data-action="collapse" type="button" style="display: block;">Collapse</button><button data-action="expand" type="button" style="display: none;">Expand</button>
                                                                    <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                    <div class="dd-handle"><a href="#">Documentos Probatorios</a></div>
                                                                    <ol class="dd-list" style="">
                                                                        <li class="dd-item dd-item-list" data-id="16">
                                                                            <div class="dd-handle-list"><i class="fa fa-file-video-o"></i></div>
                                                                            <div class="dd-handle "><a href="#"  onclick="mostrarVideos()">Declaración_Oral.mov</a></div>
                                                                        </li>
                                                                        <li class="dd-item dd-item-list" data-id="17">
                                                                            <div class="dd-handle-list"><i class="fa fa-file-pdf-o"></i></div>
                                                                            <div class="dd-handle "><a href="#"  onclick="mostrarArchivos()">Declaración_Escrita.pdf</a></div>
                                                                        </li>
                                                                        <li class="dd-item dd-item-list" data-id="18">
                                                                            <div class="dd-handle-list"><i class="fa fa-file-pdf-o"></i></div>
                                                                            <div class="dd-handle "><a href="#"  onclick="mostrarArchivos()">Testificación_Escrita.pdf</a></div>
                                                                        </li>
                                                                    </ol>
                                                                </li>                                                                    
                                                                <li class="dd-item dd-item-list" data-id="15"><button data-action="collapse" type="button" style="display: block;">Collapse</button><button data-action="expand" type="button" style="display: none;">Expand</button>
                                                                    <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                    <div class="dd-handle"><a href="#">Fotografias de los Hechos</a></div>
                                                                    <ol class="dd-list" style="">
                                                                        <li class="dd-item dd-item-list" data-id="16">
                                                                            <div class="dd-handle-list"><i class="fa fa-file-image-o"></i></div>
                                                                            <div class="dd-handle "><a href="#"  onclick="mostrarImagenes()">Img_Herida.png</a></div>
                                                                        </li>
                                                                        <li class="dd-item dd-item-list" data-id="17">
                                                                            <div class="dd-handle-list"><i class="fa fa-file-image-o"></i></div>
                                                                            <div class="dd-handle "><a href="#"  onclick="mostrarImagenes()">Img_Arma.png</a></div>
                                                                        </li>
                                                                        <li class="dd-item dd-item-list" data-id="18">
                                                                            <div class="dd-handle-list"><i class="fa fa-file-image-o"></i></div>
                                                                            <div class="dd-handle "><a href="#"  onclick="mostrarImagenes()">Img_Presunto_Culpable.png</a></div>
                                                                        </li>
                                                                    </ol>
                                                                </li>  
                                                                <li class="dd-item dd-item-list" data-id="14"><button data-action="collapse" type="button" style="display: block;">Collapse</button><button data-action="expand" type="button" style="display: none;">Expand</button>
                                                                    <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                    <div class="dd-handle"><a href="#">Audiencias</a></div>
                                                                    <ol class="dd-list" style="">
                                                                        <li class="dd-item dd-item-list" data-id="16">
                                                                            <div class="dd-handle-list"><i class="fa fa-file-video-o"></i></div>
                                                                            <div class="dd-handle "><a href="#"  onclick="mostrarVideos()">Audiencia1_PrimeraParte.mov</a></div>
                                                                        </li>
                                                                        <li class="dd-item dd-item-list" data-id="17">
                                                                            <div class="dd-handle-list"><i class="fa fa-file-video-o"></i></div>
                                                                            <div class="dd-handle "><a href="#"  onclick="mostrarVideos()">Audiencia1_SegundaParte.mov</a></div>
                                                                        </li>
                                                                        <li class="dd-item dd-item-list" data-id="18">
                                                                            <div class="dd-handle-list"><i class="fa fa-file-video-o"></i></div>
                                                                            <div class="dd-handle "><a href="#" onclick="mostrarVideos()">ControlDeDetencion.mov</a></div>
                                                                        </li>
                                                                    </ol>
                                                                </li>
                                                            </ol>
                                                        </div>
                                                        <!-- -->
                                                        <div class="col-md-6 dd" >
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
                                                        <!-- --> 
                                                         <div class="wrapper" id="divVideos" hidden="true">                                                         
                                                           <div id="sliderFrame" style="width:500px; height:300px">
                                                              <div id="slider" style="width:500px; height:300px">                                                                         
                                                                  <a class="video" data-toggle="modal" data-target="#myModal" href="#" onclick="document.getElementById('frameVideos').src='//player.vimeo.com/video/73437654'">
                                                                      <img src="${resource(dir: 'images/imagenes', file: 'image-slider-1.jpg')}"/>
                                                                  </a>
                                                                  <a class="video" data-toggle="modal" data-target="#myModal" href="#" onclick="document.getElementById('frameVideos').src = '//player.vimeo.com/video/73437654'">
                                                                      <b data-src="${resource(dir: 'images/imagenes', file: 'image-slider-2.jpg')}">Vimeo</b>
                                                                  </a>
                                                                  <a class="video" data-toggle="modal" data-target="#myModal" href="#">
                                                                      <b data-src="${resource(dir: 'images/imagenes', file: 'image-slider-3.jpg')}">Image Slider</b>
                                                                  </a>   
                                                              </div>                                                                     
                                                          </div> 
                                                            </br>   
                                                            </br> 
                                                            </br> 
                                                            <div>
                                                                <input type="text" value="Video aprobatorio,Video de audencia,Video de Robo,Video defensoria" data-role="tagsinput"/>
                                                            </div>      
                                                        </div>
                                                        <!-- -->  
                                                          <div id="sliderFrame2" hidden="true">
                                                            <div>
                                                                <ul>
                                                                    <li> <a class="media" href="http://www.mexicoevalua.org/wp-content/uploads/2013/02/IVVI-H-20126.pdf"></a></li>
                                                                </ul>  
                                                            </div> 
                                                            </br>
                                                            <div>
                                                                <input type="text" value="Archivo de investigación,Documento de IPH,Archivo Aprobatorio,Documento de defensoria" data-role="tagsinput"/>
                                                            </div>                                                                    
                                                          </div>                 
                                                        </div>                                                      
                                                        <!-- -->  
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                                                                                                        
                                     </div>                                                                                                                        
                                  </div>
                                </div>
                                <div class="nano-pane" style="display: none;">
                                    <div class="nano-slider" style="height: 611px; transform: translate(0px, 0px);">
                                    </div>
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
                                            <iframe id="frameVideos" class="embed-responsive-item" src="//player.vimeo.com/video/73437656" allowfullscreen=""></iframe>
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
            
        <script>
            
            $('#contenedor').jstree({  
                "plugins" : ["checkbox"] 
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
            valor = document.getElementById('comment').value;
            if(valor==''){
            document.getElementById('comment').value += CompartirSelect.value;
            }else{        
            if(valor.indexOf(CompartirSelect.value)<0){
            document.getElementById('comment').value += '\n'+CompartirSelect.value;
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
        
   <script>
       (function() {
        var bttnNotificacionDefensor = document.getElementById( 'notificacionDefensor' );
        bttnNotificacionDefensor.disabled = false;
        bttnNotificacionDefensor.addEventListener( 'click', function() {
                var notification = new NotificationFx({
                        message : '<span class="icon fa fa-users fa-2x"></span><p>Se asigno correctamente al defesor o defesores.</p>',
                        layout : 'bar',
                        effect : 'exploader',
                        type : 'success',
                        onClose : function() {
                                bttnNotificacionDefensor.disabled = false;
                        }
                });
                notification.show();
                this.disabled = true;
                } );
            })();
           
            (function() {
                var bttnNotificacionCompartir = document.getElementById( 'notificacionCompartir' );
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
                this.disabled = true;
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


</body>
</html>
