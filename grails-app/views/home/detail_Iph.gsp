<html>
    <head>
        <meta charset="utf-8">
        <meta name="layout" content="main"/>
        <meta http-equiv="Content-Type" content="text/html">
        <!--
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'select2.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/bootstrap', file: 'bootstrap.min.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-default.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-style-growl.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-style-bar.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-style-attached.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-style-other.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-style-theme.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'jcarousel.connected-carousels.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'style.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap-tagsinput.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'js-image-slider.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css/', file: 'tabs.css')}">
-->
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/bootstrap',file:'bootstrap.min.css')}"/>
        <script src="${resource(dir: 'centaurus/js',file:'demo-rtl.js')}"></script>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file:'font-awesome.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file:'nanoscroller.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/compiled', file:'layout.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/compiled', file:'elements.css')}"/>


        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs',file:'select2.css')}"/>



        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'jcarousel.connected-carousels.css')}"/>
        <!--link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'style.css')}"/-->
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap-tagsinput.css')}"/>

        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'js-image-slider.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'tabs.css')}">

        <style type="text/css">
            #myTab{border-bottom-color: transparent; background-color: white;}
            #myTabArchivos li.active a {border-bottom-color: transparent; background-color: #E33C3C; color: white;}            
        </style>

<!--<link href="${resource(dir: 'centaurus/assets/bootstrap/css/', file: 'bootstrap.min.css')}" rel="stylesheet">-->
        <link href="${resource(dir: 'centaurus/assets/css/', file: 'video-default.css')}" rel="stylesheet">

        <style type="text/css">
            .not-active {
            cursor: no-drop;
            }
        </style> 

        <title>Detalles</title>
    </head>
    <body>


        <div class="row">
            <div class="col-lg-12">
                <header class="main-box-header clearfix">
                    <ol class="breadcrumb">
                        <li><a href="${request.contextPath}">Inicio</a></li>
                        <li>IPH</li>
                        <li class="active"><span>Detalle IPH</span></li>
                    </ol>
                    <h1>Caso: ${expedienteIph.numeroIph}</h1>
                </header>

            </div>

        </div>



        <div class="row">
            <div class="col-lg-12">

                <div class="main-box-body clearfix">
                    <div class="btn-group  pull-left">
                        <a href="${request.contextPath}/home/index" class="btn btn-primary">                                            
                            <span class="fa fa-chevron-left" style="padding-right: 10px;"></span> Regresar
                        </a>
                        <button type="button" class="btn btn-primary pull-right" style=" margin-right: 40px" data-toggle="modal" data-target="#myModalCompartir">Compartir Documento</button>&nbsp; 

                    </div>
                </div>
            </div>
        </div>
    <shiro:hasRole name="CES">
        <div class="row">
            <div class="col-lg-12">                       


                <div class="main-box clearfix">                                                    
                    <div class="main-box-body clearfix">
                        <div class="tabs-wrapper" style="background-color: white;">
                            <div class="board-inner">
                                <ul class="nav nav-tabs2" id="myTab">
                                    <div class="liner2"></div>
                                    <li class="active">
                                        <a href="#tab-general" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Delito">
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
                                        <a href="#tab-responsable" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Imputado">
                                            <span class="round-tabs four">
                                                <i class="glyphicon glyphicon-hand-right"></i>
                                            </span> 
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="tab-general">
                                    <br/>
                                    <h3>Datos del IPH</h3>
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
                                    <h3>Datos de la víctima</h3>
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
                                    <h3>Datos del responsable</h3>
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
                                                     <shiro:hasRole name="Juez">
                                                    <li>
                                                        <a href="#tab-videos" style="margin-left: auto; margin-right: auto;" data-toggle="tab" title="Vídeos">
                                                            <span class="round-tabs seven">
                                                                <i class="glyphicon glyphicon-facetime-video"></i>
                                                            </span> 
                                                        </a>
                                                    </li>
                                                     </shiro:hasRole>
                                                </ul>
                                            </div>
                                            <div class="tab-content">
                                                <div class="tab-pane fade in active" id="tab-archivos">
                                                    <doc:explorerAndUpload numeroExpediente="${expedienteIph.numeroIph}"/>
                                                </div>
                                                <div class="tab-pane fade" id="tab-imagenes">
                                                    <doc:gallery  numeroExpediente="${expedienteIph.numeroIph}"/>
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
                                <input type="hidden" name="expedienteId" value="${expedienteIph.id}">
                                <select style="width:570px" name="listCompartir" id="listCompartir" multiple >
                                    <g:each in="${usuarios}" var="usuario" status="i">
                                        <option value="${usuario.username}">${usuario.institucion} - ${usuario.puesto} - ${usuario.nombre}</option>
                                    </g:each>
                                </select>
                            </div>
                        </form>      
                    </div>
                    <div class="modal-footer">                                                                           
                        <textarea class="form-control" rows="3" id="commentCompartir" placeholder="Mensaje (Opcional)"></textarea>
                        </br>
                         <!--<a data-dismiss="modal" class="btn btn-primary" id="notificacionCompartir">                                            
                             <span  style="padding-right: 10px;"></span> Aceptar
                         </a> -->  
                        <g:actionSubmit id="btnModalCompartir" class="btn btn-primary" value="Aceptar" action="compartirExpedienteIph" controller="home"/>
                        <a data-dismiss="modal" class="btn btn-danger">                                            
                            <span style="padding-right: 10px;"></span> Cancelar
                        </a>
                    </div>
                </div>
            </div>
        </g:form>
    </div>
    <!--  -->

                            


