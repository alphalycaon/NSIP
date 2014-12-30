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
                                <a href="email-compose.html" class="btn btn-success email-compose-btn pull-right">
                                    <i class="fa fa-pencil-square-o"></i> Compose email
                                </a>
                            </div>
                            <header id="email-header" class="clearfix">
                                <div id="email-header-title" class="visible-md visible-lg">
                                    <i class="fa fa-inbox"></i> Inbox
                                </div>
                                <div id="email-header-tools">
                                                                                                                 
                                        <g:link controller="ministerio" action="denuncia" class="btn btn-primary">
                                            <span class="fa fa-play" style="padding-right: 10px;"></span> GENERAR DENUNCIA
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
                                <div class="nano-pane" style="display: block;"><div class="nano-slider" style="height: 400px; transform: translate(0px, 0px);"></div></div></div>
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
                                        <g:each in="${expedientes}">
                                            <li class="unread clickable-row" data-href="home/detail" >
                                                <div class="chbox">
                                                    <div class="checkbox-nice">
                                                        <input type="checkbox" id="m-checkbox-2">
                                                        <label for="m-checkbox-2"></label>
                                                    </div>
                                                </div>
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
                                                    <span class="date"><g:formatDate date="${it.dateCreated}"/></span>
                                                </div>
                                            </li>                                             
                                        </g:each>
                                    </ul>
                                </div>
                                <div class="nano-pane"><div class="nano-slider" style="height: 104px; transform: translate(0px, 0px);"></div></div></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
