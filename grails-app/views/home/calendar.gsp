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
<div id="theme-wrapper">

<div id="page-wrapper" class="container">
<div class="row">
<div id="nav-col">
<section id="col-left" class="col-left-nano">
<div id="col-left-inner" class="col-left-nano-content">
</div>
</section>
</div>
<div id="content-wrapper">
<div class="row">
<div class="col-lg-12">
<div class="row">
<div class="col-lg-12">
<ol class="breadcrumb">
</ol>
<h1>Agenda de Audencias</h1>
<div class="col-lg-12" style="left: 1107px">  
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
<h2>Audiencias</h2>
</header>
<div class="main-box-body clearfix">
<div class="external-event label-primary" data-eventclass="label-primary">Audiencia Oral</div>
<div class="external-event label-info" data-eventclass="label-info">Audiencia de Ratificación</div>
<div class="external-event label-success" data-eventclass="label-success">Audiencia de Presentación</div>
<div class="form-group">
<label class="checkbox-inline">
</label>
</div>
</br>
<h4>Juez</h4>
<div>
  <select class="form-control" id="selectJuez">
    <option>Juez 1</option>
    <option>Juez 2</option>
    <option>Juez 3</option>
  </select>
</div>
</br>
<h4>Número de Caso</h4>
<div>
    <input type="text" id="numCaso" class="form-control"></br>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Buscar Caso</button>
</div>
</div>
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
</div>
</div>
 <!--Modal-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
       <div class="modal-dialog">
         <div class="modal-content">
           <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
             <h4 class="modal-title" id="myModalLabel">Número de Caso</h4>
             <input class="form-control" type="search" id="SearchBox" />
           </div>
           <div class="modal-body">
              <div class="scrollable" id="CustomerSelectDiv">
                  <select size="2" class="form-control" id="CustomerSelect">
                     <option>COA/FG/XX/PGU/2014/AA-1</option>
                     <option>COA/FG/XX/PGU/2014/AA-3</option>
                     <option>COA/FG/XX/PGU/2014/AA-5</option>
                     <option>COA/FG/XX/PGU/2014/AA-8</option>
                     <option>COA/FG/XX/PGU/2014/AA-14</option>
                 </select>
             </div>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
             <button type="button" id="btmModal" class="btn btn-primary" onclick="document.getElementById('numCaso').value = CustomerSelect.value;" data-dismiss="modal">Seleccionar</button>
           </div>
         </div>
       </div>
     </div>
<!--Fin Modal-->
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
            
            <script src="${request.contextPath}/centaurus/js/jquery.js"></script>
            <script src="${request.contextPath}/centaurus/js/bootstrap.js"></script>
            <script src="${request.contextPath}/centaurus/js/jquery.nanoscroller.min.js"></script>
            <script src="${request.contextPath}/centaurus/js/demo.js"></script>
            <script src="${request.contextPath}/centaurus/js/jquery-ui.custom.min.js"></script>
            <script src="${request.contextPath}/centaurus/js/fullcalendar.min.js"></script>
            <script src="${request.contextPath}/centaurus/js/scripts.js"></script>
            <script src="${request.contextPath}/centaurus/js/pace.min.js"></script>
            
<script>    
    
	$(document).ready(function() {
		/* initialize the external events
		-----------------------------------------------------------------*/
	
		$('#external-events div.external-event').each(function() {
		
			// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			var eventObject = {
				title: 'Tipo de Audiencia: ' + $.trim($(this).text()) +  '\nNombre del Juez: ' + $.trim($(selectJuez).val()) + '\nNúmero de Caso: '  // use the element's text as the event title
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
			selectable: false,
			selectHelper: true,
			select: function(start, end, allDay) {
				var title = prompt('Tipo de Audiencia:');
                                
				if (title) {
                                    title = 'Tipo de Audiencia: ' + title + '\nNombre del Juez: ' + document.getElementById('selectJuez').value + '\nNúmero de Caso: ' + document.getElementById('numCaso').value;
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
				{
					title: 'Audiencia 3',
					start: new Date(y, m, 1),
					className: 'label-success'
				},
				{
					title: 'Audiencia Oral',
					start: new Date(y, m, d-5),
					end: new Date(y, m, d-2)
				},
				{
					id: 999,
					title: 'Audiencia Oral',
					start: new Date(y, m, d-3, 16, 0),
					allDay: false,
					className: 'label-danger'
				},
				{
					id: 999,
					title: 'Audiencia Oral',
					start: new Date(y, m, d+4, 16, 0),
					allDay: false
				},
				{
					title: 'Audiencia 2',
					start: new Date(y, m, d, 10, 30),
					allDay: false,
					className: 'label-info'
				},
				{
					title: 'Audiencia 3',
					start: new Date(y, m, d, 12, 0),
					end: new Date(y, m, d, 14, 0),
					allDay: false,
					className: 'label-success'
				},
				{
					title: 'Audiencia 2',
					start: new Date(y, m, d+1, 19, 0),
					end: new Date(y, m, d+1, 22, 30),
					allDay: false,
					className: 'label-info'
				}
			]
		});
	});
	</script>
        
<script>  
    $(selectJuez).change(function() {
        $('#external-events div.external-event').each(function() {
		
            // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
            // it doesn't need to have a start or end
            var eventObject = {
                    title: 'Tipo de Audiencia: ' + $.trim($(this).text()) +  '\nNombre del Juez: ' + $.trim($(selectJuez).val()) + '\nNúmero de Caso: ' + $.trim($(numCaso).val())  // use the element's text as the event title
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
                    title: 'Tipo de Audiencia: ' + $.trim($(this).text()) +  '\nNombre del Juez: ' + $.trim($(selectJuez).val()) + '\nNúmero de Caso: ' + $.trim($(numCaso).val())  // use the element's text as the event title
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
                    title: 'Tipo de Audiencia: ' + $.trim($(this).text()) +  '\nNombre del Juez: ' + $.trim($(selectJuez).val()) + '\nNúmero de Caso: ' + $.trim($(numCaso).val())  // use the element's text as the event title
            };

            // store the Event Object in the DOM element so we can get to it later
            $(this).data('eventObject', eventObject);
        });
    });
</script>        

</body>
</html>