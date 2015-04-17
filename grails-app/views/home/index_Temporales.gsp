<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>        

        <style type="text/css">
            .not-active {
            cursor: no-drop;
            }
        </style> 

        <meta name="layout" content="main"/>
        <title>Bandeja de Entrada</title>
    </head>
    <body>
        <g:form>
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
                                    <shiro:hasRole name="Ministerio">
                                        <div id="email-header-tools">
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

                                                <button class="btn btn-primary" type="button" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Notificar a unidad de atencion a victimas del delito">
                                                    <i class="fa fa-send"></i>
                                                </button>
                                                <button class="btn btn-primary" type="button" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Notificar a unidad justicia alternativa restaurativa">
                                                    <i class="fa fa-life-bouy"></i>
                                                </button>

                                                <g:link controller="home" action="moverDenuncia" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" data-original-title="Crear documento relacionado">
                                                    <i class="glyphicon glyphicon-folder-open"></i>
                                                </g:link>
                                                <button class="btn btn-primary" type="button" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Borrar">
                                                    <i class="fa fa-trash-o"></i>
                                                </button>
                                            </div>
                                            <div class="btn-group">
                                                <g:link controller="ministerio" action="denuncia" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" data-original-title="Generar Denuncia/Querella">
                                                    <i class=" glyphicon glyphicon-user"></i>
                                                </g:link>
                                            </div>
                                        </div>
                                    </shiro:hasRole>
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
                                            <shiro:hasRole name="Ministerio">                                                
                                                <g:each in="${expedientesTemporales}" var="expediente" status="i">
                                                        <li class="unread" data-href="${request.contextPath}/home/detail" >
                                                            <div class="chbox">
                                                                <div class="checkbox-nice">
                                                                    <input type="checkbox" name="checkbox${expediente.id}" id="checkbox${expediente.id}">
                                                                    <label for="checkbox${expediente.id}"></label>
                                                                </div>
                                                            </div>
                                                            <div class="star">
                                                                <a></a>
                                                            </div>
                                                    <g:link action="detail"  id="${expediente.id}" style="color: #000000; text-decoration: none;">
                                                            <div class="name">
                                                                ${expediente.numeroExpediente}
                                                            </div>
                                                            <div class="message">
                                                                <span class="label label-danger">${expediente.delito.clasificacionDelito.modalidad}</span>
                                                                <span class="subject">${expediente.delito.imputado.nombre}</span>
                                                                <span class="body">${expediente.delito.clasificacionDelito.nombre}</span>
                                                            </div>
                                                            <div class="meta-info">
                                                                <a href="#" class="attachment">
                                                                    <i class="fa fa-paperclip"></i>
                                                                </a>
                                                                <span><g:formatDate format="dd/MM/yyyy HH:mm" date="${expediente.dateCreated}"/></span>
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
        </g:form>
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
    </body>
</html>

