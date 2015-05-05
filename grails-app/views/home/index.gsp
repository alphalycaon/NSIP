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
                <div class="row">
                    <div class="col-lg-12">
                        <ol class="breadcrumb">
                            <li><a href="#">Inicio</a></li>
                            <li class="active"><span>Tablero de Control</span></li>
                        </ol>
                        <h1>Tablero de Control</h1>
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
        </div>
    </div>


</body>
</html>
