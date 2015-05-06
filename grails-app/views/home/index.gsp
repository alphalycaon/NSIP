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


        <script type="text/javascript">
            //<![CDATA[
            try {
            if (!window.CloudFlare) {
            var CloudFlare = [{verbose: 0, p: 1429548188, byc: 0, owlid: "cf", bag2: 1, mirage2: 0, oracle: 0, paths: {cloudflare: "/cdn-cgi/nexp/dok3v=1613a3a185/"}, atok: "66e4b5af2913d9dd1d1a52df6e3066a3", petok: "c30d988939c9d77a8e3d6075c76e214c7e705ab7-1430353429-1800", zone: "adbee.technology", rocket: "0", apps: {"ga_key": {"ua": "UA-49262924-2", "ga_bs": "2"}}}];
            !function (a, b) {
            a = document.createElement("script"), b = document.getElementsByTagName("script")[0], a.async = !0, a.src = "//ajax.cloudflare.com/cdn-cgi/nexp/dok3v=7e13c32551/cloudflare.min.js", b.parentNode.insertBefore(a, b)
            }()
            }
            } catch (e) {
            }
            ;
            //]]>
        </script>



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




        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,600,700,300|Titillium+Web:200,300,400' rel='stylesheet' type='text/css'>
        <!--[if lt IE 9]>
                        <script src="${resource(dir: 'centaurus/js', file: 'html5shiv.js')}" ></script>
                        <script src="${resource(dir: 'centaurus/js', file: 'respond.min.js')}"></script>
                <![endif]-->

    </head>
    <body>
        <div class="row">
            <div class="col-lg-12">
                <header class="main-box-header clearfix">
                    <ol class="breadcrumb">
                        <li><a href="#">Inicio</a></li>
                        <li class="active"><span>Tablero de Control</span></li>
                    </ol>
                    <h1>Tablero de Control</h1>

                </header>

            </div>

        </div>

        <div class="row">
            <div class="col-lg-3 col-sm-6 col-xs-12">
                <div class="main-box infographic-box">
                    <i class="fa fa-slack red-bg"></i>
                    <span class="headline">Denuncias / Querellas</span>
                    <span class="value">${expedientes?.size()}</span>
                </div>
            </div>


            <div class="col-lg-3 col-sm-6 col-xs-12">
                <div class="main-box infographic-box">
                    <i class="fa fa-arrow-circle-o-left emerald-bg"></i>
                    <span class="headline">Corroboraci&oacute;n</span>
                    <span class="value">${iCorroboraciones} </span>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 col-xs-12">
                <div class="main-box infographic-box">
                    <i class="fa fa-circle-o green-bg"></i>
                    <span class="headline">Investigaci&oacute;n</span>
                    <span class="value">${iInvestigaciones}</span>
                </div>
            </div>
            <!--div class="col-lg-3 col-sm-6 col-xs-12">
                <div class="main-box infographic-box">
                    <i class="fa fa-eye yellow-bg"></i>
                    <span class="headline">Archivos Temporales</span>
                    <span class="value">12.526</span>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 col-xs-12">
                <div class="main-box infographic-box">
                    <i class="fa fa-eye yellow-bg"></i>
                    <span class="headline">Archivos Definitivos</span>
                    <span class="value">12.526</span>
                </div>
            </div-->
            <div class="col-lg-3 col-sm-6 col-xs-12">
                <div class="main-box infographic-box">
                    <i class="fa fa-legal yellow-bg"></i>
                    <span class="headline">Judicializado</span>
                    <span class="value">${iJudicializados}</span>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="main-box clearfix">
                    <header class="main-box-header clearfix">
                        <h2 class="pull-left">Últimas denuncias</h2>
                        <div class="filter-block pull-right">
                            <!--div class="form-group pull-left">
                                <input type="text" class="form-control" placeholder="Search...">
                                <i class="fa fa-search search-icon"></i>
                            </div-->
                            <g:link action="denuncias"  class="btn btn-primary pull-right">    
                                <i class="fa fa-eye fa-lg"></i> Mostrar todas las denuncias
                            </g:link>

                        </div>
                    </header>
                    <div class="main-box-body clearfix">
                        <div class="table-responsive clearfix">
                            <table class="table table-hover">
                                <thead>
                                    <tr>

                                        <th>Expediente</th>
                                        <th>Fecha Creacion</th>
                                        <th>Delito</th>
                                        <th>Imputado</th>
                                        <th>Modalidad</th>
                                        <th>Prioridad</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>


                                    <g:each in="${expedientes}" var="expediente" status="i">
                                        <tr>

                                            <td>
                                                <g:link action="detail"  id="${expediente.id}" style="color: #000000; text-decoration: none;">    
                                                    ${expediente.numeroExpediente}
                                                </g:link>
                                            </td>
                                            <td>
                                                <g:formatDate format="dd/MM/yyyy HH:mm" date="${expediente.dateCreated}"/>
                                            </td>
                                            <td>
                                                <span class="body">${expediente.delito.clasificacionDelito.nombre}</span>
                                            </td>
                                            <td>  
                                                <span class="subject">${expediente.delito.imputado.nombre}</span>
                                            </td>
                                            <td>
                                                <span class="subject">${expediente.delito.clasificacionDelito.modalidad}</span>
                                            </td> 
                                            <td>
                                                <span class="label label-danger">${expediente.delito.clasificacionDelito.prioridad}</span>
                                            </td>
                                            <td>
                                                <g:link action="detail"  id="${expediente.id}" class="table-link">  

                                                    <span class="fa-stack">
                                                        <i class="fa fa-square fa-stack-2x"></i>
                                                        <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                                    </span>

                                                </g:link>
                                            </td>

                                        </g:each>     


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <!--div class="row">
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="main-box small-graph-box red-bg">
                        <span class="value">2.562</span>
                        <span class="headline">Users</span>
                        <div class="progress">
                            <div style="width: 60%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="60" role="progressbar" class="progress-bar">
                                <span class="sr-only">60% Complete</span>
                            </div>
                        </div>
                        <span class="subinfo">
                            <i class="fa fa-arrow-circle-o-up"></i> 10% higher than last week
                        </span>
                        <span class="subinfo">
                            <i class="fa fa-users"></i> 29 new users
                        </span>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="main-box small-graph-box emerald-bg">
                        <span class="value">69.600</span>
                        <span class="headline">Visits</span>
                        <div class="progress">
                            <div style="width: 84%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="84" role="progressbar" class="progress-bar">
                                <span class="sr-only">84% Complete</span>
                            </div>
                        </div>
                        <span class="subinfo">
                            <i class="fa fa-arrow-circle-o-down"></i> 22% less than last week
                        </span>
                        <span class="subinfo">
                            <i class="fa fa-globe"></i> 84.912 last week
                        </span>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12 hidden-sm">
                    <div class="main-box small-graph-box green-bg">
                        <span class="value">923</span>
                        <span class="headline">Orders</span>
                        <div class="progress">
                            <div style="width: 42%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="42" role="progressbar" class="progress-bar">
                                <span class="sr-only">42% Complete</span>
                            </div>
                        </div>
                        <span class="subinfo">
                            <i class="fa fa-arrow-circle-o-up"></i> 15% higher than last week
                        </span>
                        <span class="subinfo">
                            <i class="fa fa-shopping-cart"></i> 8 new orders
                        </span>
                    </div>
                </div>
            </div-->

        <div class="row">
            <div class="col-md-6">
                <div class="main-box">
                    <div class="main-box-body clearfix">
                        <div id="calendar"></div>
                    </div>
                </div>
            </div>

        </div>




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



        <script>
            $(document).ready(function() {
            var table = $('#table-example').dataTable({
            'info': false,
			'sDom': 'lTfr<"clearfix">tip',
            'oTableTools': {
            'aButtons': [
            {
            'sExtends':    'collection',
                                    'sButtonText': '<i class="fa fa-cloud-download"></i>&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-down"></i>',
            'aButtons':    [ 'csv', 'xls', 'pdf', 'copy', 'print' ]
            }

            ]
            }
            });



            //
        </script>
        <script>



            $(document).ready(function () {
            /* initialize the calendar
            -----------------------------------------------------------------*/

            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();

            var calendar = $('#calendar').fullCalendar({
            header: {
            left: '',
            center: 'title',
            right: 'prev,next'
            },
            isRTL: $('body').hasClass('rtl'), //rtl support for calendar
            selectable: true,
            selectHelper: true,
            select: function (start, end, allDay) {
            var title = prompt('Event Title:');
            if (title) {
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
            drop: function (date, allDay) { // this function is called when something is dropped

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
            <g:each in="${agendasAudiencias}" var="audiencia" status="i">
                {   
                id: '${audiencia.id}',
                title: 'Audiencia',
                start: '<g:formatDate format="yyyy-MM-dd" date="${audiencia.inicio}"/>T<g:formatDate format="HH:mm:ss" date="${audiencia.inicio}"/>',
                end: '<g:formatDate format="yyyy-MM-dd" date="${audiencia.fin}"/>T<g:formatDate format="HH:mm:ss" date="${audiencia.fin}"/>',
                allDay: false,
                className: 'label-primary'
                },                                          
            </g:each>
            ]
            });

            });
        </script>
    </body>
</html>
