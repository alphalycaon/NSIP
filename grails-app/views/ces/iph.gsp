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
        <!--Codigo head-->
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/bootstrap/', file: 'bootstrap.min.css')}"/>
        <script src="${resource(dir: 'centaurus/js', file: 'demo-rtl.js')}/"></script>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs/', file: 'font-awesome.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs/', file: 'nanoscroller.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/compiled', file: 'theme_styles.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs/', file: 'datepicker.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs/', file: 'bootstrap-timepicker.css')}"/>
        <!--Fin Codigo head-->
        <script src="${resource(dir: 'js', file: 'datetimepicker_css.js')}"></script>        
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false">
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=places"></script>
        <script type="text/javascript">

        // VARIABLES GLOBALES JAVASCRIPT
        var geocoder;
        var marker;
        var latLng;
        var latLng2;
        var map;

        // INICiALIZACION DE MAPA
        function initialize() {
          geocoder = new google.maps.Geocoder();	
          latLng = new google.maps.LatLng(23.782967498640414 ,-102.28738495624998);
          map = new google.maps.Map(document.getElementById('mapCanvas'), {
            zoom:5,
            center: latLng,
            mapTypeId: google.maps.MapTypeId.ROADMAP  });

        //Nuevo codigo
	var input = /** @type {HTMLInputElement} */(
      document.getElementById('direccion'));
	
	var searchBox = new google.maps.places.SearchBox(
    /** @type {HTMLInputElement} */(input));
	
	// [START region_getplaces]
	// Listen for the event fired when the user selects an item from the
	// pick list. Retrieve the matching places for that item.
	google.maps.event.addListener(searchBox, 'places_changed', function() {
		var places = searchBox.getPlaces();

		if (places.length == 0) {
		  return;
		}
		for (var i = 0, marker; marker = markers[i]; i++) {
		  marker.setMap(null);
		}

		// For each place, get the icon, place name, and location.
		markers = [];
		var bounds = new google.maps.LatLngBounds();
		for (var i = 0, place; place = places[i]; i++) {
		  var image = {
			url: place.icon,
			size: new google.maps.Size(71, 71),
			origin: new google.maps.Point(0, 0),
			anchor: new google.maps.Point(17, 34),
			scaledSize: new google.maps.Size(25, 25)
		  };
			  // Create a marker for each place.
		  var marker = new google.maps.Marker({
			map: map,
			icon: image,
			title: place.name,
			position: place.geometry.location
		  });
			  markers.push(marker);
			  bounds.extend(place.geometry.location);
		}
			map.fitBounds(bounds);
	});
	//Fin nuevo codigo
            
        // CREACION DEL MARCADOR  
            marker = new google.maps.Marker({
            position: latLng,
            title: 'Arrastra el marcador si quieres moverlo',
            map: map,
            draggable: true
          });




        // Escucho el CLICK sobre el mama y si se produce actualizo la posicion del marcador 
             google.maps.event.addListener(map, 'click', function(event) {
             updateMarker(event.latLng);
           });

          // Inicializo los datos del marcador
          //    updateMarkerPosition(latLng);

              geocodePosition(latLng);

          // Permito los eventos drag/drop sobre el marcador
          google.maps.event.addListener(marker, 'dragstart', function() {
            updateMarkerAddress('Arrastrando...');
          });

          google.maps.event.addListener(marker, 'drag', function() {
            updateMarkerStatus('Arrastrando...');
            updateMarkerPosition(marker.getPosition());
          });

          google.maps.event.addListener(marker, 'dragend', function() {
            updateMarkerStatus('Arrastre finalizado');
            geocodePosition(marker.getPosition());
          });



        }


        // Permito la gesti¢n de los eventos DOM
        google.maps.event.addDomListener(window, 'load', initialize);

        // ESTA FUNCION OBTIENE LA DIRECCION A PARTIR DE LAS COORDENADAS POS
        function geocodePosition(pos) {
          geocoder.geocode({
            latLng: pos
          }, function(responses) {
            if (responses && responses.length > 0) {
              updateMarkerAddress(responses[0].formatted_address);
            } else {
              updateMarkerAddress('No puedo encontrar esta direccion.');
            }
          });
        }

        // OBTIENE LA DIRECCION A PARTIR DEL LAT y LON DEL FORMULARIO
        function codeLatLon() { 
              str= document.getElementById('longitud').value+" , "+document.getElementById('latitud').value;
              latLng2 = new google.maps.LatLng(document.getElementById('latitud').value ,document.getElementById('longitud').value);
              marker.setPosition(latLng2);
              map.setCenter(latLng2);
              geocodePosition (latLng2);
              // document.getElementById('direccion').value = str+" OK";
        }

        // OBTIENE LAS COORDENADAS DESDE lA DIRECCION EN LA CAJA DEL FORMULARIO
        function codeAddress() {
                var address = document.getElementById('direccion').value;
                  geocoder.geocode( { 'address': address}, function(results, status) {
                  if (status == google.maps.GeocoderStatus.OK) {
                     updateMarkerPosition(results[0].geometry.location);
                     marker.setPosition(results[0].geometry.location);
                     map.setCenter(results[0].geometry.location);
                     map.setZoom(16);
                   } else {
                    alert('ERROR : ' + status);
                  }
                });
              }

        // OBTIENE LAS COORDENADAS DESDE lA DIRECCION EN LA CAJA DEL FORMULARIO
        function codeAddress2 (address) {

                  geocoder.geocode( { 'address': address}, function(results, status) {
                  if (status == google.maps.GeocoderStatus.OK) {
                     updateMarkerPosition(results[0].geometry.location);
                     marker.setPosition(results[0].geometry.location);
                     map.setCenter(results[0].geometry.location);
                     document.getElementById('direccion').value = address;
                   } else {
                    alert('ERROR : ' + status);
                  }
                });
              }

        function updateMarkerStatus(str) {
          document.getElementById('direccion').value = str;
        }

        // RECUPERO LOS DATOS LON LAT Y DIRECCION Y LOS PONGO EN EL FORMULARIO
        function updateMarkerPosition (latLng) {
          document.getElementById('longitud').value =latLng.lng();
          document.getElementById('latitud').value = latLng.lat();
        }

        function updateMarkerAddress(str) {
          document.getElementById('direccion').value = str;
        }

        // ACTUALIZO LA POSICION DEL MARCADOR
        function updateMarker(location) {
                marker.setPosition(location);
                updateMarkerPosition(location);
                geocodePosition(location);
              }
        </script>
        
        <title>Generar Iph</title>
    </head>
    <body>
    <style>
    #mapCanvas {
      width: 1280px;
      height: 640px;
      float: center;
    }
    </style>
        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12">
                        <ol class="breadcrumb">
                            <li><a href="${request.contextPath}">Home</a></li>
                            <li class="active"><span>Iph</span></li>
                        </ol>
                        <h1>Generar Iph</h1>
                    </div>
                    <div class="col-lg-12">
                        <a href="${request.contextPath}" class="btn btn-danger" onclick="if(!confirm('Está seguro que desea cancelar el registro?'))return false;" >                                            
                            <span class="fa fa-times" style="padding-right: 10px;"></span> Cancelar
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="main-box clearfix" style="min-height: 820px;">
                            <header class="main-box-header clearfix">
                                <h2>Captura los datos en el orden presentado</h2>
                            </header>
                            <div class="main-box-body clearfix">

                                <div id="myWizard" class="wizard">
                                    <div class="wizard-inner">
                                        <ul class="steps">
                                            <li data-target="#step1" class="active"><span class="badge badge-primary">1</span>Datos Generales<span class="chevron"></span></li>
                                            <li data-target="#step2"><span class="badge">2</span>Victima<span class="chevron"></span></li>
                                            <li data-target="#step3"><span class="badge">3</span>Probable Responsable<span class="chevron"></span></li>
                                            <li data-target="#step4"><span class="badge">4</span>Archivos<span class="chevron"></span></li>
                                        </ul>
                                        <div class="actions">
                                            <button type="button" class="btn btn-default btn-mini btn-prev"></i>Anterior</button>
                                            <button type="button" class="btn btn-success btn-mini btn-next" data-last="Terminar" onclick="if($(this).html().indexOf('Terminar')==0){$('#iph').submit();}">Siguiente</i></button>
                                        </div>
                                    </div>
                                    <g:form controller="ces" action="guardarIph" name="iph">
                                        <div class="step-content">
                                            <div class="step-pane active" id="step1">
                                                <br/>
                                                <h4>1.- Datos Generales</h4> 
                                                <div class="form-group">
                                                    <label for="iph">Fecha y hora del Evento</label>
                                                    <div class="col-lg-12">
                                                        <div class="col-lg-6">
                                                            <div class="row">
                                                                <div class="form-group col-md-12">
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                                        <input type="text" class="form-control" name="datosIph.fechaEvento" placeholder="Fecha del evento" id="datepickerDate">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="row">
                                                                <div class="form-group col-md-12">
                                                                    <div class="input-group input-append bootstrap-timepicker">
                                                                        <input type="text" class="form-control" name="datosIph.horaEvento" id="timepicker">
                                                                        <span class="add-on input-group-addon"><i class="fa fa-clock-o"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Asunto</label>
                                                    <input type="text" class="form-control" name="datosIph.asunto" placeholder="Asunto">
                                                </div>     
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Participación</label>
                                                    <select class="form-control" name="datosIph.participacion">
                                                      <option>Ejecucion</option>
                                                      <option>Apoyo</option>
                                                      <option>Conocimiento</option>
                                                    </select>
                                                </div>     
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Operativo</label>
                                                    <select class="form-control" name="datosIph.operativo">
                                                      <option>Si</option>
                                                      <option>No</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Ubicación</label>
                                                    <input type="text" class="form-control" name="datosIph.ubicacion" id="direccion" placeholder="Ubicación">                                              
                                                </div>
                                                <div>
                                                     <table>
                                                      <tr>
                                                      <td><p style="font-size: 10px;font-family: verdana;font-weight: bold;">
                                                         <input type="button" class="btn btn-success" value="Buscar" onclick="codeAddress()"/>
                                                      </p>
                                                      </td>
                                                      <td><p style="font-size: 10px;font-family: verdana;font-weight: bold;">
                                                         <input type="text" name="latitud" id="latitud" hidden="true" value="23.782967498640414" style="width: 100px;font-size: 10px;font-family: verdana;font-weight: bold;" />	    
                                                      </p>
                                                      </td>
                                                      <td> <p style="font-size: 10px;font-family: verdana;font-weight: bold;">
                                                         <input type="text" name="longitud" id="longitud" hidden="true" value="-102.28738495624998" style="width: 100px;font-size: 10px;font-family: verdana;font-weight: bold;" />	
                                                      </p>
                                                      </td>	
                                                      </tr>
                                                   </table> 
                                                 </center>       
                                              </div> 
                                                <div id="mapCanvas"></div>
                                            </div>
                                            <div class="step-pane" id="step2">
                                                <br/>
                                                <h4>2.- Datos de la victima</h4>
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Apellido Paterno</label>
                                                    <input type="text" class="form-control" name="victimaIph.apellidoPaterno" placeholder="Apellido paterno de la victima">
                                                </div>                       
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Apellido Materno</label>
                                                    <input type="text" class="form-control" name="victimaIph.apellidoMaterno" placeholder="Apellido materno de la victima">
                                                </div>                       
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Nombre(s)</label>
                                                    <input type="text" class="form-control" name="victimaIph.nombre" placeholder="Nombres de la victima">
                                                </div>                  
                                                <div class="form-group">      
                                                    <label for="exampleInputEmail1">Edad</label>
                                                    <input type="text" class="form-control" name="victimaIph.edad" placeholder="Edad de la victima">
                                                </div>                                                
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Sexo</label>
                                                    <select class="form-control" name="victimaIph.sexo">
                                                      <option>Femenino</option>
                                                      <option>Masculino</option>
                                                    </select>
                                                </div>                                                              

                                            </div>
                                            <div class="step-pane" id="step3">
                                                <br/>
                                                <h4>3.- Datos del probable responsable</h4>
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Apellido Paterno</label>
                                                    <input type="text" class="form-control" name="imputadoIph.apellidoPaterno" placeholder="Apellido paterno del probable responsable">
                                                </div>                       
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Apellido Materno</label>
                                                    <input type="text" class="form-control" name="imputadoIph.apellidoMaterno" placeholder="Apellido materno del probable responsable">
                                                </div>                       
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Nombre(s)</label>
                                                    <input type="text" class="form-control" name="imputadoIph.nombre" placeholder="Nombres del probable responsable">
                                                </div>                                                
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Edad</label>
                                                    <input type="text" class="form-control" name="imputadoIph.edad" placeholder="Edad del probable responsable">
                                                </div>                                                
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Sexo </label>
                                                    <select class="form-control" name="imputadoIph.sexo">
                                                      <option>Femenino</option>
                                                      <option>Masculino</option>
                                                    </select>
                                                </div>                                                
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Probables delitos o faltas administrativas</label>
                                                    <input type="text" class="form-control" name="imputadoIph.delito" placeholder="Probable delito/falta administrativa">
                                                </div>                                                   
                                            </div>
                                        </g:form>

                                        <div class="step-pane" id="step4">
                                            <br/>
                                            <div class="panel-group accordion" id="accordion">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                                Evidencia
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="collapseOne" class="panel-collapse collapse in">
                                                        <div class="panel-body">
                                                            <g:uploadForm action="subirArchivo" name="fileUpload" class="dropzone" name="subirArchivo" id ="evidencia">
                                                                <div class="fallback">
                                                                    <input type="file" name="file" multiple="" />
                                                                </div>
                                                            </g:uploadForm>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                                Documento IPH
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="collapseTwo" class="panel-collapse collapse" style="height: 1px;">
                                                        <div class="panel-body">
                                                            <g:uploadForm action="subirArchivo" name="fileUpload" class="dropzone" name="subirArchivo" id ="documentoIph">
                                                                <div class="fallback">
                                                                    <input type="file" name="file" multiple="" />
                                                                </div>
                                                            </g:uploadForm>  
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                                                Plantillas
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="collapseThree" class="panel-collapse collapse" style="height: 1px;">
                                                        <div class="panel-body">
                                                            <a href=${resource(dir: 'Plantillas', file: 'PlantillaIph.docx')} title="Descargar">
                                                                <span class="fa fa-file-word-o" style="padding-right: 10px;"></span> Plantilla IPH
                                                            </a>
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
        
        <script src="${resource(dir: 'centaurus/js/', file: 'bootstrap.js')}"></script>
        <script src="${resource(dir: 'centaurus/js/', file: 'jquery.maskedinput.min.js')}"></script>
        <script src="${resource(dir: 'centaurus/js/', file: 'bootstrap-datepicker.js')}"></script>
        <script src="${resource(dir: 'centaurus/js/', file: 'bootstrap-timepicker.min.js')}"></script>

        <script>
            $(function($) {	
                    //masked inputs
                    $("#maskedDate").mask("99/99/9999");

                    $.fn.datepicker.dates['es'] = {
			days: ["Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo"],
			daysShort: ["Dom", "Lun", "Mar", "Mie", "Jue", "Vie", "Sab", "Dom"],
			daysMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa", "Do"],
			months: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Novienbre", "Diciembre"],
			monthsShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
			today: "Hoy",
			clear: "Limpiar"
                    };

                    //datepicker
                    $('#datepickerDate').datepicker({
                        format: 'dd/mm/yyyy',
                        language: 'es',
                        clearBtn: true
                    });

                    $('#datepickerDateComponent').datepicker();

                    //timepicker
                    $('#timepicker').timepicker({
                            minuteStep: 1,
                            showMeridian: true,
                            disableFocus: false,
                            showWidget: true
                    }).focus(function() {
                            $(this).next().trigger('click');
                    });		
            });
	</script>
    </body>
</html>
