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
        <title>Agenda de Audiencias</title>

        <script type="text/javascript">
            //<![CDATA[
            try{if (!window.CloudFlare) {var CloudFlare=[{verbose:0,p:1422370982,byc:0,owlid:"cf",bag2:1,mirage2:0,oracle:0,paths:{cloudflare:"/cdn-cgi/nexp/dok3v=1613a3a185/"},atok:"644815e7f35929d560576408cdb41087",petok:"fa3566be061578204952751ff8c13cf9513fba22-1422562621-1800",zone:"adbee.technology",rocket:"0",apps:{"ga_key":{"ua":"UA-49262924-2","ga_bs":"2"}}}];!function(a,b){a=document.createElement("script"),b=document.getElementsByTagName("script")[0],a.async=!0,a.src="//ajax.cloudflare.com/cdn-cgi/nexp/dok3v=919620257c/cloudflare.min.js",b.parentNode.insertBefore(a,b)}()}}catch(e){};
//]]>
        </script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.min.css"/>

        <script src="js/demo-rtl.js"></script>

        <link rel="stylesheet" href="${request.contextPath}/centaurus/css/libs/font-awesome.css"/>
        <link rel="stylesheet" href="${request.contextPath}/centaurus/css/libs/nanoscroller.css"/>

        <link rel="stylesheet" href="${request.contextPath}/centaurus/css/compiled/theme_styles.css"/>

        <link rel="stylesheet" href="${request.contextPath}/centaurus/css/libs/fullcalendar.css" type="text/css"/>
        <link rel="stylesheet" href="${request.contextPath}/centaurus/css/libs/fullcalendar.print.css" type="text/css" media="print"/>
        <link rel="stylesheet" href="${request.contextPath}/centaurus/css/compiled/calendar.css" type="text/css" media="screen"/>

        <link type="image/x-icon" href="favicon.png" rel="shortcut icon"/>

        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,600,700,300|Titillium+Web:200,300,400' rel='stylesheet' type='text/css'>
        <!--[if lt IE 9]>
                        <script src="js/html5shiv.js"></script>
                        <script src="js/respond.min.js"></script>
                <![endif]-->
        <script type="text/javascript">
            /* <![CDATA[ */
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-49262924-2']);
            _gaq.push(['_trackPageview']);

            (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();

            (function(b){(function(a){"__CF"in b&&"DJS"in b.__CF?b.__CF.DJS.push(a):"addEventListener"in b?b.addEventListener("load",a,!1):b.attachEvent("onload",a)})(function(){"FB"in b&&"Event"in FB&&"subscribe"in FB.Event&&(FB.Event.subscribe("edge.create",function(a){_gaq.push(["_trackSocial","facebook","like",a])}),FB.Event.subscribe("edge.remove",function(a){_gaq.push(["_trackSocial","facebook","unlike",a])}),FB.Event.subscribe("message.send",function(a){_gaq.push(["_trackSocial","facebook","send",a])}));"twttr"in b&&"events"in twttr&&"bind"in twttr.events&&twttr.events.bind("tweet",function(a){if(a){var b;if(a.target&&a.target.nodeName=="IFRAME")a:{if(a=a.target.src){a=a.split("#")[0].match(/[^?=&]+=([^&]*)?/g);b=0;for(var c;c=a[b];++b)if(c.indexOf("url")===0){b=unescape(c.split("=")[1]);break a}}b=void 0}_gaq.push(["_trackSocial","twitter","tweet",b])}})})})(window);
/* ]]> */
        </script>
    </head>
    <body>
        <div class="row" style="opacity: 1;">
            <div class="col-lg-12">
                <div id="email-detail" class="email-detail-nano has-scrollbar" style="min-height: 900px;">
                    <div class="email-detail-nano-content" tabindex="0" style="right: -16px;">
                        <div class="row">
                            <div class="col-lg-12">
                                </br>
                                <h1>Agenda de Audiencias</h1>
                                <div id="email-header-tools" class="pull-right">                                   
                                    <a href="${request.contextPath}" class="btn btn-primary">                                            
                                        <span class="fa fa-chevron-left" style="padding-right: 10px;"></span> Regresar
                                    </a>
                                </div>
                            </div>
                        </div>   
                        </br>
                        <div class="row">
                            <div class="col-md-3 hidden-xs hidden-sm" >
                                <div class="main-box" id="external-events">
                                    <header class="main-box-header clearfix">
                                      <g:form name="formGuardar" controller="home" action="guardarAudiencia">
                                        <h4>Número de causa</h4>
                                        <div>
                                            <input type="text" id="numCaso" name="numCaso" class="form-control"></br>
                                            <input type="hidden" id="tipoAudiencia" name="tipoAudiencia" class="form-control">
                                            <input type="hidden" id="solicitudId" name="solicitudId" class="form-control">
                                            <input type="hidden" id="inicio" name="inicio" class="form-control">
                                            <input type="hidden" id="fin" name="fin" class="form-control">
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Buscar</button>
                                        </div>
                                        </br>
                                        <h4>Juez</h4>
                                        <div>
                                            <select class="form-control" name="selectJuez" id="selectJuez">
                                                <g:each in="${jueces}" var="juez" status="i">
                                                    <option value="${juez.nombre}">${juez.nombre}</option>
                                                </g:each>
                                            </select>
                                        </div>
                                        </br>
                                        <h4>Audiencias</h4>
                                        <div class="main-box-body clearfix">
                                            <div class="form-group">
                                                <div class="external-event label-primary" data-eventclass="label-primary">Agendar Audiencia</div>
                                            </div>
                                            </br>
                                        </div>
                                      </g:form>
                                    </header>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <div class="main-box">
                                    <div class="main-box-body clearfix">
                                        <div id="calendar"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <!--Modal-->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="alignment-adjust:auto">
            <div class="modal-dialog">
                <div class="modal-content" style="width:820px">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Número de Causas</h4>
                        <input class="form-control" type="search" id="SearchBox" />
                    </div>
                    <div class="modal-body">
                        <div class="scrollable" id="CustomerSelectDiv">
                            <select size="2" class="form-control" id="selectSolicitud">
                                
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="button" id="btmModal" class="btn btn-primary" onclick="myFunction()" data-dismiss="modal">Seleccionar</button>
                    </div>
                </div>
            </div>
        </div>
   <!--Fin Modal-->
        <script type="text/javascript">
            function myFunction() {
            var str = document.getElementById('selectSolicitud').value;
            var res = str.split(",");
            document.getElementById('numCaso').value = res[0];
            document.getElementById('tipoAudiencia').value = res[1];
            document.getElementById('solicitudId').value = res[2];
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
            showOnlyOptionsSimilarToText($("#selectSolicitud"), userInput);
            });
        </script>       

        <script src="${request.contextPath}/centaurus/js/jquery.js"></script>
        <!--<script src="${request.contextPath}/centaurus/js/bootstrap.js"></script>-->
        <script src="${request.contextPath}/centaurus/js/jquery.nanoscroller.min.js"></script>
        <script src="${request.contextPath}/centaurus/js/demo.js"></script>
        <script src="${request.contextPath}/centaurus/js/jquery-ui.custom.min.js"></script>
        <script src="${request.contextPath}/centaurus/js/fullcalendar.min.js"></script>
        <script src="${request.contextPath}/centaurus/js/scripts.js"></script>
        <script src="${request.contextPath}/centaurus/js/pace.min.js"></script>

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
            /* initialize the external events
            -----------------------------------------------------------------*/

            $('#external-events div.external-event').each(function() {

            // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
            // it doesn't need to have a start or end
            var eventObject = {
            title: 'Audiencia: ' + $.trim($(tipoAudiencia).val()) +  '\nJuez: ' + $.trim($(selectJuez).val()) + '\nCausa: '  // use the element's text as the event title
            };

            // store the Event Object in the DOM element so we can get to it later
            $(this).data('eventObject', eventObject);
            
            // make the event draggable using jQuery UI
            $(this).draggable({
            zIndex: 999,
            revert: true,      // will cause the event to go back to its
            revertDuration: 0  //  original position after the drag
            });

            });


            /* initialize the calendar
            -----------------------------------------------------------------*/

            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();

            var calendar = $('#calendar').fullCalendar({
            header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
            },
            isRTL: $('body').hasClass('rtl'), //rtl support for calendar
            defaultView: 'agendaWeek',
            selectable: false,
            selectHelper: true,
            select: function(start, end, allDay) {
            var title = prompt('Tipo de Audiencia:');
            
            if (title) {
            title = 'Audiencia: ' + document.getElementById('tipoAudiencia').value + '\nJuez: ' + document.getElementById('selectJuez').value + '\nCausa: ' + document.getElementById('numCaso').value;
            calendar.fullCalendar('renderEvent',
            {
            title: title,
            start: start,
            end: end,
            allDay: allDay
            },
            true // make the event "stick"
            );
            }
            calendar.fullCalendar('unselect');
            },
            editable: true,
            droppable: true, // this allows things to be dropped onto the calendar !!!
            drop: function(date, allDay) { // this function is called when something is dropped
            
            // retrieve the dropped element's stored Event Object
            var originalEventObject = $(this).data('eventObject');
            
            // we need to copy it, so that multiple events don't have a reference to the same object
            var copiedEventObject = $.extend({}, originalEventObject);

            // assign it the date that was reported
            copiedEventObject.start = date;
            copiedEventObject.allDay = allDay;
            
            //Se graba la informacion en la bd
            document.getElementById('inicio').value = date.toLocaleString();
            //document.getElementById('fin').value = (date.addHours(2)).toLocaleString();
            //$('#formGuardar').submit();
            guardarAudiencias();
            
            // copy label class from the event object
            var labelClass = $(this).data('eventclass');

            if (labelClass) {
            copiedEventObject.className = labelClass;
            }

            // render the event on the calendar
            // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
            $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

            // is the "remove after drop" checkbox checked?
            if ($('#drop-remove').is(':checked')) {
            // if so, remove the element from the "Draggable Events" list
            $(this).remove();
            }

            },
            buttonText: {
				prev: '<i class="fa fa-chevron-left"></i>',
				next: '<i class="fa fa-chevron-right"></i>'
            },
            events: [
            <g:each in="${agendasAudiencias}" var="audiencia" status="i">
             {   
                id: '${audiencia.id}',
                title: 'Audiencia: ${audiencia.solicitudAudiencia.tipoAudiencia}\nJuez: ${audiencia.juez}\nCausa: ${audiencia.solicitudAudiencia.expediente.numeroExpediente}',
                start: '<g:formatDate format="yyyy-MM-dd" date="${audiencia.inicio}"/>T<g:formatDate format="HH:mm:ss" date="${audiencia.inicio}"/>',
                end: '<g:formatDate format="yyyy-MM-dd" date="${audiencia.fin}"/>T<g:formatDate format="HH:mm:ss" date="${audiencia.fin}"/>',
                allDay: false,
                className: 'label-primary'
            },                                          
            </g:each>
            {
            }
            ],
            editable: true,
            eventDrop: function(event, delta, revertFunc) {
                var id = event.id.toLocaleString();
                var inicio = event.start.toLocaleString();
                var fin = event.end.toLocaleString();
                
                updateAudiencia(id,inicio,fin);
            }
            });
            });
        </script>

        <script>  
            $(selectJuez).change(function() {
            $('#external-events div.external-event').each(function() {

            // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
            // it doesn't need to have a start or end
            var eventObject = {
            title: 'Audiencia: ' + $.trim($(tipoAudiencia).val()) +  '\nJuez: ' + $.trim($(selectJuez).val()) + '\nCausa: ' + $.trim($(numCaso).val())  // use the element's text as the event title
            };

            // store the Event Object in the DOM element so we can get to it later
            $(this).data('eventObject', eventObject);
            });
            });

            $(numCaso).change(function() {
            $('#external-events div.external-event').each(function() {

            // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
            // it doesn't need to have a start or end
            var eventObject = {
            title: 'Audiencia: ' + $.trim($(tipoAudiencia).val()) +  '\nJuez: ' + $.trim($(selectJuez).val()) + '\nCausa: ' + $.trim($(numCaso).val())  // use the element's text as the event title
            };

            // store the Event Object in the DOM element so we can get to it later
            $(this).data('eventObject', eventObject);
            });
            });

            $(btmModal).click(function() {
            $('#external-events div.external-event').each(function() {

            // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
            // it doesn't need to have a start or end
            var eventObject = {
            title: 'Audiencia: ' + $.trim($(tipoAudiencia).val()) +  '\nJuez: ' + $.trim($(selectJuez).val()) + '\nCausa: ' + $.trim($(numCaso).val())  // use the element's text as the event title
            };

            // store the Event Object in the DOM element so we can get to it later
            $(this).data('eventObject', eventObject);
            });
            });
        </script> 
        <script>
            function guardarAudiencias(){
                var vsolId = document.getElementById('solicitudId').value;
                var vinicio = document.getElementById('inicio').value;
                var vjuez = document.getElementById('selectJuez').value;
                
                var guardarAPI = "${request.contextPath}/home/guardarAudiencia?solicitudId="+vsolId+"&inicio="+vinicio+"&selectJuez="+vjuez;
                $.getJSON( guardarAPI, {
                  format: "json"
                })
                  .done(function( data ) {
                   alert(data);
                  });
                  
                consultaSolicitudesAudiencias();
            }
            function updateAudiencia(id,inicio,fin){                                
                var updateAPI = "${request.contextPath}/home/updateAudiencia?id="+id+"&inicio="+inicio+"&fin="+fin;
                $.getJSON( updateAPI, {
                  format: "json"
                })
                  .done(function( data ) {
                   alert(data);
                  });
            }
            function consultaSolicitudesAudiencias(){
                var solicitudesAPI = "${request.contextPath}/home/consultaCalendar";
                $.getJSON( solicitudesAPI, {
                  format: "json"
                })
                  .done(function( data ) {
                   
                    var $select = $('#selectSolicitud');                        
                    $select.find('option').remove();    
                    var cont = 0;
                    $.each(data, function(key, value) {              
                        $select.append('<option value="' + data[cont].numeroExpediente+','+data[cont].tipoAudiencia+','+data[cont].id + '">' + data[cont].numeroExpediente+', Victima: '+data[cont].victima+', Imputado: '+data[cont].imputado+', Delito: '+data[cont].delito+ '</option>');     
                        cont++;
                    });
                    
                    document.getElementById('solicitudId').value = "";
                    document.getElementById('inicio').value = "";
                    document.getElementById('fin').value = "";
                    document.getElementById('numCaso').value = "";
                    document.getElementById('tipoAudiencia').value = "";
                    
                  });
            }
            $(document).ready(function(){
                consultaSolicitudesAudiencias();
            });
        </script>
        <script>
            Date.prototype.addHours= function(h){
                this.setHours(this.getHours()+h);
                return this;
            }
        </script>
    </body>
</html>