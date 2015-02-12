<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>        
        <meta name="layout" content="main"/>
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
                                    <i class="fa fa-inbox"></i> Expedientes
                                </div>                                
                            </div>
                            <header id="email-header" class="clearfix">
                                <shiro:hasRole name="Ministerio">
                                <div id="email-header-title" class="visible-md visible-lg">
                                    <i class="fa fa-inbox"></i> Inbox
                                </div>
                                </shiro:hasRole>
                                <shiro:hasRole name="Juez">
                                <div id="email-header-title" class="visible-md visible-lg">
                                    <i class="fa fa-inbox"></i> Lista de Casos
                                </div>
                                </shiro:hasRole>
                                <shiro:hasRole name="CES">
                                <div id="email-header-title" class="visible-md visible-lg">
                                    <i class="fa fa-inbox"></i> Lista de IPH
                                </div>
                                </shiro:hasRole>
                                <shiro:hasRole name="Defensor">
                                <div id="email-header-title" class="visible-md visible-lg">
                                    <i class="fa fa-inbox"></i> Inbox
                                </div>
                                </shiro:hasRole>
                                <shiro:hasRole name="Ministerio">
                                <div id="email-header-tools">
                                                                                                                 
                                        <g:link controller="ministerio" action="denuncia" class="btn btn-primary">
                                            <span class="fa fa-play" style="padding-right: 10px;"></span> GENERAR DENUNCIA
                                        </g:link>                                    
                                </div>
                                </shiro:hasRole>
                                <shiro:hasRole name="CES">
                                <div id="email-header-tools">
                                                                                                                 
                                        <g:link controller="ces" action="iph" class="btn btn-primary">
                                            <span class="fa fa-play" style="padding-right: 10px;"></span> GENERAR IPH
                                        </g:link>                                    
                                </div>
                                </shiro:hasRole>
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
                        <shiro:hasRole name="Ministerio">
                            <div id="email-navigation" class="email-nav-nano hidden-xs hidden-sm has-scrollbar">
                                <div class="email-nav-nano-content" tabindex="0" style="right: -16px;">                                    
                                    <ul id="email-nav-items" class="clearfix">
                                        <li class="active">
                                            <a href="#">
                                                <i class="fa fa-inbox"></i>
                                                Denuncias/Querellas
                                                <span class="label label-primary pull-right">83</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-star"></i>
                                                Carpetas de Corroboracion
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-pencil"></i>
                                                Carpetas de Investigacion
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-envelope"></i>
                                                Puestas a Disposicion
                                                <span class="label label-default pull-right">11</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-clock-o"></i>
                                                Solicitud de Audiencia
                                                <!--
                                                <span class="label label-default pull-right">1,292</span>
                                                -->
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-arrow-circle-o-up"></i>
                                                Solicitudes
                                                <span class="label label-default pull-right">19</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-play-circle-o"></i>
                                                Notificar
                                                <!--
                                                <span class="label label-default pull-right">1,292</span>
                                                -->
                                            </a>
                                        </li>
                                        </br>
                                        </br>
                                        </br>
                                        </br>
                                        </br>
                                        </br>
                                        </br>
                                        </br>
                                        <li>
                                            <big><b><a href="#" data-toggle="modal" data-target="#myModal">
                                            <i class="fa fa-file-word-o"></i>
                                                Plantillas
                                            </a></b></big>
                                        </li>
                                    </ul>                                    
                                </div>
                                <div class="nano-pane" style="display: block;"><div class="nano-slider" style="height: 400px; transform: translate(0px, 0px);"></div></div>
                            </div>                
                        </shiro:hasRole>
                        <shiro:hasRole name="CES">   
                            <div id="email-navigation" class="email-nav-nano hidden-xs hidden-sm has-scrollbar">
                                <div class="email-nav-nano-content" tabindex="0" style="right: -16px;">                                    
                                    <ul id="email-nav-items" class="clearfix">
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-user"></i>
                                                Usuario
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-folder-o"></i>
                                                Denuncias
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-times-circle"></i>
                                                Hecho delictivo
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-briefcase"></i>
                                                Objetos asegurados
                                            </a>
                                        </li>
                                        <li class="active">
                                            <a href="#">
                                                <i class="fa fa-inbox"></i>
                                                Informe policial
                                                <span class="label label-primary pull-right">12</span>
                                                <!--
                                                <span class="label label-default pull-right">1,292</span>
                                                -->
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-medkit"></i>
                                                Servicio médico
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-link"></i>
                                                Cadena de custodia
                                                <!--
                                                <span class="label label-default pull-right">1,292</span>
                                                -->
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-bullhorn"></i>
                                                Notifica a M.P.
                                                <!--
                                                <span class="label label-default pull-right">1,292</span>
                                                -->
                                            </a>
                                        </li>
                                        </br>
                                        </br>
                                        </br>
                                        </br>
                                        </br>
                                        </br>
                                        </br>
                                        <li>
                                            <big><b><a href="#" data-toggle="modal" data-target="#myModal">
                                            <i class="fa fa-file-word-o"></i>
                                                Plantillas
                                            </a></b></big>
                                        </li>
                                    </ul>                                    
                                </div>
                                <div class="nano-pane" style="display: block;"><div class="nano-slider" style="height: 400px; transform: translate(0px, 0px);"></div></div>
                            </div>
                        </shiro:hasRole>
                        <shiro:hasRole name="Juez">
                            <div id="email-navigation" class="email-nav-nano hidden-xs hidden-sm has-scrollbar">
                                <div class="email-nav-nano-content" tabindex="0" style="right: -16px;">                                    
                                    <ul id="email-nav-items" class="clearfix">
                                        <li class="active">
                                            <a href="#">
                                                <i class="fa fa-inbox"></i>
                                                1era-2da Instancia
                                                <span class="label label-primary pull-right">20</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-user"></i>
                                                Usuario
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-pencil"></i>
                                                Registro de causas
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-flag"></i>
                                                Solicitud de audiencia
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-envelope-o"></i>
                                                Solicitudes diversas
                                                <!--
                                                <span class="label label-default pull-right">1,292</span>
                                                -->
                                            </a>
                                        </li>
                                        <li>
                                            <a href="home/calendar">
                                                <i class="fa fa-calendar"></i>
                                                Agenda de audiencias
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-bullhorn"></i>
                                                Notificar
                                                <!--
                                                <span class="label label-default pull-right">1,292</span>
                                                -->
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-check-circle"></i>
                                                Resoluciones
                                                <!--
                                                <span class="label label-default pull-right">1,292</span>
                                                -->
                                            </a>
                                        </li>
                                        </br>
                                        </br>
                                        </br>
                                        </br>
                                        </br>
                                        </br>
                                        </br>
                                        </br>
                                        <li>
                                            <big><b><a href="#" data-toggle="modal" data-target="#myModal">
                                            <i class="fa fa-file-word-o"></i>
                                                Plantillas
                                            </a></b></big>
                                        </li>
                                    </ul>                                    
                                </div>
                                <div class="nano-pane" style="display: block;"><div class="nano-slider" style="height: 400px; transform: translate(0px, 0px);"></div></div>
                            </div>
                        </shiro:hasRole>    
                        <shiro:hasRole name="Defensor">
                            <div id="email-navigation" class="email-nav-nano hidden-xs hidden-sm has-scrollbar">
                                <div class="email-nav-nano-content" tabindex="0" style="right: -16px;">                                    
                                    <ul id="email-nav-items" class="clearfix">
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-user"></i>
                                                Usuario
                                            </a>
                                        </li>
                                        <li class="active">
                                            <a href="#">
                                                <i class="fa fa-inbox"></i>
                                                Solicitudes de defensor
                                                <span class="label label-primary pull-right">1</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-times-circle"></i>
                                                Notificación de detenido
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-exclamation-triangle"></i>
                                                Notificaciones
                                                <span class="label label-default pull-right">6</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-flag"></i>
                                                Solicitud de Audiencia
                                                <!--
                                                <span class="label label-default pull-right">1,292</span>
                                                -->
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-taxi"></i>
                                                Peritos
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-file-o"></i>
                                                Reg. de medios de prueba
                                                <!--
                                                <span class="label label-default pull-right">1,292</span>
                                                -->
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-university"></i>
                                                Apelaciones
                                                <!--
                                                <span class="label label-default pull-right">1,292</span>
                                                -->
                                            </a>
                                        </li>
                                        </br>
                                        </br>
                                        </br>
                                        </br>
                                        </br>
                                        </br>
                                        </br>
                                        </br>
                                        <li>
                                            <big><b><a href="#" data-toggle="modal" data-target="#myModal">
                                            <i class="fa fa-file-word-o"></i>
                                                Plantillas
                                            </a></b></big>
                                        </li>
                                    </ul>                                    
                                </div>
                                <div class="nano-pane" style="display: block;"><div class="nano-slider" style="height: 400px; transform: translate(0px, 0px);"></div></div>
                            </div>
                        </shiro:hasRole>   
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
                                        <g:each in="${expedientes}">
                                            <li class="unread clickable-row" data-href="home/detail" >
                                                <div class="name">
                                                    ${it.numeroExpediente}
                                                </div>
                                                <div class="message">
                                                    <span class="label label-danger">${it.delito.clasificacionDelito.modalidad}</span>
                                                    <span class="subject">${it.delito.imputado.nombre}</span>
                                                    <span class="body">${it.delito.clasificacionDelito.nombre}</span>
                                                </div>
                                                <div class="meta-info">
                                                    <a href="#" class="attachment">
                                                        <i class="fa fa-paperclip"></i>
                                                    </a>
                                                    <span><g:formatDate format="dd/MM/yyyy HH:mm" date="${it.dateCreated}"/></span>
                                                </div>
                                            </li>                                             
                                        </g:each>                                        
                                        </shiro:hasRole> 
                                        <shiro:hasRole name="Juez">
                                        <g:each in="${expedientes}">
                                            <li class="unread clickable-row" data-href="home/detail" >
                                                <div class="name">
                                                    ${it.numeroExpediente}
                                                </div>
                                                <div class="message">
                                                    <span class="label label-danger">${it.delito.clasificacionDelito.modalidad}</span>
                                                    <span class="subject">${it.delito.imputado.nombre}</span>
                                                    <span class="body">${it.delito.clasificacionDelito.nombre}</span>
                                                </div>
                                                <div class="meta-info">
                                                    <a href="#" class="attachment">
                                                        <i class="fa fa-paperclip"></i>
                                                    </a>
                                                    <span><g:formatDate format="dd/MM/yyyy HH:mm" date="${it.dateCreated}"/></span>
                                                </div>
                                            </li>                                             
                                        </g:each>                                        
                                        </shiro:hasRole> 
                                        <shiro:hasRole name="Defensor">
                                        <g:each in="${expedientes}">
                                            <li class="unread clickable-row" data-href="home/detail" >
                                                <div class="name">
                                                    ${it.numeroExpediente}
                                                </div>
                                                <div class="message">
                                                    <span class="label label-danger">${it.delito.clasificacionDelito.modalidad}</span>
                                                    <span class="subject">${it.delito.imputado.nombre}</span>
                                                    <span class="body">${it.delito.clasificacionDelito.nombre}</span>
                                                </div>
                                                <div class="meta-info">
                                                    <a href="#" class="attachment">
                                                        <i class="fa fa-paperclip"></i>
                                                    </a>
                                                    <span><g:formatDate format="dd/MM/yyyy HH:mm" date="${it.dateCreated}"/></span>
                                                </div>
                                            </li>                                             
                                        </g:each>                                        
                                        </shiro:hasRole>
                                        <shiro:hasRole name="CES"> 
                                        <g:each in="${iphs}">
                                            <li class="unread clickable-row" data-href="home/detail">
                                                <div class="name">
                                                    ${it.numeroIph}
                                                </div>
                                                <div class="meta-info">
                                                    <a href="#" class="attachment">
                                                        <i class="fa fa-paperclip"></i>
                                                    </a>
                                                    <span><g:formatDate format="dd/MM/yyyy HH:mm" date="${it.dateCreated}"/></span>
                                                </div>
                                            </li>                                             
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
        <!--Modal-->
             <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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