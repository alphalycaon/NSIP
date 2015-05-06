<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Archivos de la Denuncia</title>

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
            #myTab{border-bottom-color: transparent; }
            #myTabArchivos{border-bottom-color: transparent; }            
        </style>
        <link href="${resource(dir: 'centaurus/assets/css/', file: 'video-default.css')}" rel="stylesheet">

        <style type="text/css">
            .not-active {
            cursor: no-drop;
            }
        </style>

        <script src="${resource(dir: 'centaurus/js',file:'jquery.js')}"></script>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file:'dropzone.css')}"/>



        <meta name="layout" content="main"/>
    </head>
    <body>

        <div class="row">
            <div class="col-lg-12">

                <header class="main-box-header clearfix">                                                        
                    <h3>Datos de la Denuncia</h3>
                </header>
               
                
                    <div class="main-box-body clearfix">
                        <doc:explorerAndUpload numeroExpediente="${expediente.numeroExpediente}"/>

                        <div class="col-lg-12" style="padding: 0px 25px 25px;">
                            <div id="email-detail" class="email-detail-nano" style="height: 627px;">
                                <g:link controller="home" action="index" class="btn btn-primary btn-lg">
                                    TERMINAR
                                </g:link>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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

    </body>
</html>
