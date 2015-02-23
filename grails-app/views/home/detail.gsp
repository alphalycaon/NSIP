<html>
    <head>
        <meta charset="utf-8">
        <meta name="layout" content="main"/>
        <meta http-equiv="Content-Type" content="text/html">
<<<<<<< HEAD
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
      
=======
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'select2.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/bootstrap', file: 'bootstrap.min.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/compiled', file: 'elements.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-default.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-style-growl.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-style-bar.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-style-attached.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-style-other.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file: 'ns-style-theme.css')}"/>
        
          <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jstree/3.0.4/themes/default/style.min.css">
        
>>>>>>> origin/master
        <title>Detalles</title>
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
                                <div id="email-header-title" class="visible-md visible-lg">
                                    <i class="fa fa-inbox"></i> Inbox
                                </div>
                                <div id="email-header-tools" style=" left: 985px">
                                    <a href="${request.contextPath}" class="btn btn-primary">                                            
                                        <span class="fa fa-chevron-left" style="padding-right: 10px;"></span> Regresar
                                    </a>
                                </div>
                                <!--<div id="email-header-pagination" class="pull-right">
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
                                </div>-->
                            </header>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
<<<<<<< HEAD
                        <shiro:hasRole name="Ministerio">
                            <div id="email-navigation" class="email-nav-nano hidden-xs hidden-sm has-scrollbar">
                                <div class="email-nav-nano-content" tabindex="0" style="right: -16px;">                                    
                                    <ul id="email-nav-items" class="clearfix">
                                        <li>
                                            <a href="${request.contextPath}">
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
                                        <li>
                                            <b><a href="#" data-toggle="modal" data-target="#myModalPlantillas">
                                            <i class="fa fa-file-word-o"></i>
                                                Plantillas
                                            </a></b>
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
                                        <li>
                                            <a href="${request.contextPath}">
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
                                        <li>
                                            <b><a href="#" data-toggle="modal" data-target="#myModalPlantillas">
                                            <i class="fa fa-file-word-o"></i>
                                                Plantillas
                                            </a></b>
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
                                        <li>
                                            <a href="${request.contextPath}">
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
                                            <a href="calendar">
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
                                        <li>
                                            <b><a href="#" data-toggle="modal" data-target="#myModalPlantillas">
                                            <i class="fa fa-file-word-o"></i>
                                                Plantillas
                                            </a></b>
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
                                        <li>
                                            <a href="${request.contextPath}">
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
                                        <li>
                                            <b><a href="#" data-toggle="modal" data-target="#myModalPlantillas">
                                            <i class="fa fa-file-word-o"></i>
                                                Plantillas
                                            </a></b>
                                        </li>
                                    </ul>                                    
=======
                            <shiro:hasRole name="Ministerio">
                                <div id="email-navigation" class="email-nav-nano hidden-xs hidden-sm has-scrollbar">
                                    <div class="email-nav-nano-content" tabindex="0" style="right: -16px;">                                    
                                        <ul id="email-nav-items" class="clearfix">
                                            <li>
                                                <a href="${request.contextPath}">
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
                                            </br></br></br></br></br></br></br></br></br>
                                            <li>
                                                <a href="#" data-toggle="modal" data-target="#myModalPlantillas">
                                                    <i class="fa fa-file-word-o"></i>
                                                    Plantillas
                                                </a>
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
                                            <li>
                                                <a href="${request.contextPath}">
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
                                                <a href="#" data-toggle="modal" data-target="#myModalPlantillas">
                                                    <i class="fa fa-file-word-o"></i>
                                                    Plantillas
                                                </a>
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
                                            <li>
                                                <a href="${request.contextPath}">
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
                                                <a href="calendar">
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
                                            <li>
                                                <a href="${request.contextPath}">
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
                                        </ul>                                    
                                    </div>
                                    <div class="nano-pane" style="display: block;"><div class="nano-slider" style="height: 400px; transform: translate(0px, 0px);"></div></div>
