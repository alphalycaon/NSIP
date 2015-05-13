<!DOCTYPE html>
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
        <script src="${resource(dir: 'centaurus/js', file: 'jquery.js')}"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=places&sensor=false"></script>
        <script>
            // VARIABLES GLOBALES JAVASCRIPT
            var componentesUI_Rol = {};
            var rolesDenuncia = ['denunciante', 'victima', 'testigo', 'imputado'];
            //var tiposId = ['direccion', 'latitud', 'longitud', 'mapCanvas'];
            //var tiposComponentesUI = ['mapaGoogle', 'cuadroBusqueda'];
            var idsCamposRol = {
                denunciante: {
                    direccion: 'denuncianteDireccion',
                    latitud: 'denuncianteLatitud',
                    longitud: 'denuncianteLongitud',
                    mapCanvas: 'denuncianteMapCanvas', 
                    contenedorMapa: 'denuncianteContenedorMapa',
                    seccion: 'pasoDenunciante',
                    btnBuscarDireccion : 'btnBuscarDirDenunciante'},
                victima: {
                    direccion: 'victimaDireccion',
                    latitud: 'victimaLatitud',
                    longitud: 'victimaLongitud',
                    mapCanvas: 'victimaMapCanvas', 
                    contenedorMapa: 'victimaContenedorMapa',
                    seccion: 'pasoVictima',
                    btnBuscarDireccion : 'btnBuscarDirVicitma'},
                testigo: {
                    direccion: 'testigoDireccion',
                    latitud: 'testigoLatitud',
                    longitud: 'testigoLongitud',
                    mapCanvas: 'testigoMapCanvas',
                    contenedorMapa: 'testigoContenedorMapa', 
                    seccion: 'pasoTestigo',
                    btnBuscarDireccion : 'btnBuscarDirTestigo'},
                imputado: {
                    direccion: 'imputadoDireccion',
                    latitud: 'imputadoLatitud',
                    longitud: 'imputadoLongitud',
                    mapCanvas: 'imputadoMapCanvas',
                    contenedorMapa: 'imputadoContenedorMapa', 
                    seccion: 'pasoImputado',
                    btnBuscarDireccion : 'btnBuscarDirImputado'}
            };

            /**
                Ejecutada en el evento en que el DOM está listo ($(document).ready())
                ; es decir, antes de mostrar la página
            **/
            function initComponentesUIBusqueda(){
              console.log('Inicio initComponentesUIBusqueda()');
              rolesDenuncia.forEach(function(rolDenuncia) {
                //Inicializar mapa de Google y campo de búsqueda por cada rol en denuncia
                var mapaRol = new MapaRol(idsCamposRol[rolDenuncia].mapCanvas, rolDenuncia);
                var campoBusquedaRol = crearCampoBusqueda(idsCamposRol[rolDenuncia].direccion, mapaRol.mapaGoogle);
            
                configInicialMarcadorMapa(mapaRol);
                configInicialBotonesBusqueda(mapaRol);
                configRenderizadoMapa(mapaRol);
                configAccionesMapa(mapaRol);
                
                componentesUI_Rol[rolDenuncia] = {
                  mapaRol:  mapaRol,
                  campoBusquedaRol: campoBusquedaRol
                };
              });
              //configRenderizadoMapa();
              console.log('Fin initComponentesUIBusqueda()');
            }


            function MapaRol(idContenedorMapa, rolDenuncia) {
                this.geocoder = new google.maps.Geocoder();
                this.latLng = new google.maps.LatLng(19.4288627,-99.16178658);
                this.mapOpt = {
                    zoom: 13,
                    center: this.latLng,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    disableDoubleClickZoom: true,
                    draggable: false,
                    scrollwheel: false
                };
                this.mapaGoogle = new google.maps.Map(document.getElementById(idContenedorMapa), this.mapOpt);
                this.marcador = crearMarcador(this.mapaGoogle, this.latLng, 'Arrastra el marcador si quieres moverlo');
                this.rolDenuncia = rolDenuncia;
            }

            function crearCampoBusqueda(idCampoDireccion, mapaGoogle){
              var input = /** @type {HTMLInputElement} */(
                  document.getElementById(idCampoDireccion));

              return new google.maps.places.SearchBox(
                  /** @type {HTMLInputElement} */(input));
            }

            function crearMarcador(mapaGoogle, latLng, titulo){
              return new google.maps.Marker({
                  position: latLng,
                  title: titulo,
                  map: mapaGoogle,
                  draggable: true
              });
            }

            function configInicialMarcadorMapa(mapaRol){
              var idCampoDireccion = idsCamposRol[mapaRol.rolDenuncia].direccion;
              var idCampoLatitud = idsCamposRol[mapaRol.rolDenuncia].latitud;
              var idCampoLongitud = idsCamposRol[mapaRol.rolDenuncia].longitud;

              // Escucho el CLICK sobre el mapa y si se produce actualizo la posicion del marcador
              google.maps.event.addListener(mapaRol.mapaGoogle, 'click', function(event) {
                updateMarker(event.latLng, mapaRol.marcador, mapaRol.geocoder, idCampoDireccion, idCampoLatitud, idCampoLongitud);
              });

              // Inicializo los datos del marcador
              // updateMarkerPosition(latLng);
              geocodePosition(mapaRol.latLng, mapaRol.geocoder, idCampoDireccion);

              // Permito los eventos drag/drop sobre el marcador
              google.maps.event.addListener(mapaRol.marcador, 'dragstart', function() {
                  updateMarkerAddress('Arrastrando...', idCampoDireccion);
              });

              google.maps.event.addListener(mapaRol.marcador, 'drag', function() {
                  updateMarkerStatus('Arrastrando...', idCampoDireccion);
                  updateMarkerPosition(mapaRol.marcador.getPosition(), idCampoLatitud, idCampoLongitud);
              });

              google.maps.event.addListener(mapaRol.marcador, 'dragend', function() {
                  updateMarkerStatus('Arrastre finalizado', idCampoDireccion);
                  geocodePosition(mapaRol.marcador.getPosition(), mapaRol.geocoder, idCampoDireccion);
              });
            }
            
            function configInicialBotonesBusqueda(mapaRol){
                var idBtnBuscarDir = idsCamposRol[mapaRol.rolDenuncia].btnBuscarDireccion;
              $('#' + idBtnBuscarDir).on('click',function(){
                console.log('entro al click handler');
                var idCampoDireccion = idsCamposRol[mapaRol.rolDenuncia].direccion;
                var idCampoLatitud = idsCamposRol[mapaRol.rolDenuncia].latitud;
                var idCampoLongitud = idsCamposRol[mapaRol.rolDenuncia].longitud;
                codeAddress(idCampoDireccion, mapaRol, idCampoLatitud, idCampoLongitud);
              });
            }
             
            function configRenderizadoMapa(mapaRol){
                var idSeccionRol = idsCamposRol[mapaRol.rolDenuncia].seccion; 
                $('#' + idSeccionRol).on('click', function(){
                    console.log('Ejecución manejador click sección ' + mapaRol.rolDenuncia);
                    setTimeout(function(){ 
                            google.maps.event.trigger(mapaRol.mapaGoogle, 'resize'); 
                            mapaRol.mapaGoogle.setCenter(mapaRol.marcador.getPosition());
                        }, 50);
                });
            }
            
            function configAccionesMapa(mapaRol){
                var idMapCanvas = idsCamposRol[mapaRol.rolDenuncia].mapCanvas;
                $('#' + idMapCanvas).on('click', function(){
                    mapaRol.mapaGoogle.setOptions({
                        disableDoubleClickZoom: false,
                        draggable: true,
                        scrollwheel: true
                    });
                });
            }

            // ESTA FUNCION OBTIENE LA DIRECCION A PARTIR DE LAS COORDENADAS POS
            function geocodePosition(pos, geocoder, idCampoDireccion) {
                geocoder.geocode({ latLng: pos }, function(responses) {
                    if (responses && responses.length > 0) {
                        updateMarkerAddress(responses[0].formatted_address, idCampoDireccion);
                    }else {
                        updateMarkerAddress('No puedo encontrar esta direccion.', idCampoDireccion);
                    }
                });
            }

            // OBTIENE LA DIRECCION A PARTIR DEL LAT y LON DEL FORMULARIO
            function codeLatLon(idCampoLongitud, idCampoLatitud, mapaRol) {
                var str = document.getElementById(idCampoLongitud).value + " , " + document.getElementById(idCampoLatitud).value;
                var latLng2 = new google.maps.LatLng(document.getElementById(idCampoLatitud).value ,document.getElementById(idCampoLongitud).value);
                mapaRol.marcador.setPosition(latLng2);
                mapaRol.mapaGoogle.setCenter(latLng2);
                geocodePosition (latLng2, mapaRol.geocoder, idsCamposRol[mapaRol.rolDenuncia].direccion);
                // document.getElementById('direccion').value = str+" OK";
            }

            // OBTIENE LAS COORDENADAS DESDE lA DIRECCION EN LA CAJA DEL FORMULARIO
            function codeAddress(idCampoDireccion, mapaRol, idCampoLatitud, idCampoLongitud) {
                var address = document.getElementById(idCampoDireccion).value;
                mapaRol.geocoder.geocode( { 'address': address}, function(results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        updateMarkerPosition(results[0].geometry.location, idCampoLatitud, idCampoLongitud);
                        mapaRol.marcador.setPosition(results[0].geometry.location);
                        mapaRol.mapaGoogle.setCenter(results[0].geometry.location);
                        mapaRol.mapaGoogle.setZoom(16);
                    } else {
                        alert('ERROR : ' + status);
                    }
                });
            }

            function updateMarkerStatus(msg, idCampoDireccion) {
                document.getElementById(idCampoDireccion).value = msg;
            }

            // RECUPERO LOS DATOS LON LAT Y DIRECCION Y LOS PONGO EN EL FORMULARIO
            function updateMarkerPosition (latLng, idCampoLatitud, idCampoLongitud) {
                document.getElementById(idCampoLongitud).value = latLng.lng();
                document.getElementById(idCampoLatitud).value = latLng.lat();
            }

            function updateMarkerAddress(msg, idCampoDireccion) {
                document.getElementById(idCampoDireccion).value = msg;
            }

            // ACTUALIZO LA POSICION DEL MARCADOR
            function updateMarker(location, marcador, geocoder, idCampoDireccion, idCampoLatitud, idCampoLongitud) {
                marcador.setPosition(location);
                updateMarkerPosition(location, idCampoLatitud, idCampoLongitud);
                geocodePosition(location, geocoder, idCampoDireccion);
            }
        </script>
        
        
        
        <script type="text/javascript">

            // ref: http://diveintohtml5.org/detect.html
            function supports_input_placeholder()
            {
            var i = document.createElement('input');
            return 'placeholder' in i;
            }

            if(!supports_input_placeholder()) {
            var fields = document.getElementsByTagName('INPUT');
            for(var i=0; i < fields.length; i++) {
            if(fields[i].hasAttribute('placeholder')) {
            fields[i].defaultValue = fields[i].getAttribute('placeholder');
            fields[i].onfocus = function() { if(this.value == this.defaultValue) this.value = ''; }
            fields[i].onblur = function() { if(this.value == '') this.value = this.defaultValue; }
            }
            }
            }

        </script>

        <script type="text/javascript">
            //Función que permite solo Números
            function ValidaSoloNumeros() {
             if ((event.keyCode < 48) || (event.keyCode > 57)) 
            event.returnValue = false;
            }

            function txNombres() {
                if ((event.keyCode != 32) && (event.keyCode < 65) || (event.keyCode > 90) && (event.keyCode < 97) || (event.keyCode > 122))
            event.returnValue = false;
            }

            function validarCampos(){
            /*
            VNomDelito = document.getElementById("NomDelito").value;
            VModalidadDelito = document.getElementById("ModalidadDelito").value;
            VmodusDelito = document.getElementById("modusDelito").value;
            VnombreVictima = document.getElementById("nombreVictima").value;
            VedadVictima = document.getElementById("edadVictima").value;

            VestCivilVictima = document.getElementById("estCivilVictima").value;
            VescVictima = document.getElementById("escVictima").value;
            VnombreImputado = document.getElementById("nombreImputado").value;
            VedadImputado = document.getElementById("edadImputado").value;
            VestCivilImputado = document.getElementById("estCivilImputado").value;
            VescImputado = document.getElementById("escImputado").value;

            if(VNomDelito.length == 0 || /^\s+$/.test(VNomDelito)){
            return false;   
            }
            else if(VModalidadDelito.length == 0 || /^\s+$/.test(VModalidadDelito)){
            return false;   
            }
            else if(VmodusDelito.length == 0 || /^\s+$/.test(VmodusDelito)){
            return false;   
            }
            else if(VnombreVictima.length == 0 || /^\s+$/.test(VnombreVictima)){
            return false;   
            }
            else if(VedadVictima.length == 0 || /^\s+$/.test(VedadVictima)){
            return false;   
            }
            else if(VestCivilVictima.length == 0 || /^\s+$/.test(VestCivilVictima)){
            return false;   
            }
            else if(VescVictima.length == 0 || /^\s+$/.test(VescVictima)){
            return false;   
            }
            else if(VnombreImputado.length == 0 || /^\s+$/.test(VnombreImputado)){
            return false;   
            }
            else if(VestCivilImputado.length == 0 || /^\s+$/.test(VestCivilImputado)){
            return false;   
            }
            else if(VescImputado.length == 0 || /^\s+$/.test(VescImputado)){
            return false;   
            }	
            else if(VedadImputado.length == 0 || /^\s+$/.test(VedadImputado)){
            return false;   
            }	
            {
            return true;
            }*/
            return true;
            }

        </script> 

        <style type="text/css">

            input:required:invalid, input:focus:invalid {
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAeVJREFUeNqkU01oE1EQ/mazSTdRmqSxLVSJVKU9RYoHD8WfHr16kh5EFA8eSy6hXrwUPBSKZ6E9V1CU4tGf0DZWDEQrGkhprRDbCvlpavan3ezu+LLSUnADLZnHwHvzmJlvvpkhZkY7IqFNaTuAfPhhP/8Uo87SGSaDsP27hgYM/lUpy6lHdqsAtM+BPfvqKp3ufYKwcgmWCug6oKmrrG3PoaqngWjdd/922hOBs5C/jJA6x7AiUt8VYVUAVQXXShfIqCYRMZO8/N1N+B8H1sOUwivpSUSVCJ2MAjtVwBAIdv+AQkHQqbOgc+fBvorjyQENDcch16/BtkQdAlC4E6jrYHGgGU18Io3gmhzJuwub6/fQJYNi/YBpCifhbDaAPXFvCBVxXbvfbNGFeN8DkjogWAd8DljV3KRutcEAeHMN/HXZ4p9bhncJHCyhNx52R0Kv/XNuQvYBnM+CP7xddXL5KaJw0TMAF8qjnMvegeK/SLHubhpKDKIrJDlvXoMX3y9xcSMZyBQ+tpyk5hzsa2Ns7LGdfWdbL6fZvHn92d7dgROH/730YBLtiZmEdGPkFnhX4kxmjVe2xgPfCtrRd6GHRtEh9zsL8xVe+pwSzj+OtwvletZZ/wLeKD71L+ZeHHWZ/gowABkp7AwwnEjFAAAAAElFTkSuQmCC);
            background-position: right top;
            background-repeat: no-repeat;
            border-color:red;
            -moz-box-shadow: none;
            }
            input:required:valid {
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAepJREFUeNrEk79PFEEUx9/uDDd7v/AAQQnEQokmJCRGwc7/QeM/YGVxsZJQYI/EhCChICYmUJigNBSGzobQaI5SaYRw6imne0d2D/bYmZ3dGd+YQKEHYiyc5GUyb3Y+77vfeWNpreFfhvXfAWAAJtbKi7dff1rWK9vPHx3mThP2Iaipk5EzTg8Qmru38H7izmkFHAF4WH1R52654PR0Oamzj2dKxYt/Bbg1OPZuY3d9aU82VGem/5LtnJscLxWzfzRxaWNqWJP0XUadIbSzu5DuvUJpzq7sfYBKsP1GJeLB+PWpt8cCXm4+2+zLXx4guKiLXWA2Nc5ChOuacMEPv20FkT+dIawyenVi5VcAbcigWzXLeNiDRCdwId0LFm5IUMBIBgrp8wOEsFlfeCGm23/zoBZWn9a4C314A1nCoM1OAVccuGyCkPs/P+pIdVIOkG9pIh6YlyqCrwhRKD3GygK9PUBImIQQxRi4b2O+JcCLg8+e8NZiLVEygwCrWpYF0jQJziYU/ho2TUuCPTn8hHcQNuZy1/94sAMOzQHDeqaij7Cd8Dt8CatGhX3iWxgtFW/m29pnUjR7TSQcRCIAVW1FSr6KAVYdi+5Pj8yunviYHq7f72po3Y9dbi7CxzDO1+duzCXH9cEPAQYAhJELY/AqBtwAAAAASUVORK5CYII=);
            background-position: right top;
            border-color:green;
            background-repeat: no-repeat;
            }

        </style>

        <title>Generar Denuncia/Querella</title>


        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/bootstrap',file:'bootstrap.min.css')}"/>
        <script src="${resource(dir: 'centaurus/js',file:'demo-rtl.js')}"></script>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file:'font-awesome.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file:'nanoscroller.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/compiled', file:'layout.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/compiled', file:'elements.css')}"/>
        <link rel="stylesheet" href="${resource(dir: 'centaurus/css/libs/fullcalendar.css')}"  type="text/css"/>
        <link rel="stylesheet" href="${resource(dir: 'centaurus/css/libs/fullcalendar.print.css')}"  type="text/css" media="print"/>
        <link rel="stylesheet" href="${resource(dir: 'centaurus/css/compiled/calendar.css')}"  type="text/css" media="screen"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file:'morris.css')}" />
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file:'daterangepicker.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file:'jquery-jvectormap-1.2.2.css')}" />


        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs/', file: 'bootstrap-editable.css')}">

        <!--link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/compiled/', file: 'theme_styles.css')}"/-->
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'select2.css')}"/>
        <!--link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs/', file: 'bootstrap-editable.css')}"-->



        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/compiled/', file: 'wizard.css')}">


    </head>
    <body>
        <style>
            .mapCanvas {
            width: 1065px;
                height: 540px;
                margin: 0 auto;
            }
            
            .btn-buscarDireccion{}
            .rolDenuncia{}
            .mapContainer{
            }
        </style>
        <div class="row">
            <div class="col-lg-12">
                <div class="main-box clearfix">
                    <header class="main-box-header clearfix">
                        <ol class="breadcrumb">
                            <li><a href="${request.contextPath}">Inicio</a></li>

                            <li>Expediente RED</li>
                            <li class="active"><span>Denuncia/Querella</span></li>
                        </ol>
                        <h1>Crear Denuncia o Querella</h1>


                    </header>
                    <div class="main-box-body clearfix">
                        <header class="main-box-header clearfix">
                            <h2>Captura los datos en el orden presentado</h2>
                        </header>
                        <div class="main-box-body clearfix">
                            <div class="modal fade" id="myModalVentanaEmer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel">Cancelar Registro de Denuncia/Querella</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div>
                                                ¿Está seguro que desea cancelar el registro?
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <a href="${request.contextPath}" class="btn btn-primary" >                                            
                                                <span  style="padding-right: 10px;"></span> Si
                                            </a>   
                                            <a data-dismiss="modal" class="btn btn-danger">                                            
                                                <span style="padding-right: 10px;"></span> No
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="myWizard" class="wizard">
                            <div class="wizard-inner">
                                <ul id="contenedorPasosDenuncia" class="steps">
                                    <li data-target="#step1" class="complete"><span class="badge badge-primary">1</span>Delito<span class="chevron"></span></li>
                                    <li id="pasoDenunciante" data-target="#step2" class="complete rolDenuncia"><span class="badge">2</span>Denunciante<span class="chevron"></span></li>
                                    <li id="pasoVictima" data-target="#step3" class="complete rolDenuncia"><span class="badge">3</span>Victima<span class="chevron"></span></li>
                                    <li id="pasoTestigo" data-target="#step4" class="complete rolDenuncia"><span class="badge">4</span>Testigo<span class="chevron"></span></li>

                                    <li id="pasoImputado" data-target="#step5" class="complete rolDenuncia"><span class="badge">5</span>Imputado<span class="chevron"></span></li>
                                    <li data-target="#step6" class="complete"><span class="badge">6</span>Doc. Relacionados<span class="chevron"></span></li>
                                    <li data-target="#step7" class="complete"><span class="badge">7</span>Plantillas<span class="chevron"></span></li>
                                </ul>
                                <script type="text/javascript">
                                    function insertaDenuncia( obj){
                                    console.log($(obj).html());
                                    if($(obj).html().indexOf('Terminar')==0){ 
                                    console.log($('#numExpediente').text())
                                    console.log($('#denuncia'));
                                    $('#numeroExpediente').val($('#numExpediente').text()); 
                                    $('#denuncia').submit();
                                    }
                                    }
                                </script>

                                <div class="actions" style="z-index: 1">
                                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModalVentanaEmer"></i>Cancelar</button>
                                    <button type="button" class="btn btn-default btn-mini btn-prev"></i>Anterior</button>
                                    <button type="button" class="btn btn-success btn-mini btn-next" data-last="Terminar" onclick="javascript:insertaDenuncia(this)">Siguiente</i></button>
                                </div>
                            </div>
                            <g:form controller="ministerio" action="guardarDenuncia" name="denuncia" onsubmit="return validarCampos()">
                                <div class="step-content">
                                    <div class="step-pane active" id="step1">
                                        <br/>
                                        <h4>1.- Datos del delito</h4>
                                        <div class="form-group">
                                            <label for="delito">Nombre</label>
                                            <input type="text" class="form-control" id="NomDelito" required name="clasificacionDelito.nombre" placeholder="Nombre del delito"  data-toggle="tooltip" data-placement="top" title="Escribir Nombre del Delito" onkeypress="txNombres()">
                                        </div>
                                        <!--div class="form-group">
                                            <label for="exampleInputEmail1">Modalidad </label>
                                            <input type="text" class="form-control" id="ModalidadDelito" name="clasificacionDelito.modalidad" placeholder="Modalidad del delito"  data-toggle="tooltip" data-placement="top" title="Escribir Modalidad del Delito" onkeypress="txNombres()">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Modus</label>
                                            <input type="text" class="form-control" id="modusDelito" name="clasificacionDelito.modus" placeholder="Modus del delito"  data-toggle="tooltip" data-placement="top" title="Escribir Modus del Delito" onkeypress="txNombres()">
                                        </div-->    
                                    </div>
                                    
                                    <div class="step-pane" id="step2">
                                        <br/>
                                        <h4>2.- Datos del denunciante</h4>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Nombre </label>
                                            <input type="text" class="form-control" id="nombreDenunciante" required name="denunciante.nombre" placeholder="Nombre completo del denunciante"   data-toggle="tooltip" data-placement="top" title="Escribir Nombre Completo del Denunciante" onkeypress="txNombres()">
                                        </div>                                                
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Genero </label>
                                            <select class="form-control" name="denunciante.genero">
                                                <option>Masculino</option>
                                                <option>Femenino</option>
                                            </select>
                                        </div>                                                
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Edad</label>
                                            <input type="text" class="form-control"  id="edadDenunciante" required name="denunciante.edad" placeholder="Edad del denunciante"   data-toggle="tooltip" data-placement="top" title="Escribir Edad Denunciante" onkeypress="ValidaSoloNumeros()" maxlength="2">
                                        </div>                                                
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Estado Civil</label>
                                            <input type="text" class="form-control" id="estCivilDenunciante" required name="denunciante.estadoCivil" placeholder="Estado civil del denunciante"  data-toggle="tooltip" data-placement="top" title="Escribir Estado Civil" onkeypress="txNombres()">
                                        </div>                                                
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Escolaridad</label>
                                            <input type="text" class="form-control" id="escDenunciante" required name="denunciante.escolaridad" placeholder="Escolaridad del denunciante"  data-toggle="tooltip" data-placement="top" title="Escribir Escolaridad" onkeypress="txNombres()">
                                        </div>                                          
                                        <div class="form-group">
                                                    <label for="exampleInputEmail1">Ubicación</label>
                                                    <input type="text" class="form-control" name="denunciante.ubicacion" id="denuncianteDireccion" placeholder="Ubicación" required>                                              
                                                </div>
                                                <div>
                                                    <table>
                                                        <tr>
                                                            <td><p style="font-size: 10px;font-family: verdana;font-weight: bold;">
                                                                    <input id="btnBuscarDirDenunciante"type="button" class="btn btn-success btn-buscarDireccion" value="Buscar" required/>
                                                                </p>
                                                            </td>
                                                            <td><p style="font-size: 10px;font-family: verdana;font-weight: bold;">
                                                                    <input type="text" name="denunciante.latitud" id="denuncianteLatitud" hidden="true" style="width: 100px;font-size: 10px;font-family: verdana;font-weight: bold;" required/>	    
                                                                </p>
                                                            </td>
                                                            <td> <p style="font-size: 10px;font-family: verdana;font-weight: bold;">
                                                                    <input type="text" name="denunciante.longitud" id="denuncianteLongitud" hidden="true" style="width: 100px;font-size: 10px;font-family: verdana;font-weight: bold;" required/>	
                                                                </p>
                                                            </td>	
                                                        </tr>
                                                    </table> 
                                                </div>
                                                    <div id="denuncianteMapCanvas" class="mapCanvas"></div>
                                                 
                                                                                                 
                                    </div>
                                    <div class="step-pane" id="step3">
                                        <br/>
                                        <h4>3.- Datos de la victima</h4>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Nombre </label>
                                            <input type="text" class="form-control" id="nombreVictima" required  name="victima.nombre" placeholder="Nombre completo de la victima"  data-toggle="tooltip" data-placement="top" title="Escribir Nombre Completo de la Victima" onkeypress="txNombres()">
                                        </div>                                                
                                        <div class="form-group" required>
                                            <label for="exampleInputEmail1">Genero </label>
                                            <select class="form-control" name="victima.genero">
                                               <option>Masculino</option>
                                                <option>Femenino</option>
                                            </select>
                                        </div>                                                
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Edad</label>
                                            <input type="text" class="form-control" id="edadVictima" required name="victima.edad" placeholder="Edad de la victima"  data-toggle="tooltip" data-placement="top" title="Escribir solo Número" onkeypress="ValidaSoloNumeros()" maxlength="2">
                                        </div>                                                
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Estado Civil</label>
                                            <input type="text" class="form-control" id="estCivilVictima" required name="victima.estadoCivil" placeholder="Estado civil de la victima"   data-toggle="tooltip" data-placement="top" title="Escribir Estado Civil" onkeypress="txNombres()">
                                        </div>                                                
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Escolaridad</label>
                                            <input type="text" class="form-control" id="escVictima" required name="victima.escolaridad" placeholder="Escolaridad de la victima"   data-toggle="tooltip" data-placement="top" title="Escribir Escolaridad" onkeypress="txNombres()">
                                        </div>                                              
                                        <div class="form-group">
                                                    <label for="exampleInputEmail1">Ubicación</label>
                                                    <input type="text" class="form-control" name="victima.ubicacion" id="victimaDireccion" placeholder="Ubicación" required>                                              
                                                </div>
                                                <div>
                                                    <table>
                                                        <tr>
                                                            <td><p style="font-size: 10px;font-family: verdana;font-weight: bold;">
                                                                    <input id="btnBuscarDirVictima" type="button" class="btn btn-success btn-buscarDireccion" value="Buscar" required/>
                                                                </p>
                                                            </td>
                                                            <td><p style="font-size: 10px;font-family: verdana;font-weight: bold;">
                                                                    <input type="text" name="victima.latitud" id="victimaLatitud" hidden="true" style="width: 100px;font-size: 10px;font-family: verdana;font-weight: bold;" required/>	    
                                                                </p>
                                                            </td>
                                                            <td> <p style="font-size: 10px;font-family: verdana;font-weight: bold;">
                                                                    <input type="text" name="vctima.longitud" id="victimaLongitud" hidden="true" style="width: 100px;font-size: 10px;font-family: verdana;font-weight: bold;" required/>	
                                                                </p>
                                                            </td>	
                                                        </tr>
                                                    </table> 
                                                </div>
                                                    <div id="victimaMapCanvas" class="mapCanvas"></div>
                                                
                                                
                                    </div>
                                    <div class="step-pane" id="step4">
                                        <br/>
                                        <h4>4.- Datos del Testigo(s)</h4>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Nombre </label>
                                            <input type="text" class="form-control" id="nombreTestigo" required  name="testigo.nombre" placeholder="Nombre completo del testigo"  data-toggle="tooltip" data-placement="top" title="Escribir Nombre Completo de la Victima" onkeypress="txNombres()">
                                        </div>                                                
                                        <div class="form-group" required>
                                            <label for="exampleInputEmail1">Genero </label>
                                            <select class="form-control" name="testigo.genero">
                                                <option>Masculino</option>
                                                <option>Femenino</option>
                                            </select>
                                        </div>                                                
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Edad</label>
                                            <input type="text" class="form-control" id="edadTestigo" required name="testigo.edad" placeholder="Edad del Testigo"  data-toggle="tooltip" data-placement="top" title="Escribir solo Número" onkeypress="ValidaSoloNumeros()" maxlength="2">
                                        </div>                                                
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Estado Civil</label>
                                            <input type="text" class="form-control" id="estCivilTestigo" required name="testigo.estadoCivil" placeholder="Estado civil del testigo"   data-toggle="tooltip" data-placement="top" title="Escribir Estado Civil" onkeypress="txNombres()">
                                        </div>                                                
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Escolaridad</label>
                                            <input type="text" class="form-control" id="escTestigo" required name="testigo.escolaridad" placeholder="Escolaridad del testigo"   data-toggle="tooltip" data-placement="top" title="Escribir Escolaridad" onkeypress="txNombres()">
                                        </div>                                              
                                        <div class="form-group">
                                                    <label for="exampleInputEmail1">Ubicación</label>
                                                    <input type="text" class="form-control" name="testigo.ubicacion" id="testigoDireccion" placeholder="Ubicación" required>                                              
                                                </div>
                                                <div>
                                                    <table>
                                                        <tr>
                                                            <td><p style="font-size: 10px;font-family: verdana;font-weight: bold;">
                                                                    <input id="btnBuscarDirTestigo" type="button" class="btn btn-success btn-buscarDireccion" value="Buscar" required/>
                                                                </p>
                                                            </td>
                                                            <td><p style="font-size: 10px;font-family: verdana;font-weight: bold;">
                                                                    <input type="text" name="testigo.latitud" id="testigoLatitud" hidden="true" style="width: 100px;font-size: 10px;font-family: verdana;font-weight: bold;" required/>	    
                                                                </p>
                                                            </td>
                                                            <td> <p style="font-size: 10px;font-family: verdana;font-weight: bold;">
                                                                    <input type="text" name="testigo.longitud" id="testigoLongitud" hidden="true" style="width: 100px;font-size: 10px;font-family: verdana;font-weight: bold;" required/>	
                                                                </p>
                                                            </td>	
                                                        </tr>
                                                    </table> 
                                                </div> 
                                                    <div id="testigoMapCanvas" class="mapCanvas"></div> 
                                                
                                                
                                    </div>
                                    
                                    <div class="step-pane" id="step5">
                                        <br/>
                                        <h4>5.- Datos del Imputado</h4>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Nombre </label>
                                            <input type="text" class="form-control" id="nombreImputado" required name="imputado.nombre" placeholder="Nombre completo del Imputado"   data-toggle="tooltip" data-placement="top" title="Escribir Nombre Completo del Responsable" onkeypress="txNombres()">
                                        </div>                                                
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Genero </label>
                                            <select class="form-control" name="imputado.genero">
                                                <option>Masculino</option>
                                                <option>Femenino</option>
                                            </select>
                                        </div>                                                
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Edad</label>
                                            <input type="text" class="form-control"  id="edadImputado" required name="imputado.edad" placeholder="Edad del Imputado"   data-toggle="tooltip" data-placement="top" title="Escribir Edad Responsable" onkeypress="ValidaSoloNumeros()" maxlength="2">
                                        </div>                                                
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Estado Civil</label>
                                            <input type="text" class="form-control" id="estCivilImputado" required name="imputado.estadoCivil" placeholder="Estado civil del Imputado"  data-toggle="tooltip" data-placement="top" title="Escribir Estado Civil" onkeypress="txNombres()">
                                        </div>                                                
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Escolaridad</label>
                                            <input type="text" class="form-control" id="escImputado" required name="imputado.escolaridad" placeholder="Escolaridad del Imputado"  data-toggle="tooltip" data-placement="top" title="Escribir Escolaridad" onkeypress="txNombres()">
                                        </div>                                          
                                        <div class="form-group">
                                                    <label for="exampleInputEmail1">Ubicación</label>
                                                    <input type="text" class="form-control" name="imputado.ubicacion" id="imputadoDireccion" placeholder="Ubicación" required>                                              
                                                </div>
                                                <div>
                                                    <table>
                                                        <tr>
                                                            <td><p style="font-size: 10px;font-family: verdana;font-weight: bold;">
                                                                    <input id="btnBuscarDirImputado" type="button" class="btn btn-success btn-buscarDireccion" value="Buscar" required/>
                                                                </p>
                                                            </td>
                                                            <td><p style="font-size: 10px;font-family: verdana;font-weight: bold;">
                                                                    <input type="text" name="imputado.latitud" id="imputadoLatitud" hidden="true" style="width: 100px;font-size: 10px;font-family: verdana;font-weight: bold;" required/>	    
                                                                </p>
                                                            </td>
                                                            <td> <p style="font-size: 10px;font-family: verdana;font-weight: bold;">
                                                                    <input type="text" name="imputado.longitud" id="imputadoLongitud" hidden="true" style="width: 100px;font-size: 10px;font-family: verdana;font-weight: bold;" required/>	
                                                                </p>
                                                            </td>	
                                                        </tr>
                                                    </table> 
                                                </div> 
                                                    <div id="imputadoMapCanvas" class="mapCanvas"></div>
                                                
                                                
                                    </div>
                                    <div class="step-pane" id="step6">
                                        <br/>
                                        <h4>6.- Documentos Relacionados</h4>
                                        <div class="form-group">
                                            <label for="expediente">Número de Denuncia/Querella</label>
                                            <input type="text" hidden="true" id="numeroExpediente" name="numeroExpediente">
                                            </br>
                                            <a href="#" id="numExpediente" name="numExpediente" data-type="text" data-title="Ingresar el numero de Denuncia/Querella" class="editable editable-click form-control">COA-FG-XX-PGU-2014-AA-</a>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleInputEmail1">IPH de la Denuncia/Querella</label>
                                            <input type="text" class="form-control" id="textoIph" size="40" placeholder="Seleccione un IPH  " required>
                                            </br>
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Buscar IPH</button>
                                        </div>
                                    </div>


                                    <div class="step-pane" id="step7">
                                        <br/>
                                        <div class="panel-group accordion" id="accordion">                                                        
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a class="accordion-toggle " data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                                                            Plantillas
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapseFour" class="panel-collapse collapse" style="height: 1px;">
                                                    <div class="panel-body">
                                                        <a href=${resource(dir: 'Plantillas', file: 'PlantillaDenuncia.docx')} title="Descargar">
                                                            <span class="fa fa-file-word-o" style="padding-right: 10px;"></span> Plantilla Denuncia
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <br/>
                                        </div>
                                    </div>

                                </div>
                            </g:form>
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
                    <h4 class="modal-title" id="myModalLabel">Número de IPH</h4>
                    <input class="form-control" type="search" id="SearchBox" />
                </div>
                <div class="modal-body">
                    <div class="scrollable" id="CustomerSelectDiv">
                        <select size="2" class="form-control" id="CustomerSelect">
                            <g:each in="${expedientesIph}" var="expediente" status="i">
                                <option value="${expediente.numeroIph}">${expediente.numeroIph}</option>
                            </g:each>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" onclick="document.getElementById('textoIph').value = CustomerSelect.value;" data-dismiss="modal">Seleccionar</button>
                </div>
            </div>
        </div>
    </div>

