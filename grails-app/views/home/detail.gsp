<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="layout" content="main"/>
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
                                    <i class="fa fa-inbox"></i> Inbox
                                </div>
                                <div id="email-header-tools">

                                    <g:link controller="home" action="index" class="btn btn-primary">                                            
                                        <span class="fa fa-chevron-left" style="padding-right: 10px;"></span> Regresar
                                    </g:link>                                    
                                </div>
                                <div id="email-header-pagination" class="pull-right">
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
                                </div>
                            </header>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="email-navigation" class="email-nav-nano hidden-xs hidden-sm has-scrollbar">
                                <div class="email-nav-nano-content" tabindex="0" style="right: -16px;">                                    
                                    <ul id="email-nav-items" class="clearfix">
                                        <li class="active">
                                            <a href="#">
                                                <i class="fa fa-inbox"></i>
                                                Inbox
                                                <span class="label label-primary pull-right">83</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-star"></i>
                                                Marcados
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-pencil"></i>
                                                En proceso
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-envelope"></i>
                                                Compartidos
                                                <span class="label label-default pull-right">11</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-trash-o"></i>
                                                Terminados
                                                <span class="label label-default pull-right">1,292</span>
                                            </a>
                                        </li>
                                    </ul>                                    
                                </div>
                                <div class="nano-pane" style="display: block;"><div class="nano-slider" style="height: 400px; transform: translate(0px, 0px);"></div></div>
                            </div>
                            <div id="email-detail" class="email-detail-nano has-scrollbar" style="height: 627px;">
                                <div class="email-detail-nano-content" tabindex="0" style="right: -16px;">
                                    <div id="email-detail-inner">
                                        <div id="email-detail-subject" class="clearfix">
                                            <span class="subject">COA/FG/XX/PGU/2014/AA-1</span>
                                            <span class="label label-success">Capturado</span>
                                        </div>

                                        <div id="email-body">      
                                        </div>  
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="main-box clearfix">                                                    
                                                    <div class="main-box-body clearfix">
                                                        <div class="tabs-wrapper">
                                                            <ul class="nav nav-tabs">
                                                                <li class="active"><a href="#tab-delito" data-toggle="tab">Delito</a></li>
                                                                <li><a href="#tab-victima" data-toggle="tab">Victima</a></li>                                                               
                                                                <li><a href="#tab-responsable" data-toggle="tab">Presunto Responsable</a></li>                                                               
                                                            </ul>
                                                            <div class="tab-content">
                                                                <div class="tab-pane fade in active" id="tab-delito">
                                                                    <br/>
                                                                    <div class="form-group">
                                                                        <label for="delito">Nombre</label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.nombre" value="Robo a Mano Armada">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Modalidad </label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.modalidad" value="Agravada">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Modus</label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.modus" value="Culposo">
                                                                    </div>
                                                                </div>
                                                                <div class="tab-pane fade" id="tab-victima">
                                                                    <br/>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nombre </label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.nombre" value="Juan Torres Pineda">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Genero </label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.genero" value="Hombre">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Edad</label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.edad" value="34">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Estado Civil</label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.estadoCivil" value="Soltero">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Escolaridad</label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.escolaridad" value="Licenciatura">
                                                                    </div>
                                                                </div>                                                                
                                                                <div class="tab-pane fade" id="tab-responsable">
                                                                    <br/>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nombre </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.nombre" value="Luis Alameda Cespedes">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Genero </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.genero" value="Hombre" >
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Edad</label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.edad" value="40">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Estado Civil</label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.estadoCivil" value="Soltero">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Escolaridad</label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.escolaridad" value="Sin Estudios">
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
                                                        <h2>Archivos</h2>
                                                    </header>
                                                    <div class="main-box-body clearfix">
                                                        <div id="nestable-menu">
                                                            <button type="button" class="btn btn-primary" data-action="expand-all">Expandir Todos</button>
                                                            <button type="button" class="btn btn-danger" data-action="collapse-all">Contraer Todos</button>
                                                        </div>
                                                        <div class="row cf nestable-lists" id="user-profile">                                                            
                                                            <div class="col-md-6 dd nestable" >
                                                                <ol class="dd-list dd-nodrag">
                                                                    <li class="dd-item dd-item-list " data-id="13">
                                                                        <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                        <div class="dd-handle dd-nodrag">Media filiacion</div>
                                                                    </li>
                                                                    <li class="dd-item dd-item-list" data-id="14">
                                                                        <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                        <div class="dd-handle">
                                                                            Documentos Probatorios
                                                                        </div>
                                                                    </li>                                                                    
                                                                    <li class="dd-item dd-item-list" data-id="15"><button data-action="collapse" type="button" style="display: block;">Collapse</button><button data-action="expand" type="button" style="display: none;">Expand</button>
                                                                        <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                        <div class="dd-handle">Fotorgrafias de los Hechos</div>
                                                                        <ol class="dd-list" style="">
                                                                            <li class="dd-item dd-item-list" data-id="16">
                                                                                <div class="dd-handle-list"><i class="fa fa-image"></i></div>
                                                                                <div class="dd-handle ">Item 16</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="17">
                                                                                <div class="dd-handle-list"><i class="fa fa-image"></i></div>
                                                                                <div class="dd-handle  ">Item 17</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="18">
                                                                                <div class="dd-handle-list"><i class="fa fa-image"></i></div>
                                                                                <div class="dd-handle ">Item 18</div>
                                                                            </li>
                                                                        </ol>
                                                                    </li>  
                                                                    <li class="dd-item dd-item-list" data-id="14">
                                                                        <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                        <div class="dd-handle">
                                                                            Audiencias
                                                                        </div>
                                                                        <ol class="dd-list" style="">
                                                                            <li class="dd-item dd-item-list" data-id="16">
                                                                                <div class="dd-handle-list"><i class="fa fa-image"></i></div>
                                                                                <div class="dd-handle ">Item 16</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="17">
                                                                                <div class="dd-handle-list"><i class="fa fa-image"></i></div>
                                                                                <div class="dd-handle  ">Item 17</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="18">
                                                                                <div class="dd-handle-list"><i class="fa fa-image"></i></div>
                                                                                <div class="dd-handle ">Item 18</div>
                                                                            </li>
                                                                        </ol>
                                                                    </li>
                                                                </ol>
                                                            </div>
                                                            <div class="col-md-6 dd" >
                                                                <div class="main-box clearfix">
                                                                    <header class="main-box-header clearfix">
                                                                        <h2>Fotografia 1</h2>
                                                                    </header>
                                                                    <div class="main-box-body clearfix">
                                                                        <div class="profile-status">
                                                                            <i class="fa fa-circle"></i> Disponible
                                                                        </div>
                                                                        <div class="profile-label">
                                                                            <span class="label label-danger">Ministerio 1</span>
                                                                        </div>
                                                                        <div class="profile-since">
                                                                            Ultima Actualizacion: 1/Enero/2015
                                                                        </div>
                                                                        <div class="profile-details">
                                                                            <ul class="fa-ul">
                                                                                <li><i class="fa-li fa fa-truck"></i>Tamaño: <span>1.5M</span></li>
                                                                                <li><i class="fa-li fa fa-comment"></i>Formato: <span>png</span></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="profile-message-btn center-block text-center">
                                                                            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                                                                                Ver Archivo
                                                                            </button>
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
                                <div class="nano-pane" style="display: none;"><div class="nano-slider" style="height: 611px; transform: translate(0px, 0px);"></div></div></div>
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
                        </div>
                    </div>
                </div>
            </div>
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
        </div>

    </body>
</html>