>>>>>>> origin/master
                                </div>
                            </shiro:hasRole>
                            <shiro:hasRole name="Juez">
                                <div id="email-detail" class="email-detail-nano has-scrollbar" style="height: 627px;">
                                    <div class="email-detail-nano-content" tabindex="0" style="right: -16px;">
                                        <div id="email-detail-inner">
                                            <div id="email-detail-subject" class="clearfix">
                                                <span class="subject">Caso: COA/FG/XX/PGU/2014/AA-1</span>
                                                <span class="label label-success">Capturado</span>
                                            </div>

                                            <div id="email-body">      
                                            </div>  
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="main-box clearfix">                                                    
                                                        <div class="main-box-body clearfix">
                                                            <div class="tabs-wrapper">
                                                                <ul class="nav nav-tabs nav-justified" style="background-color:#EE7600;">
                                                                    <li class="active"><a href="#tab-delito" data-toggle="tab">Delito</a></li>
                                                                    <li><a href="#tab-victima" data-toggle="tab">Victima</a></li>                                                               
                                                                    <li><a href="#tab-responsable" data-toggle="tab">Presunto Responsable</a></li>                                                               
                                                                </ul>
                                                                <div class="tab-content">
                                                                    <div class="tab-pane fade in active" id="tab-delito">
                                                                        <br/>
                                                                        <div class="form-group">
                                                                            <label for="delito">Nombre</label>
                                                                            <input disabled="" type="text" class="form-control" name="clasificacionDelito.nombre" value="Robo a Mano Armada">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Modalidad </label>
                                                                            <input disabled="" type="text" class="form-control" name="clasificacionDelito.modalidad" value="Agravada">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Modus</label>
                                                                            <input disabled="" type="text" class="form-control" name="clasificacionDelito.modus" value="Culposo">
                                                                        </div>
                                                                    </div>
                                                                    <div class="tab-pane fade" id="tab-victima">
                                                                        <br/>
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Nombre </label>
                                                                            <input disabled="" type="text" class="form-control" name="victima.nombre" value="Juan Torres Pineda">
                                                                        </div>                                                
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Genero </label>
                                                                            <input disabled="" type="text" class="form-control" name="victima.genero" value="Hombre">
                                                                        </div>                                                
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Edad</label>
                                                                            <input disabled="" type="text" class="form-control" name="victima.edad" value="34">
                                                                        </div>                                                
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Estado Civil</label>
                                                                            <input disabled="" type="text" class="form-control" name="victima.estadoCivil" value="Soltero">
                                                                        </div>                                                
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Escolaridad</label>
                                                                            <input disabled="" type="text" class="form-control" name="victima.escolaridad" value="Licenciatura">
                                                                        </div>
                                                                    </div>                                                                
                                                                    <div class="tab-pane fade" id="tab-responsable">
                                                                        <br/>
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Nombre </label>
                                                                            <input disabled="" type="text" class="form-control" name="imputado.nombre" value="Luis Alameda Cespedes">
                                                                        </div>                                                
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Genero </label>
                                                                            <input disabled="" type="text" class="form-control" name="imputado.genero" value="Hombre" >
                                                                        </div>                                                
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Edad</label>
                                                                            <input disabled="" type="text" class="form-control" name="imputado.edad" value="40">
                                                                        </div>                                                
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Estado Civil</label>
                                                                            <input disabled="" type="text" class="form-control" name="imputado.estadoCivil" value="Soltero">
                                                                        </div>                                                
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Escolaridad</label>
                                                                            <input disabled="" type="text" class="form-control" name="imputado.escolaridad" value="Sin Estudios">
                                                                        </div>
                                                                    </div>                                                                
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="main-box clearfix">
                                                        <header class="main-box-header clearfix">
                                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalDefensor">Asignar Defensor</button>
                                                            </br>
                                                            </br>
                                                            </br>
                                                            <h2>Carpeta de investigación</h2>
                                                        </header>
                                                        <div class="main-box-body clearfix">
                                                            <div id="nestable-menu">
                                                                <button type="button" class="btn btn-primary" data-action="expand-all">Expandir Todos</button>
                                                                <button type="button" class="btn btn-danger" data-action="collapse-all">Contraer Todos</button>
                                                            </div>
                                                            <!--    -->
                                                            <div class="modal fade" id="myModalDefensor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                            <h4 class="modal-title" id="myModalLabel">Asignar Defensor</h4>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                        <form role="form">
                                                                            <div class="form-group form-group-select2">
                                                                                <label>Asignar a:</label>
                                                                                <select style="width:570px" id="listDefensor" multiple>
                                                                                    <option value="Pedro Garcia">Pedro Garcia</option>
                                                                                    <option value="Edgar Valencia">Edgar Valencia</option>
                                                                                    <option value="Antonio Molina">Antonio Molina</option>
                                                                                    <option value="Miguel Frias">Miguel Frias</option>
                                                                                    <option value="Eduardo Carrillo">Eduardo Carrillo</option>
                                                                                    <option value="Eduardo Hernandez">Eduardo Hernandez</option>
                                                                                    <option value="Olga Trevizo">Olga Trevizo</option>
                                                                                    <option value="Monserrat Fernandez">Monserrat Fernandez</option>
                                                                                    <option value="Gerardo Meza">Gerardo Meza</option>
                                                                                    <option value="Javier Arenas">Javier Arenas</option>
                                                                                    <option value="Alejandro Magallon">Alejandro Magallon</option>
                                                                                    <option value="Moises Pinedo">Moises Pinedo</option>
                                                                                    <option value="Leticia Corona">Leticia Corona</option>
                                                                                    <option value="Arcelina Rojas">Arcelina Rojas</option>
                                                                                    <option value="Rodrigo Arza">Rodrigo Arza</option>
                                                                                    <option value="Dante Astudillo">Dante Astudillo</option>
                                                                                    <option value="Elizabeth Cardenas">Elizabeth Cardenas</option>
                                                                                    <option value="Armando Gonzalez">Armando Gonzalez</option>
                                                                                    <option value="Salma Bernal">Salma Bernal</option>
                                                                                </select>
                                                                            </div>
                                                                        </form>        
                                                                        </div> 
                                                                       <div class="modal-footer">
                                                                           <textarea class="form-control" rows="3" id="comment" placeholder="Mensaje (Opcional)"></textarea>
                                                                           </br>
                                                                           <a data-dismiss="modal" href="#"  class="btn btn-primary" id="notificacionDefensor">                                            
                                                                                <span  style="padding-right: 10px;"></span> Aceptar
                                                                            </a>   
                                                                            <a data-dismiss="modal" class="btn btn-danger">                                            
                                                                                <span style="padding-right: 10px;"></span> Cancelar
                                                                            </a>
                                                                       </div> 
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    <!-- -->                                                        
                                                        <div class="modal fade" id="myModalCompartir" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                        <h4 class="modal-title" id="myModalLabel">Compartir Archivos</h4>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <form role="form">
                                                                            <div class="form-group form-group-select2">
                                                                                <label>Compartir a:</label>
                                                                                <select style="width:570px" id="listCompartir" multiple>
                                                                                    <option value="Pedro Garcia">Pedro Garcia</option>
                                                                                    <option value="Edgar Valencia">Edgar Valencia</option>
                                                                                    <option value="Antonio Molina">Antonio Molina</option>
                                                                                    <option value="Miguel Frias">Miguel Frias</option>
                                                                                    <option value="Eduardo Carrillo">Eduardo Carrillo</option>
                                                                                    <option value="Eduardo Hernandez">Eduardo Hernandez</option>
                                                                                    <option value="Olga Trevizo">Olga Trevizo</option>
                                                                                    <option value="Monserrat Fernandez">Monserrat Fernandez</option>
                                                                                    <option value="Gerardo Meza">Gerardo Meza</option>
                                                                                    <option value="Javier Arenas">Javier Arenas</option>
                                                                                    <option value="Alejandro Magallon">Alejandro Magallon</option>
                                                                                    <option value="Moises Pinedo">Moises Pinedo</option>
                                                                                    <option value="Leticia Corona">Leticia Corona</option>
                                                                                    <option value="Arcelina Rojas">Arcelina Rojas</option>
                                                                                    <option value="Rodrigo Arza">Rodrigo Arza</option>
                                                                                    <option value="Dante Astudillo">Dante Astudillo</option>
                                                                                    <option value="Elizabeth Cardenas">Elizabeth Cardenas</option>
                                                                                    <option value="Armando Gonzalez">Armando Gonzalez</option>
                                                                                    <option value="Salma Bernal">Salma Bernal</option>
                                                                                </select>
                                                                            </div>
                                                                        </form>      
                                                                    </div>
                                                                       <div class="modal-footer">                                                                           
                                                                           <textarea class="form-control" rows="3" id="comment" placeholder="Mensaje (Opcional)"></textarea>
                                                                           </br>
                                                                            <a data-dismiss="modal" href="#" class="btn btn-primary" id="notificacionCompartir">                                            
                                                                                <span  style="padding-right: 10px;"></span> Aceptar
                                                                            </a>   
                                                                            <a data-dismiss="modal" class="btn btn-danger">                                            
                                                                                <span style="padding-right: 10px;"></span> Cancelar
                                                                            </a>
                                                                       </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                     <!--  -->
                                                        <div class="row cf nestable-lists" id="user-profile">                                                            
                                                            <div class="col-md-6 dd nestable" >
                                                                
                                                                <div id="contenedor">
                                                                    <ul>
                                                                      <li data-jstree='{"opened":true}'>Root node
                                                                        <ul>
                                                                          <li>Child node 1</li>
                                                                          <li>Child node 2</li>
                                                                        </ul>
                                                                      </li>
                                                                    </ul>
                                                                </div>
                                                                
                                                                
                                                                <ol class="dd-list dd-nodrag">                                         
                                                                    <li class="dd-item dd-item-list " data-id="13"><button data-action="collapse" type="button" style="display: block;">Collapse</button><button data-action="expand" type="button" style="display: none;">Expand</button>
                                                                        <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                        <div class="dd-handle dd-nodrag">Media filiacion<a id="media" href="#" data-toggle="modal" data-target="#myModalCompartir" style="vertical-align:middle; float: right">             compartir                            </a></div>
                                                                        <ol class="dd-list" style="">
                                                                            <li class="dd-item dd-item-list" data-id="16">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-pdf-o"></i></div>
                                                                                <div class="dd-handle ">Archivo 1 <a id="arch1" href="#" data-toggle="modal" data-target="#myModalCompartir" style="vertical-align:middle; float: right">             compartir                            </a></div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="17">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-word-o"></i></div>
                                                                                <div class="dd-handle ">Archivo 2 <a id="arch2" href="#" data-toggle="modal" data-target="#myModalCompartir" style="vertical-align:middle; float: right">             compartir                            </a></div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="18">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-text"></i></div>
                                                                                <div class="dd-handle ">Archivo 3 <a id="arch3" href="#" data-toggle="modal" data-target="#myModalCompartir" style="vertical-align:middle; float: right">             compartir                            </a></div>
                                                                            </li>
                                                                        </ol>
                                                                    </li>
                                                                    <li class="dd-item dd-item-list" data-id="14"><button data-action="collapse" type="button" style="display: block;">Collapse</button><button data-action="expand" type="button" style="display: none;">Expand</button>
                                                                        <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                        <div class="dd-handle">Documentos Probatorios<a id="docp" href="#" data-toggle="modal" data-target="#myModalCompartir" style="vertical-align:middle; float: right">             compartir                            </a></div>
                                                                        <ol class="dd-list" style="">
                                                                            <li class="dd-item dd-item-list" data-id="16">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-audio-o"></i></div>
                                                                                <div class="dd-handle ">Documento 1 <a id="doc1" href="#" data-toggle="modal" data-target="#myModalCompartir" style="vertical-align:middle; float: right">             compartir                            </a></div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="17">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-pdf-o"></i></div>
                                                                                <div class="dd-handle ">Documento 2 <a id="doc2" href="#" data-toggle="modal" data-target="#myModalCompartir" style="vertical-align:middle; float: right">             compartir                            </a></div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="18">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-word-o"></i></div>
                                                                                <div class="dd-handle ">Documento 3 <a id="doc3" href="#" data-toggle="modal" data-target="#myModalCompartir" style="vertical-align:middle; float: right">             compartir                            </a></div>
                                                                            </li>
                                                                        </ol>
                                                                    </li>                                                                    
                                                                    <li class="dd-item dd-item-list" data-id="15"><button data-action="collapse" type="button" style="display: block;">Collapse</button><button data-action="expand" type="button" style="display: none;">Expand</button>
                                                                        <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                        <div class="dd-handle">Fotografias de los Hechos<a id="fotog" href="#" data-toggle="modal" data-target="#myModalCompartir" style="vertical-align:middle; float: right">             compartir                            </a></div>
                                                                        <ol class="dd-list" style="">
                                                                            <li class="dd-item dd-item-list" data-id="16">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-image-o"></i></div>
                                                                                <div class="dd-handle ">Fotografia 1 <a id="fot1" href="#" data-toggle="modal" data-target="#myModalCompartir" style="vertical-align:middle; float: right">             compartir                            </a></div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="17">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-image-o"></i></div>
                                                                                <div class="dd-handle ">Fotografia 2 <a id="fot2" href="#" data-toggle="modal" data-target="#myModalCompartir" style="vertical-align:middle; float: right">             compartir                            </a></div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="18">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-image-o"></i></div>
                                                                                <div class="dd-handle ">Fotografia 3 <a id="fot3" href="#" data-toggle="modal" data-target="#myModalCompartir" style="vertical-align:middle; float: right">             compartir                            </a></div>
                                                                            </li>
                                                                        </ol>
                                                                    </li>  
                                                                    <li class="dd-item dd-item-list" data-id="14"><button data-action="collapse" type="button" style="display: block;">Collapse</button><button data-action="expand" type="button" style="display: none;">Expand</button>
                                                                        <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                        <div class="dd-handle">Audiencias<a id="aud" href="#" data-toggle="modal" data-target="#myModalCompartir" style="vertical-align:middle; float: right">             compartir                            </a></div>
                                                                        <ol class="dd-list" style="">
                                                                            <li class="dd-item dd-item-list" data-id="16">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-video-o"></i></div>
                                                                                <div class="dd-handle ">video 1 <a id="vid1" href="#" data-toggle="modal" data-target="#myModalCompartir" style="vertical-align:middle; float: right">             compartir                            </a></div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="17">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-video-o"></i></div>
                                                                                <div class="dd-handle ">Video 2 <a id="vid2" href="#" data-toggle="modal" data-target="#myModalCompartir" style="vertical-align:middle; float: right">             compartir                            </a></div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="18">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-video-o"></i></div>
                                                                                <div class="dd-handle ">Video 3 <a id="vid3" href="#" data-toggle="modal" data-target="#myModalCompartir" style="vertical-align:middle; float: right">             compartir                            </a></div>
                                                                            </li>
                                                                        </ol>
                                                                    </li>
                                                                </ol>
                                                            </div>
                                                            <div class="col-md-6 dd" >
                                                                <div class="main-box clearfix">
                                                                    <header class="main-box-header clearfix">
                                                                        <h2>Fotografia 1</h2>                                                                        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="alignment-adjust:auto">
                                                                            <div class="modal-dialog modal-lg">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                                        <h4 class="modal-title" id="myModalLabel">Fotografía</h4>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <div class="embed-responsive embed-responsive-16by9">
                                                                                            <iframe class="embed-responsive-item" src="${resource(dir: 'centaurus/img/samples', file: 'tahiti-2.jpg')}" allowfullscreen=""></iframe>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div> 
                                                                        </div> 
                                                                        <div id="tahiti-2">
                                                                            <img src="${resource(dir: 'centaurus/img/samples', file: 'tahiti-2.jpg')}" alt="" data-toggle="modal" data-target="#myModal2" width="180" height="180"/>
                                                                        </div>
                                                                    </header>
                                                                    <div class="main-box-body clearfix">
                                                                        <div class="profile-status">
                                                                            <i class="fa fa-circle"></i> Disponible
                                                                        </div>
                                                                        <div class="profile-label">
                                                                            <span class="label label-danger">Ministerio 1</span>
                                                                        </div>
                                                                        <div class="profile-since">
                                                                            Ultima Actualizacion: 1/Enero/2015
                                                                        </div>
                                                                        <div class="profile-details">
                                                                            <ul class="fa-ul">
                                                                                <li><i class="fa-li fa fa-truck"></i>Tamaño: <span>1.5M</span></li>
                                                                                <li><i class="fa-li fa fa-comment"></i>Formato: <span>png</span></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="profile-message-btn center-block text-center">
                                                                            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                                                                                Ver Video
                                                                            </button>
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
                                <div class="nano-pane" style="display: none;"><div class="nano-slider" style="height: 611px; transform: translate(0px, 0px);"></div>
                                </div>
                        </div>                            
                        </shiro:hasRole>
                        <shiro:hasRole name="Ministerio">
                            <div id="email-detail" class="email-detail-nano has-scrollbar" style="height: 627px;">
                                <div class="email-detail-nano-content" tabindex="0" style="right: -16px;">
                                    <div id="email-detail-inner">
                                        <div id="email-detail-subject" class="clearfix">
                                            <span class="subject">COA/FG/XX/PGU/2014/AA-1</span>
                                            <span class="label label-success">Capturado</span>
                                        </div>

                                        <div id="email-body">      
                                        </div>  
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="main-box clearfix">                                                    
                                                    <div class="main-box-body clearfix">
                                                        <div class="tabs-wrapper">
                                                            <ul class="nav nav-tabs nav-justified" style="background-color:#EE7600;">
                                                                <li class="active"><a href="#tab-delito" data-toggle="tab">Delito</a></li>
                                                                <li><a href="#tab-victima" data-toggle="tab">Victima</a></li>                                                               
                                                                <li><a href="#tab-responsable" data-toggle="tab">Presunto Responsable</a></li>                                                               
                                                            </ul>
                                                            <div class="tab-content">
                                                                <div class="tab-pane fade in active" id="tab-delito">
                                                                    <br/>
                                                                    <div class="form-group">
                                                                        <label for="delito">Nombre</label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.nombre" value="Robo a Mano Armada">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Modalidad </label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.modalidad" value="Agravada">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Modus</label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.modus" value="Culposo">
                                                                    </div>
                                                                </div>
                                                                <div class="tab-pane fade" id="tab-victima">
                                                                    <br/>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nombre </label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.nombre" value="Juan Torres Pineda">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Genero </label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.genero" value="Hombre">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Edad</label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.edad" value="34">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Estado Civil</label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.estadoCivil" value="Soltero">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Escolaridad</label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.escolaridad" value="Licenciatura">
                                                                    </div>
                                                                </div>                                                                
                                                                <div class="tab-pane fade" id="tab-responsable">
                                                                    <br/>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nombre </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.nombre" value="Luis Alameda Cespedes">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Genero </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.genero" value="Hombre" >
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Edad</label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.edad" value="40">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Estado Civil</label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.estadoCivil" value="Soltero">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Escolaridad</label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.escolaridad" value="Sin Estudios">
                                                                    </div>
                                                                </div>                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="main-box clearfix">
                                                    <header class="main-box-header clearfix">
                                                        <h2>Archivos</h2>
                                                    </header>
                                                    <div class="main-box-body clearfix">
                                                        <div id="nestable-menu">
                                                            <button type="button" class="btn btn-primary" data-action="expand-all">Expandir Todos</button>
                                                            <button type="button" class="btn btn-danger" data-action="collapse-all">Contraer Todos</button>
                                                        </div>
                                                        <div class="row cf nestable-lists" id="user-profile">                                                            
                                                            <div class="col-md-6 dd nestable" >
                                                                <ol class="dd-list dd-nodrag">
                                                                    <li class="dd-item dd-item-list " data-id="13"><button data-action="collapse" type="button" style="display: block;">Collapse</button><button data-action="expand" type="button" style="display: none;">Expand</button>
                                                                        <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                        <div class="dd-handle dd-nodrag">Media filiacion</div>
                                                                        <ol class="dd-list" style="">
                                                                            <li class="dd-item dd-item-list" data-id="16">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-pdf-o"></i></div>
                                                                                <div class="dd-handle ">Archivo 1</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="17">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-word-o"></i></div>
                                                                                <div class="dd-handle  ">Archivo 2</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="18">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-text"></i></div>
                                                                                <div class="dd-handle ">Archivo 3</div>
                                                                            </li>
                                                                        </ol>
                                                                    </li>
                                                                    <li class="dd-item dd-item-list" data-id="14"><button data-action="collapse" type="button" style="display: block;">Collapse</button><button data-action="expand" type="button" style="display: none;">Expand</button>
                                                                        <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                        <div class="dd-handle">Documentos Probatorios</div>
                                                                        <ol class="dd-list" style="">
                                                                            <li class="dd-item dd-item-list" data-id="16">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-audio-o"></i></div>
                                                                                <div class="dd-handle ">Documento 1</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="17">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-pdf-o"></i></div>
                                                                                <div class="dd-handle  ">Documento 2</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="18">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-word-o"></i></div>
                                                                                <div class="dd-handle ">Documento 3</div>
                                                                            </li>
                                                                        </ol>
                                                                    </li>                                                                    
                                                                    <li class="dd-item dd-item-list" data-id="15"><button data-action="collapse" type="button" style="display: block;">Collapse</button><button data-action="expand" type="button" style="display: none;">Expand</button>
                                                                        <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                        <div class="dd-handle">Fotografias de los Hechos</div>
                                                                        <ol class="dd-list" style="">
                                                                            <li class="dd-item dd-item-list" data-id="16">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-image-o"></i></div>
                                                                                <div class="dd-handle ">Fotografia 1</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="17">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-image-o"></i></div>
                                                                                <div class="dd-handle  ">Fotografia 2</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="18">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-image-o"></i></div>
                                                                                <div class="dd-handle ">Fotografia 3</div>
                                                                            </li>
                                                                        </ol>
                                                                    </li>  
                                                                    <li class="dd-item dd-item-list" data-id="14"><button data-action="collapse" type="button" style="display: block;">Collapse</button><button data-action="expand" type="button" style="display: none;">Expand</button>
                                                                        <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                        <div class="dd-handle">
                                                                            Audiencias
                                                                        </div>
                                                                        <ol class="dd-list" style="">
                                                                            <li class="dd-item dd-item-list" data-id="16">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-video-o"></i></div>
                                                                                <div class="dd-handle ">Video 1</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="17">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-video-o"></i></div>
                                                                                <div class="dd-handle  ">Video 2</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="18">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-video-o"></i></div>
                                                                                <div class="dd-handle ">Video 3</div>
                                                                            </li>
                                                                        </ol>
                                                                    </li>
                                                                </ol>
                                                            </div>
                                                            <div class="col-md-6 dd" >
                                                                <div class="main-box clearfix">
                                                                    <header class="main-box-header clearfix">
                                                                        <h2>Fotografia 1</h2>                                                                        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="alignment-adjust:auto">
                                                                            <div class="modal-dialog modal-lg">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                                        <h4 class="modal-title" id="myModalLabel">Fotografía</h4>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <div class="embed-responsive embed-responsive-16by9">
                                                                                            <iframe class="embed-responsive-item" src="${resource(dir: 'centaurus/img/samples', file: 'tahiti-2.jpg')}" allowfullscreen=""></iframe>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div> 
                                                                        </div> 
                                                                        <div id="tahiti-2">
                                                                            <img src="${resource(dir: 'centaurus/img/samples', file: 'tahiti-2.jpg')}" alt="" data-toggle="modal" data-target="#myModal2" width="180" height="180"/>
                                                                        </div>
                                                                    </header>
                                                                    <div class="main-box-body clearfix">
                                                                        <div class="profile-status">
                                                                            <i class="fa fa-circle"></i> Disponible
                                                                        </div>
                                                                        <div class="profile-label">
                                                                            <span class="label label-danger">Ministerio 1</span>
                                                                        </div>
                                                                        <div class="profile-since">
                                                                            Ultima Actualizacion: 1/Enero/2015
                                                                        </div>
                                                                        <div class="profile-details">
                                                                            <ul class="fa-ul">
                                                                                <li><i class="fa-li fa fa-truck"></i>Tamaño: <span>1.5M</span></li>
                                                                                <li><i class="fa-li fa fa-comment"></i>Formato: <span>png</span></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="profile-message-btn center-block text-center">
                                                                            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                                                                                Ver Video
                                                                            </button>
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
                                <div class="nano-pane" style="display: none;"><div class="nano-slider" style="height: 611px; transform: translate(0px, 0px);"></div>
                                </div>
                            </div>                            
                        </shiro:hasRole>
                        <shiro:hasRole name="Defensor">
                            <div id="email-detail" class="email-detail-nano has-scrollbar" style="height: 627px;">
                                <div class="email-detail-nano-content" tabindex="0" style="right: -16px;">
                                    <div id="email-detail-inner">
                                        <div id="email-detail-subject" class="clearfix">
                                            <span class="subject">COA/FG/XX/PGU/2014/AA-1</span>
                                            <span class="label label-success">Capturado</span>
                                        </div>

                                        <div id="email-body">      
                                        </div>  
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="main-box clearfix">                                                    
                                                    <div class="main-box-body clearfix">
                                                        <div class="tabs-wrapper">
                                                            <ul class="nav nav-tabs nav-justified" style="background-color:#EE7600;">
                                                                <li class="active"><a href="#tab-delito" data-toggle="tab">Delito</a></li>
                                                                <li><a href="#tab-victima" data-toggle="tab">Victima</a></li>                                                               
                                                                <li><a href="#tab-responsable" data-toggle="tab">Presunto Responsable</a></li>                                                               
                                                            </ul>
                                                            <div class="tab-content">
                                                                <div class="tab-pane fade in active" id="tab-delito">
                                                                    <br/>
                                                                    <div class="form-group">
                                                                        <label for="delito">Nombre</label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.nombre" value="Robo a Mano Armada">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Modalidad </label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.modalidad" value="Agravada">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Modus</label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.modus" value="Culposo">
                                                                    </div>
                                                                </div>
                                                                <div class="tab-pane fade" id="tab-victima">
                                                                    <br/>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nombre </label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.nombre" value="Juan Torres Pineda">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Genero </label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.genero" value="Hombre">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Edad</label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.edad" value="34">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Estado Civil</label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.estadoCivil" value="Soltero">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Escolaridad</label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.escolaridad" value="Licenciatura">
                                                                    </div>
                                                                </div>                                                                
                                                                <div class="tab-pane fade" id="tab-responsable">
                                                                    <br/>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nombre </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.nombre" value="Luis Alameda Cespedes">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Genero </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.genero" value="Hombre" >
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Edad</label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.edad" value="40">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Estado Civil</label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.estadoCivil" value="Soltero">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Escolaridad</label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.escolaridad" value="Sin Estudios">
                                                                    </div>
                                                                </div>                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div id="div_aceptar_rechazar">
                                                    <button type="button" onclick="aceptarCaso()" class="btn btn-primary">Aceptar caso</button>
                                                    <a href="${request.contextPath}" class="btn btn-danger">Rechazar caso</a>
                                                    </br></br></br></br></br></br></br>
                                                </div>
                                                <div class="main-box clearfix" id="div_archivos" hidden="true">
                                                    <header class="main-box-header clearfix">
                                                        <h2>Archivos</h2>
                                                    </header>
                                                    <div class="main-box-body clearfix">
                                                        <div id="nestable-menu">
                                                            <button type="button" class="btn btn-primary" data-action="expand-all">Expandir Todos</button>
                                                            <button type="button" class="btn btn-danger" data-action="collapse-all">Contraer Todos</button>
                                                        </div>
                                                        <div class="row cf nestable-lists" id="user-profile">                                                            
                                                            <div class="col-md-6 dd nestable" >
                                                                <ol class="dd-list dd-nodrag">
                                                                    <li class="dd-item dd-item-list " data-id="13"><button data-action="collapse" type="button" style="display: block;">Collapse</button><button data-action="expand" type="button" style="display: none;">Expand</button>
                                                                        <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                        <div class="dd-handle dd-nodrag">Media filiacion</div>
                                                                        <ol class="dd-list" style="">
                                                                            <li class="dd-item dd-item-list" data-id="16">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-pdf-o"></i></div>
                                                                                <div class="dd-handle ">Archivo 1</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="17">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-word-o"></i></div>
                                                                                <div class="dd-handle  ">Archivo 2</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="18">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-text"></i></div>
                                                                                <div class="dd-handle ">Archivo 3</div>
                                                                            </li>
                                                                        </ol>
                                                                    </li>
                                                                    <li class="dd-item dd-item-list" data-id="14"><button data-action="collapse" type="button" style="display: block;">Collapse</button><button data-action="expand" type="button" style="display: none;">Expand</button>
                                                                        <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                        <div class="dd-handle">Documentos Probatorios</div>
                                                                        <ol class="dd-list" style="">
                                                                            <li class="dd-item dd-item-list" data-id="16">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-audio-o"></i></div>
                                                                                <div class="dd-handle ">Documento 1</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="17">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-pdf-o"></i></div>
                                                                                <div class="dd-handle  ">Documento 2</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="18">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-word-o"></i></div>
                                                                                <div class="dd-handle ">Documento 3</div>
                                                                            </li>
                                                                        </ol>
                                                                    </li>                                                                    
                                                                    <li class="dd-item dd-item-list" data-id="15"><button data-action="collapse" type="button" style="display: block;">Collapse</button><button data-action="expand" type="button" style="display: none;">Expand</button>
                                                                        <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                        <div class="dd-handle">Fotografias de los Hechos</div>
                                                                        <ol class="dd-list" style="">
                                                                            <li class="dd-item dd-item-list" data-id="16">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-image-o"></i></div>
                                                                                <div class="dd-handle ">Fotografia 1</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="17">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-image-o"></i></div>
                                                                                <div class="dd-handle  ">Fotografia 2</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="18">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-image-o"></i></div>
                                                                                <div class="dd-handle ">Fotografia 3</div>
                                                                            </li>
                                                                        </ol>
                                                                    </li>  
                                                                    <li class="dd-item dd-item-list" data-id="14"><button data-action="collapse" type="button" style="display: block;">Collapse</button><button data-action="expand" type="button" style="display: none;">Expand</button>
                                                                        <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                        <div class="dd-handle">
                                                                            Audiencias
                                                                        </div>
                                                                        <ol class="dd-list" style="">
                                                                            <li class="dd-item dd-item-list" data-id="16">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-video-o"></i></div>
                                                                                <div class="dd-handle ">Video 1</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="17">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-video-o"></i></div>
                                                                                <div class="dd-handle  ">Video 2</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="18">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-video-o"></i></div>
                                                                                <div class="dd-handle ">Video 3</div>
                                                                            </li>
                                                                        </ol>
                                                                    </li>
                                                                </ol>
                                                            </div>
                                                            <div class="col-md-6 dd" >
                                                                <div class="main-box clearfix">
                                                                    <header class="main-box-header clearfix">
                                                                        <h2>Fotografia 1</h2>                                                                        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="alignment-adjust:auto">
                                                                            <div class="modal-dialog modal-lg">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                                        <h4 class="modal-title" id="myModalLabel">Fotografía</h4>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <div class="embed-responsive embed-responsive-16by9">
                                                                                            <iframe class="embed-responsive-item" src="${resource(dir: 'centaurus/img/samples', file: 'tahiti-2.jpg')}" allowfullscreen=""></iframe>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div> 
                                                                        </div> 
                                                                        <div id="tahiti-2">
                                                                            <img src="${resource(dir: 'centaurus/img/samples', file: 'tahiti-2.jpg')}" alt="" data-toggle="modal" data-target="#myModal2" width="180" height="180"/>
                                                                        </div>
                                                                    </header>
                                                                    <div class="main-box-body clearfix">
                                                                        <div class="profile-status">
                                                                            <i class="fa fa-circle"></i> Disponible
                                                                        </div>
                                                                        <div class="profile-label">
                                                                            <span class="label label-danger">Ministerio 1</span>
                                                                        </div>
                                                                        <div class="profile-since">
                                                                            Ultima Actualizacion: 1/Enero/2015
                                                                        </div>
                                                                        <div class="profile-details">
                                                                            <ul class="fa-ul">
                                                                                <li><i class="fa-li fa fa-truck"></i>Tamaño: <span>1.5M</span></li>
                                                                                <li><i class="fa-li fa fa-comment"></i>Formato: <span>png</span></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="profile-message-btn center-block text-center">
                                                                            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                                                                                Ver Video
                                                                            </button>
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
                                <div class="nano-pane" style="display: none;"><div class="nano-slider" style="height: 611px; transform: translate(0px, 0px);"></div>
                                </div>
                            </div>                            
                        </shiro:hasRole>
                        <shiro:hasRole name="CES">
                            <div id="email-detail" class="email-detail-nano has-scrollbar" style="height: 627px;">
                                <div class="email-detail-nano-content" tabindex="0" style="right: -16px;">
                                    <div id="email-detail-inner">
                                        <div id="email-detail-subject" class="clearfix">
                                            <span class="subject">IPH/FG/XX/PGU/2015/BB-1</span>
                                        </div>

                                        <div id="email-body">      
                                        </div>  
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="main-box clearfix">                                                    
                                                    <div class="main-box-body clearfix">
                                                        <div class="tabs-wrapper">
                                                            <ul class="nav nav-tabs">
                                                                <li class="active"><a href="#tab-general" data-toggle="tab">Datos Generales</a></li>
                                                                <li><a href="#tab-victima" data-toggle="tab">Victima</a></li>                                                               
                                                                <li><a href="#tab-responsable" data-toggle="tab">Probable Responsable</a></li>                                                               
                                                            </ul>
                                                            <div class="tab-content">
                                                                <div class="tab-pane fade in active" id="tab-general">
                                                                    <br/>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Fecha del evento</label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.nombre" value="28/01/2015">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Hora del evento</label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.modalidad" value="05:30 P.M.">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Asunto</label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.modus" value="Acoso Sexual">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Participación</label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.modus" value="Apoyo">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Operativo</label>
                                                                        <g:checkBox disabled="" name="operativo" value="false" checked="false"/>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Ubicación</label>
                                                                        <input disabled="" type="text" class="form-control" name="clasificacionDelito.modus" value="Cruz del sur #1234">
                                                                    </div>
                                                                </div>
                                                                <div class="tab-pane fade" id="tab-victima">
                                                                    <br/>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nombre(s) </label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.nombre" value="Francisco Javier">
                                                                    </div> 
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Apellido Paterno </label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.paterno" value="Vázquez">
                                                                    </div> 
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Apellido Materno </label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.materno" value="Vargas">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Edad</label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.edad" value="27">
                                                                    </div>                                          
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Sexo </label>
                                                                        <input disabled="" type="text" class="form-control" name="victima.genero" value="Masculino">
                                                                    </div>                               
                                                                </div>                                                                
                                                                <div class="tab-pane fade" id="tab-responsable">
                                                                    <br/>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nombre(s) </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.nombre" value="Dante Azel">
                                                                    </div> 
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Apellido Paterno </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.paterno" value="Astudillo">
                                                                    </div> 
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Apellido Materno </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.materno" value="Cardenas">
                                                                    </div>                                                
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Edad</label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.edad" value="25">
                                                                    </div>                                          
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Sexo </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.genero" value="Masculino">
                                                                    </div>                                        
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Probables delitos o faltas administrativas </label>
                                                                        <input disabled="" type="text" class="form-control" name="imputado.genero" value="Acoso Sexual">
                                                                    </div>   
                                                                </div>                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="main-box clearfix">
                                                    <header class="main-box-header clearfix">
                                                        <h2>Archivos</h2>
                                                    </header>
                                                    <div class="main-box-body clearfix">
                                                        <div id="nestable-menu">
                                                            <button type="button" class="btn btn-primary" data-action="expand-all">Expandir Todos</button>
                                                            <button type="button" class="btn btn-danger" data-action="collapse-all">Contraer Todos</button>
                                                        </div>
                                                        <div class="row cf nestable-lists" id="user-profile">                                                            
                                                            <div class="col-md-6 dd nestable" >
                                                                <ol class="dd-list dd-nodrag">
                                                                    <li class="dd-item dd-item-list" data-id="14"><button data-action="collapse" type="button" style="display: block;">Collapse</button><button data-action="expand" type="button" style="display: none;">Expand</button>
                                                                        <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                        <div class="dd-handle">Evidencia</div>
                                                                        <ol class="dd-list" style="">
                                                                            <li class="dd-item dd-item-list" data-id="16">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-audio-o"></i></div>
                                                                                <div class="dd-handle ">Documento 1</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="17">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-video-o"></i></div>
                                                                                <div class="dd-handle  ">Documento 2</div>
                                                                            </li>
                                                                            <li class="dd-item dd-item-list" data-id="18">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-image-o"></i></div>
                                                                                <div class="dd-handle ">Documento 3</div>
                                                                            </li>
                                                                        </ol>
                                                                    </li>       
                                                                    <li class="dd-item dd-item-list" data-id="14"><button data-action="collapse" type="button" style="display: block;">Collapse</button><button data-action="expand" type="button" style="display: none;">Expand</button>
                                                                        <div class="dd-handle-list"><i class="fa fa-folder-o"></i></div>
                                                                        <div class="dd-handle">IPH</div>
                                                                        <ol class="dd-list" style="">
                                                                            <li class="dd-item dd-item-list" data-id="18">
                                                                                <div class="dd-handle-list"><i class="fa fa-file-word-o"></i></div>
                                                                                <div class="dd-handle ">Documento IPH 1</div>
                                                                            </li>
                                                                        </ol>
                                                                    </li>    
                                                                </ol>
                                                            </div>
                                                            <div class="col-md-6 dd" >
                                                                <div class="main-box clearfix">
                                                                    <header class="main-box-header clearfix">
                                                                        <h2>Fotografia 1</h2>                                                                        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="alignment-adjust:auto">
                                                                            <div class="modal-dialog modal-lg">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                                        <h4 class="modal-title" id="myModalLabel">Fotografía</h4>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <div class="embed-responsive embed-responsive-16by9">
                                                                                            <iframe class="embed-responsive-item" src="${resource(dir: 'centaurus/img/samples', file: 'tahiti-2.jpg')}" allowfullscreen=""></iframe>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div> 
                                                                        </div> 
                                                                        <div id="tahiti-2">
                                                                            <img src="${resource(dir: 'centaurus/img/samples', file: 'tahiti-2.jpg')}" alt="" data-toggle="modal" data-target="#myModal2" width="180" height="180"/>
                                                                        </div>
                                                                    </header>
                                                                    <div class="main-box-body clearfix">
                                                                        <div class="profile-status">
                                                                            <i class="fa fa-circle"></i> Disponible
                                                                        </div>
                                                                        <div class="profile-label">
                                                                            <span class="label label-danger">Ministerio 1</span>
                                                                        </div>
                                                                        <div class="profile-since">
                                                                            Ultima Actualizacion: 1/Enero/2015
                                                                        </div>
                                                                        <div class="profile-details">
                                                                            <ul class="fa-ul">
                                                                                <li><i class="fa-li fa fa-truck"></i>Tamaño: <span>1.5M</span></li>
                                                                                <li><i class="fa-li fa fa-comment"></i>Formato: <span>png</span></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="profile-message-btn center-block text-center">
                                                                            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                                                                                Ver Video
                                                                            </button>
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
                                <div class="nano-pane" style="display: none;"><div class="nano-slider" style="height: 611px; transform: translate(0px, 0px);"></div>
                                </div>
                            </div>     
                        </shiro:hasRole>
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">Grabacion de la Audiencia</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="embed-responsive embed-responsive-16by9">
                                            <iframe class="embed-responsive-item" src="//player.vimeo.com/video/73437656" allowfullscreen=""></iframe>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <!--Modal-->
                        <div class="modal fade" id="myModalPlantillas" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">Plantillas</h4>
                                    </div>
                                    <div class="modal-body">
                                        <li>
                                            <a href=${resource(dir: 'Plantillas', file: 'PlantillaIph.doc')} title="Descargar">
                                                <span class="fa fa-file-word-o" style="padding-right: 10px;"></span> Plantilla IPH
                                            </a>
                                        </li>
                                        <li>
                                            <a href=${resource(dir: 'Plantillas', file: 'PlantillaDenuncia.doc')} title="Descargar">
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
                    </div>
                </div>
            </div>
        </div>
        
        <script src="${resource(dir: 'centaurus/js', file: 'jquery.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'bootstrap.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'jquery.nanoscroller.min.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'select2.min.js')}"></script>
        
        <script src="${resource(dir: 'centaurus/js', file: 'modernizr.custom.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'snap.svg-min.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'classie.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'scripts.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'pace.min.js')}"></script>
        <script src="${resource(dir: 'centaurus/js', file: 'notificationFx.js')}"></script>
        
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jstree/3.0.4/jstree.min.js"></script>
            
        <script>
            
            $('#contenedor').jstree({  
                "plugins" : ["checkbox"] 
              });
            
        </script>    
        
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

            // activate Nestable for list 1
            $('.nestable').nestable({
            group: 1
            });


            // output initial serialised data
            $('#nestable-menu').on('click', function(e){
            var target = $(e.target),
            action = target.data('action');
            if (action === 'expand-all') {
            $('.dd').nestable('expandAll');
            }
            if (action === 'collapse-all') {
            $('.dd').nestable('collapseAll');
            }
            });
            });
        </script>
        <script> 
            function aceptarCaso() { 
            document.getElementById('div_archivos').style.display='block';
            document.getElementById('div_aceptar_rechazar').style.display='none';
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
            showOnlyOptionsSimilarToText($("#CustomerSelect"), userInput.toUpperCase());
            });
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

            $("#SearchCompartir").on("keyup", function () {
            var userInput = $("#SearchCompartir").val();
            showOnlyOptionsSimilarToText($("#CompartirSelect"), userInput.toUpperCase());
            });
        </script>
        <script type="text/javascript">
            function compartir(){
            valor = document.getElementById('comment').value;
            if(valor==''){
            document.getElementById('comment').value += CompartirSelect.value;
            }else{        
            if(valor.indexOf(CompartirSelect.value)<0){
            document.getElementById('comment').value += '\n'+CompartirSelect.value;
            }
            }
            }
        </script>
        <script type="text/javascript">
            $(function($) {		
            $('#listDefensor').select2({
            placeholder: 'Escribir defensor a asignar',
            allowClear: true
            });		
            });
        </script>
        
                <script type="text/javascript">
            $(function($) {		
            $('#listCompartir').select2({
            placeholder: 'Nombre de la persona',
            allowClear: true
            });		
            });
        </script>
        
   <script>
       (function() {
        var bttnNotificacionDefensor = document.getElementById( 'notificacionDefensor' );
        bttnNotificacionDefensor.disabled = false;
        bttnNotificacionDefensor.addEventListener( 'click', function() {
                var notification = new NotificationFx({
                        message : '<span class="icon fa fa-users fa-2x"></span><p>Se asigno correctamente al defesor o defesores.</p>',
                        layout : 'bar',
                        effect : 'exploader',
                        type : 'success',
                        onClose : function() {
                                bttnNotificacionDefensor.disabled = false;
                        }
                });
                notification.show();
                this.disabled = true;
                } );
            })();
           
            (function() {
                var bttnNotificacionCompartir = document.getElementById( 'notificacionCompartir' );
                bttnNotificacionCompartir.disabled = false;
                bttnNotificacionCompartir.addEventListener( 'click', function() {
                var notification = new NotificationFx({
                        message : '<span class="icon fa fa-inbox fa-2x"></span><p>Se compartieron los archivo(s) correctamente.</p>',
                        layout : 'bar',
                        effect : 'exploader',
                        type : 'success',
                        onClose : function() {
                                bttnNotificacionCompartir.disabled = false;
                        }
                });
                notification.show();
                this.disabled = true;
                } );
            })();
   </script>    

    </div>

</body>
</html>
