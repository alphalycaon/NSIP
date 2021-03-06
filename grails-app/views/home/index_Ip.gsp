<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>        
        <meta name="layout" content="main"/>

        <style type="text/css">
            .not-active {
                cursor: no-drop;
             }
        </style> 
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'select2.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/bootstrap', file: 'bootstrap.min.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-default.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-style-growl.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-style-bar.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-style-attached.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-style-other.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-style-theme.css')}"/>
        
        <title>Bandeja de Entrada</title>
    </head>
    <body>
        <div class="row" style="opacity: 1;">
            <div class="col-lg-12">
                <div id="email-box" class="clearfix">
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="email-header-mobile" class="visible-xs visible-sm clearfix">
                                <div id="email-header-title-mobile" class="pull-left">
                                    
                                </div>                                
                            </div>
                            <header id="email-header" class="clearfix">                                
                               
                                <div id="email-header-title" class="visible-md visible-lg">
                                        <i class="fa fa-inbox"></i> Lista de IP
                                    </div>
                               
                                
                                    <div id="email-header-tools" >

                                        <div class="btn-group">
                                            <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle has-tooltip" type="button" title="" data-original-title="Select">
                                                <i class="fa fa-square-o"></i> <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Todos</a></li>
                                                <li><a href="#">Ninguno</a></li>
                                                <li><a href="#">Leido</a></li>
                                                <li><a href="#">Sin leer</a></li>
                                                <li><a href="#">Favorito</a></li>
                                                <li><a href="#">Normal</a></li>
                                            </ul>
                                        </div>
                                        <div class="btn-group">
                                            <button class="btn btn-primary" type="button" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Actualizar">
                                                <i class="fa fa-refresh"></i>
                                            </button>
                                            <shiro:hasRole name="CES">
                                                <button class="btn btn-primary" type="button" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Notificar a unidad de atencion a victimas del delito">
                                                    <i class="fa fa-send"></i>
                                                </button>
                                            </shiro:hasRole>

                                            
                                            <button class="btn btn-primary" type="button" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Borrar">
                                                <i class="fa fa-trash-o"></i>
                                            </button>
                                            
                                            <button type="button" class="btn btn-primary pull-right" style=" margin-left: 3px" data-toggle="modal" data-target="#myModalCompartir">Compartir Documentos</button>&nbsp;
                                        </div>

                                        <shiro:hasRole name="CES">
                                            <div class="btn-group">
                                                <g:link controller="ces" action="ip" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" data-original-title="Generar IP">
                                                    <i class="fa fa-users"></i>
                                                </g:link>
                                            </div>
                                        </shiro:hasRole>
                                    </div>






                                    <div id="email-header-pagination" class="pull-right" style="margin-right: 40px">
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
                            <div id="email-content" class="email-content-nano has-scrollbar" style="height: 100%; ">
                                <div class="email-content-nano-content" tabindex="0" style="right: -16px;">
                                    <ul id="email-list">
                                        <!--li class="unread clickable-row" data-href="email-detail.html">
                                            <div class="chbox">
                                                <div class="checkbox-nice">
                                                    <input type="checkbox" id="m-checkbox-1">
                                                    <label for="m-checkbox-1"></label>
                                                </div>
                                            </div>
                                            <div class="name">
                                                00001/CA/2014-PJ-COA-002
                                            </div>
                                            <div class="message">
                                                <span class="label label-warning">NARCOMENUDEO</span>
                                                <span class="subject">Francisco Gomez Perez</span>
                                                <span class="body">VENTA, COMPRA, ADQUISICION O ENAJENACION DE ALGUN NARCOTICO</span>
                                            </div>
                                            <div class="meta-info">
                                                <a href="#" class="attachment">
                                                    <i class="fa fa-paperclip"></i>
                                                </a>
                                                <span class="date">9:34 am</span>
                                            </div>
                                        </li>
                                        <li class="unread clickable-row" data-href="email-detail.html">
                                            <div class="chbox">
                                                <div class="checkbox-nice">
                                                    <input type="checkbox" id="m-checkbox-2">
                                                    <label for="m-checkbox-2"></label>
                                                </div>
                                            </div>
                                            <div class="name">
                                                00001/CA/2014-PJ-COA-003
                                            </div>
                                            <div class="message">
                                                <span class="label label-danger">LESIONES</span>
                                                <span class="subject">Georgina Rojas Perez</span>
                                                <span class="body">LESIONES GRAVES POR CICATRIZ EN LA CARA PERMANENTE NOTABLES</span>
                                            </div>
                                            <div class="meta-info">
                                                <a href="#" class="attachment">
                                                    <i class="fa fa-paperclip"></i>
                                                </a>
                                                <span class="date">Sep 14</span>
                                            </div>
                                        </li-->    
                                        <shiro:hasRole name="CES"> 
                                            <g:each in="${expedientesIpFiltrados}" var="expedienteIp" status="i">
                                                <li class="unread" data-href="${request.contextPath}/home/detail_Ip">
                                                    <div class="chbox">
                                                        <div class="checkbox-nice">
                                                            <input type="checkbox" name="checkbox${expedienteIp.id}" id="checkbox${expedienteIp.id}">
                                                            <label for="checkbox${expedienteIp.id}"></label>
                                                        </div>
                                                    </div>
                                                    <div class="star">
                                                        <a></a>
                                                    </div>
                                                <g:link action="detail_Ip"  id="${expedienteIp.id}" style="color: #000000">
                                                    <div class="name">
                                                        ${expedienteIp.numeroIp}
                                                    </div>
                                                    <div class="meta-info">
                                                        <a href="#" class="attachment">
                                                            <i class="fa fa-paperclip"></i>
                                                        </a>
                                                        <span><g:formatDate format="dd/MM/yyyy HH:mm" date="${expedienteIp.dateCreated}"/></span>
                                                    </div>
                                                </li></g:link>                        
                                            </g:each>                                     
                                        </shiro:hasRole>
                                    </ul>
                                </div>
                                <div class="nano-pane"><div class="nano-slider" style="height: 104px; transform: translate(0px, 0px);"></div></div></div>
                        </div>
                    </div>
                </div>
            </div>
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
                            <g:actionSubmit id="btnModalCompartir" class="btn btn-primary" value="Aceptar" action="compartirVariosExpIp" controller="home"/>
                            <a data-dismiss="modal" class="btn btn-danger">                                            
                                <span style="padding-right: 10px;"></span> Cancelar
                            </a>
                        </div>
                    </div>
                </div>
            </g:form>
        </div>
     <!--  -->

        <script src="${resource(dir: 'centaurus/js', file: 'jquery.js')}"></script>
        <!--<script src="${resource(dir: 'centaurus/js', file: 'bootstrap.js')}"></script>-->
        <script src="${resource(dir: 'centaurus/js', file: 'jquery.nanoscroller.min.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'select2.min.js')}"></script>

        <script src="${resource(dir: 'centaurus/js', file: 'modernizr.custom.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'snap.svg-min.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'classie.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'scripts.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'pace.min.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'notificationFx.js')}"></script>
        
        <script type="text/javascript">
            function setHeightEmailContent() {
                if ($(document).width() >= 992) {
                    var windowHeight = $(window).height();
                    var staticContentH = $('#header-navbar').outerHeight() + $('#email-header').outerHeight();
                    staticContentH += ($('#email-box').outerHeight() - $('#email-box').height());

                    $('#email-content').css('height', windowHeight - staticContentH);
                }
                else {
                    $('#email-content').css('height', '');
                }
            }

            function initEmailScroller() {
                if ($(document).width() >= 992) {
                    $('#email-navigation').nanoScroller({
                        alwaysVisible: false,
                        iOSNativeScrolling: false,
                        preventPageScrolling: true,
                        contentClass: 'email-nav-nano-content'
                    });

                    $('#email-content').nanoScroller({
                        alwaysVisible: false,
                        iOSNativeScrolling: false,
                        preventPageScrolling: true,
                        contentClass: 'email-content-nano-content'
                    });
                }
            }
            $(document).ready(function() {
                $('#email-list li > .star > a').on('click', function() {
                    $(this).toggleClass('starred');
                });

                $(".has-tooltip").each(function(index, el) {
                    $(el).tooltip({
                        placement: $(this).data("placement") || 'bottom'
                    });
                });

                setHeightEmailContent();

                initEmailScroller();




                $(".clickable-row > div:not(.chbox,.star)").click(function(e) {
                    if ((e.target instanceof HTMLAnchorElement) == true) {
                        return;
                    }
                    var href = $(this).parent().data('href');

                    if (href != '' && typeof href != 'undefined') {
                        window.document.location = href;
                    }
                });
            });

            $(window).smartresize(function() {
                setHeightEmailContent();

                initEmailScroller();
            });


        </script>      

        <script>   
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
        </script>

        <script type="text/javascript">
            $(function($) {		
            $('#listCompartir').select2({
            placeholder: 'Nombre de la persona',
            allowClear: true
            });		
            });
        </script> 
    </body>
</html>
