<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultados</title>
        <meta name="layout" content="main"/>
        
        <style>
            @import "http://fonts.googleapis.com/css?family=Roboto:300,400,500,700";

            .container { margin-top: 20px; }
            .mb20 { margin-bottom: 20px; } 

            hgroup { padding-left: 15px; border-bottom: 1px solid #ccc; }
            hgroup h1 { font: 500 normal 1.625em "Roboto",Arial,Verdana,sans-serif; color: #2a3644; margin-top: 0; line-height: 1.15; }
            hgroup h2.lead { font: normal normal 1.125em "Roboto",Arial,Verdana,sans-serif; color: #2a3644; margin: 0; padding-bottom: 10px; }

            .search-result .thumbnail { border-radius: 0 !important; }
            .search-result:first-child { margin-top: 0 !important; }
            .search-result { margin-top: 20px; }
            .search-result .col-md-2 { border-right: 1px dotted #ccc; min-height: 140px; }
            .search-result ul { padding-left: 0 !important; list-style: none;  }
            .search-result ul li { font: 400 normal .85em "Roboto",Arial,Verdana,sans-serif;  line-height: 30px; }
            .search-result ul li i { padding-right: 5px; }
            .search-result .col-md-7 { position: relative; }
            .search-result h3 { font: 500 normal 1.375em "Roboto",Arial,Verdana,sans-serif; margin-top: 0 !important; margin-bottom: 10px !important; }
            .search-result h3 > a, .search-result i { color: #248dc1 !important; }
            .search-result p { font: normal normal 1.125em "Roboto",Arial,Verdana,sans-serif; } 
            .search-result span.plus { position: absolute; right: 0; top: 126px; }
            .search-result span.plus a { background-color: #248dc1; padding: 5px 5px 3px 5px; }
            .search-result span.plus a:hover { background-color: #414141; }
            .search-result span.plus a i { color: #fff !important; }
            .search-result span.border { display: block; width: 97%; margin: 0 15px; border-bottom: 1px dotted #ccc; }
        </style>
    </head>
    <body>
        <!--<div class="row" style="opacity: 1;">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12">
                        <ol class="breadcrumb">

                        </ol>
                        <h1>Resultados</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="main-box clearfix">
                            <header class="main-box-header clearfix">
                                <h2>4 resultados encontrados</h2>
                                <small class="gray">Tiempo de respuesta (1.86 segundos)</small>
                            </header>
                            <div class="main-box-body clearfix">                               

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="main-box clearfix profile-box-menu">
                            <div class="main-box-body clearfix">
                                <div class="profile-box-header green-bg   clearfix">

                                    <h2>IMPUTADOS</h2>

                                </div>
                                <div class="profile-box-content clearfix">                                                    
                                    <ul class="search-results">
                                        <li>
                                            <h3 class="title">
                                                <a href="../home/detail">
                                                    COA/FG/XX/PGU/2014/AA-3
                                                </a>
                                            </h3>
                                            <div class="link-title">
                                                Estatus: Iniciado
                                            </div>
                                            <div class="desc">
                                                Imputado: Carlos Navarrete del Bosque 
                                                <br/>
                                                Victima: Yocelin Sanchez
                                            </div>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>  
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="main-box clearfix profile-box-menu">
                            <div class="main-box-body clearfix">
                                <div class="profile-box-header  red-bg clearfix">

                                    <h2>DELITOS</h2>

                                </div>
                                <div class="profile-box-content clearfix">                                                    
                                    <ul class="search-results">
                                        <li>
                                            <h3 class="title">
                                                <a href="../home/detail">
                                                    COA/FG/XX/PGU/2014/AA-1
                                                </a>
                                            </h3>
                                            <div class="link-title">
                                                Estatus: Iniciado
                                            </div>
                                            <div class="desc">
                                                Imputado: Carlos Navarrete del Bosque 
                                                <br/>
                                                Victima: Yocelin Sanchez
                                            </div>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>  
                    </div>
                </div>                
                <div class="row">
                    <div class="col-lg-12">
                        <div class="main-box clearfix profile-box-menu">
                            <div class="main-box-body clearfix">
                                <div class="profile-box-header  emerald-bg clearfix">

                                    <h2>VICTIMAS</h2>

                                </div>
                                <div class="profile-box-content clearfix">                                                    
                                    <ul class="search-results">
                                        <li>
                                            <h3 class="title">
                                                <a href="../home/detail">
                                                    COA/FG/XX/PGU/2014/AA-2
                                                </a>
                                            </h3>
                                            <div class="link-title">
                                                Estatus: Iniciado
                                            </div>
                                            <div class="desc">
                                                Imputado: Carlos Navarrete del Bosque 
                                                <br/>
                                                Victima: Yocelin Sanchez
                                            </div>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>  
                    </div>
                </div>
                <div class="row" style="margin-bottom: 35px;">
                    <div class="col-lg-12">
                        <div class="main-box clearfix profile-box-menu">
                            <div class="main-box-body clearfix">
                                <div class="profile-box-header  purple-bg clearfix">

                                    <h2>AUDIENCIAS</h2>

                                </div>
                                <div class="profile-box-content clearfix">                                                    
                                    <ul class="search-results">
                                        <li>
                                            <h3 class="title">
                                                <a href="../home/detail">
                                                    COA/FG/XX/PGU/2014/AA-4
                                                </a>
                                            </h3>
                                            <div class="link-title">
                                                Estatus: Iniciado
                                            </div>
                                            <div class="desc">
                                                Imputado: Carlos Navarrete del Bosque 
                                                <br/>
                                                Victima: Yocelin Sanchez
                                            </div>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>  
                    </div>
                </div>                
            </div>
        </div>-->
        <div class="container">
            <hgroup class="mb20">
                        <h1>Resultados</h1>
                        <h2 class="lead"><strong class="text-danger">4</strong> resultados fueron encontrados para la búsqueda</h2>								
                </hgroup>

            <section class="col-xs-12 col-sm-6 col-md-12">
                        <article class="search-result row">
                                <div class="col-xs-12 col-sm-12 col-md-3">
                                        <img src="${resource(dir: 'centaurus/img/samples', file: 'imputado.jpg')}" width='250' height='140'/>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-2">
                                        <ul class="meta-search">
                                                <li><i class="glyphicon glyphicon-calendar"></i> <span>05/01/2015</span></li>
                                                <li><i class="glyphicon glyphicon-time"></i> <span>4:29 pm</span></li>
                                                <li><i class="glyphicon glyphicon-tags"></i> <span><strong class="text-danger">Imputados</strong></span></li>
                                        </ul>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-7 excerpet">
                                        <h3><a href="../home/detail" title="">COA/FG/XX/PGU/2014/AA-3</a></h3>
                                        <p>Estatus: Iniciado </br>Imputado: Carlos Navarrete del Bosque <br/>Victima: Yocelin Sanchez</p>
                                </div>
                                <span class="clearfix borda"></span>
                        </article>	
                        <article class="search-result row">
                                <div class="col-xs-12 col-sm-12 col-md-3">
                                        <img src="${resource(dir: 'centaurus/img/samples', file: 'delito.jpg')}" width='250' height='140'/>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-2">
                                        <ul class="meta-search">
                                                <li><i class="glyphicon glyphicon-calendar"></i> <span>10/02/2015</span></li>
                                                <li><i class="glyphicon glyphicon-time"></i> <span>6:08 pm</span></li>
                                                <li><i class="glyphicon glyphicon-tags"></i> <span><strong class="text-danger">Delitos</strong></span></li>
                                        </ul>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-7 excerpet">
                                        <h3><a href="../home/detail" title="">COA/FG/XX/PGU/2014/AA-1</a></h3>
                                        <p>Estatus: Iniciado </br>Imputado: Carlos Navarrete del Bosque <br/>Victima: Yocelin Sanchez</p>
                                </div>
                                <span class="clearfix borda"></span>
                        </article>
                        <article class="search-result row">
                                <div class="col-xs-12 col-sm-12 col-md-3">
                                        <img src="${resource(dir: 'centaurus/img/samples', file: 'victima.jpg')}" width='250' height='140'/>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-2">
                                        <ul class="meta-search">
                                                <li><i class="glyphicon glyphicon-calendar"></i> <span>11/02/2015</span></li>
                                                <li><i class="glyphicon glyphicon-time"></i> <span>6:15 am</span></li>
                                                <li><i class="glyphicon glyphicon-tags"></i> <span><strong class="text-danger">Victimas</strong></span></li>
                                        </ul>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-7 excerpet">
                                        <h3><a href="../home/detail" title="">COA/FG/XX/PGU/2014/AA-2</a></h3>
                                        <p>Estatus: Iniciado </br>Imputado: Carlos Navarrete del Bosque <br/>Victima: Yocelin Sanchez</p>
                                </div>
                                <span class="clearfix borda"></span>
                        </article>
                        <article class="search-result row">
                                <div class="col-xs-12 col-sm-12 col-md-3">
                                        <img src="${resource(dir: 'centaurus/img/samples', file: 'audiencia.jpg')}" width='250' height='140'/>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-2">
                                        <ul class="meta-search">
                                                <li><i class="glyphicon glyphicon-calendar"></i> <span>15/02/2015</span></li>
                                                <li><i class="glyphicon glyphicon-time"></i> <span>11:48 am</span></li>
                                                <li><i class="glyphicon glyphicon-tags"></i> <span><strong class="text-danger">Audiencias</strong></span></li>
                                        </ul>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-7 excerpet">
                                        <h3><a href="../home/detail" title="">COA/FG/XX/PGU/2014/AA-4</a></h3>
                                        <p>Estatus: Iniciado </br>Imputado: Carlos Navarrete del Bosque <br/>Victima: Yocelin Sanchez<br/><br/><br/><br/><br/><br/><br/></p>
                                </div>
                                <span class="clearfix borda"></span>
                        </article>
                </section>
        </div>
    </body>
</html>