<!--script src="${resource(dir: 'centaurus/js', file: 'jquery.js')}"></script>
<script src="${resource(dir: 'centaurus/js', file: 'jquery.nanoscroller.min.js')}"></script>
<script src="${resource(dir: 'centaurus/js', file: 'select2.min.js')}"></script>

<script src="${resource(dir: 'centaurus/js', file: 'modernizr.custom.js')}"></script>
<script src="${resource(dir: 'centaurus/js', file: 'snap.svg-min.js')}"></script>
<script src="${resource(dir: 'centaurus/js', file: 'classie.js')}"></script>
<script src="${resource(dir: 'centaurus/js', file: 'scripts.js')}"></script>
<script src="${resource(dir: 'centaurus/js', file: 'pace.min.js')}"></script>
<script src="${resource(dir: 'centaurus/js', file: 'notificationFx.js')}"></script>

<script src="${resource(dir: 'js', file: 'jquery.jcarousel.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'jcarousel.connected-carousels.js')}"></script>

<script src="${resource(dir: 'js', file: 'bootstrap-tagsinput.min.js')}"></script>

<script src="${resource(dir: 'js', file: 'js-image-slider.js')}"></script>
<script src="${resource(dir: 'js', file: 'mcVideoPlugin.js')}"></script>  

<script src="${resource(dir: 'js', file: 'jquery.media.js')}"></script-->
        <script src="${resource(dir: 'js', file: 'application.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'bootstrap.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'bootstrap-editable.min.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'demo-skin-changer.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'demo.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'hopscotch.js')}"></script>
        <!--script src="${resource(dir: 'centaurus/js', file: 'my_tour.js')}"></script-->
        <script src="${resource(dir: 'centaurus/js', file: 'scripts.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'pace.min.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'dropzone.js')}"></script>
        <!--script src="${resource(dir: 'centaurus/js', file: 'wizard.js')}"></script-->
        <script src="${resource(dir: 'centaurus/js', file: 'jquery.maskedinput.min.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'typeahead.min.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'jquery.nestable.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'jquery.nanoscroller.min.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'select2.min.js')}"></script>

        <script src="${resource(dir: 'js', file: 'jquery.jcarousel.min.js')}"></script>
        <script src="${resource(dir: 'js', file: 'jcarousel.connected-carousels.js')}"></script>

        <script src="${resource(dir: 'centaurus/js', file: 'modernizr.custom.js')}"></script>

        <script src="${resource(dir: 'centaurus/js', file: 'snap.svg-min.js')}"></script>

        <script src="${resource(dir: 'centaurus/js', file: 'classie.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'pace.min.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'notificationFx.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'fileExplorer.js')}"></script>

        <script src="${resource(dir: 'js', file: 'js-image-slider.js')}"></script>
        <script src="${resource(dir: 'js', file: 'mcVideoPlugin.js')}"></script>  
<!--script>

    $('#contenedor').jstree({  
    "plugins" : ["checkbox"] 
    });

</script-->   

<!--<script type="text/javascript" src="${resource(dir: 'centaurus/assets/js/', file: 'jquery-1.8.1.min.js')}"></script>-->
<script type="text/javascript" src="${resource(dir: 'centaurus/assets/js/', file: 'jquery.video-ui.js')}"></script>

<script type="text/javascript">
    $('#demo1').videoUI({
    'autoHide':false
    });
</script>

<!--script type="text/javascript">
    $('a.media').media({width:500, height:400});
</script-->

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
<!--script>
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
</script-->
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
<!--script type="text/javascript">
    $(function($) {		
    $('#listDefensor').select2({
    placeholder: 'Escribir defensor a asignar',
    allowClear: true
    });		
    });
</script-->

<script type="text/javascript">
    $(function($) {		
    $('#listCompartir').select2({
    placeholder: 'Nombre de la persona',
    allowClear: true
    });		
    });
</script>

<!--script>
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
</script--> 

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