<!--Fin Modal-->
    <script src="${resource(dir: 'centaurus/js', file: 'demo-skin-changer.js')}"></script>
    <script src="${resource(dir: 'centaurus/js', file: 'jquery.js')}"></script>
    <script src="${resource(dir: 'centaurus/js', file: 'bootstrap.js')}"></script>
    <script src="${resource(dir: 'centaurus/js', file: 'jquery.nanoscroller.min.js')}"></script>
    <script src="${resource(dir: 'centaurus/js', file: 'demo.js')}"></script>  

    <script src="${resource(dir: 'centaurus/js', file: 'jquery-ui.custom.min.js')}"></script>
    <script src="${resource(dir: 'centaurus/js', file: 'fullcalendar.min.js')}"></script>
    <script src="${resource(dir: 'centaurus/js', file: 'jquery.slimscroll.min.js')}"></script>
    <script src="${resource(dir: 'centaurus/js', file: 'raphael-min.js')}"></script>
    <script src="${resource(dir: 'centaurus/js', file: 'morris.min.js')}"></script>
    <script src="${resource(dir: 'centaurus/js', file: 'moment.min.js')}"></script>
    <script src="${resource(dir: 'centaurus/js', file: 'daterangepicker.js')}"></script>
    <script src="${resource(dir: 'centaurus/js', file: 'jquery-jvectormap-1.2.2.min.js')}"></script>
    <script src="${resource(dir: 'centaurus/js', file: 'jquery-jvectormap-world-merc-en.js')}"></script>
    <script src="${resource(dir: 'centaurus/js', file: 'gdp-data.js')}"></script>
    <script src="${resource(dir: 'centaurus/js/flot', file: 'jquery.flot.js')}"></script>
    <script src="${resource(dir: 'centaurus/js/flot', file: 'jquery.flot.min.js')}"></script>
    <script src="${resource(dir: 'centaurus/js/flot', file: 'jquery.flot.pie.min.js')}"></script>
    <script src="${resource(dir: 'centaurus/js/flot', file: 'jquery.flot.stack.min.js')}"></script>
    <script src="${resource(dir: 'centaurus/js/flot', file: 'jquery.flot.resize.min.js')}"></script>
    <script src="${resource(dir: 'centaurus/js/flot', file: 'jquery.flot.time.min.js')}"></script>
    <script src="${resource(dir: 'centaurus/js/flot', file: 'jquery.flot.threshold.js')}"></script>
    <!--script src="${resource(dir: 'centaurus/js', file: 'scripts.js')}"></script>
    <script src="${resource(dir: 'centaurus/js', file: 'pace.min.js')}"></script-->

    <!--advanced tables-->
    <!--script src="${resource(dir: 'centaurus/js', file: 'demo-skin-changer.js')}"></script> 
    <script src="${resource(dir: 'centaurus/js', file: 'jquery.js')}"></script> 
    <script src="${resource(dir: 'centaurus/js', file: 'bootstrap.js')}"></script>
    <script src="${resource(dir: 'centaurus/js', file: 'jquery.nanoscroller.min.js')}"></script>
    <script src="${resource(dir: 'centaurus/js', file: 'demo.js')}"></script-->   
    <script src="${resource(dir: 'centaurus/js', file: 'jquery.dataTables.js')}"></script> 
    <script src="${resource(dir: 'centaurus/js', file: 'dataTables.fixedHeader.js')}"></script> 
    <script src="${resource(dir: 'centaurus/js', file: 'dataTables.tableTools.js')}"></script> 
    <script src="${resource(dir: 'centaurus/js', file: 'jquery.dataTables.bootstrap.js')}"></script> 
    <!--advanced tables-->

    <script src="${resource(dir: 'centaurus/js', file: 'wizard.js')}"></script> 
    <script src="${resource(dir: 'centaurus/js', file: 'jquery.maskedinput.min.js')}"></script> 


    <script src="${resource(dir: 'centaurus/js', file: 'bootstrap-editable.min.js')}"></script> 
    <script src="${resource(dir: 'centaurus/js', file: 'select2.min.js')}"></script> 

    <script src="${resource(dir: 'centaurus/js', file: 'moment.min.js')}"></script> 
    <script src="${resource(dir: 'centaurus/js', file: 'scripts.js')}"></script>
    <script src="${resource(dir: 'centaurus/js', file: 'dropzone.js')}"></script>



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


    </script>
    <script>            
        $("#btnPlantilla").click(function () {
        $('#numeroExpediente').val($('#numExpediente').text());
        });
    </script> 
    <script>
        $(document).ready(function(){
            //toggle `popup` / `inline` mode
            $.fn.editable.defaults.mode = 'popup';     

            //make numExpediente editable
            $("#numExpediente").editable();
            
            initComponentesUIBusqueda();
        });
        /*
        $(window).load(function(){
            initComponentesUIBusqueda();
        })*/
        
        /*
        $("#btnBuscarDirDenuncia").on( "click", function() {
        console.log('Inside handler click button');
    var mapProp = {
            center:new google.maps.LatLng(53.6721226, -10.547924),
            zoom:13,
            mapTypeId:google.maps.MapTypeId.ROADMAP
          };
    var map=new google.maps.Map(document.getElementById("denuncianteMapCanvas"),mapProp);
})*/
    </script>
</body>
</html>
