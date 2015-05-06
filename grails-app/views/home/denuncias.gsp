<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>        

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


        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file:'dataTables.fixedHeader.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file:'dataTables.tableTools.css')}" />







        <meta name="layout" content="main"/>
        <title>Denuncias o Querellas</title>
    </head>
    <body>

        <div class="row">
            <div class="col-lg-12">
                <div class="main-box clearfix">
                    <header class="main-box-header clearfix">
                        <h2>Denuncias o Querellas.</h2>


                        <div class="btn-group  pull-left">

                            <g:link controller="home" action="denuncias" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" data-original-title="Actualizar">
                                <i class="fa fa-refresh"></i>
                            </g:link>

                            <shiro:hasRole name="CES">
                                <button class="btn btn-primary" type="button" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Notificar a unidad de atencion a victimas del delito">
                                    <i class="fa fa-send"></i>
                                </button>                                            
                                <button type="button" class="btn btn-primary pull-right" style=" margin-left: 3px" data-toggle="modal" data-target="#myModalCompartir" title="Compartir Expediente">
                                    <i class="fa fa-share-alt"></i>
                                </button>
                            </shiro:hasRole>
                            <shiro:hasRole name="Ministerio">
                                <button class="btn btn-primary" type="button" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Notificar a unidad de atencion a victimas del delito">
                                    <i class="fa fa-send"></i>
                                </button>
                                <button class="btn btn-primary" type="button" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Notificar a unidad justicia alternativa restaurativa">
                                    <i class="fa fa-life-bouy"></i>
                                </button>
                                <g:link controller="home" action="moverDenuncia" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" data-original-title="Crear documento relacionado">
                                    <i class="glyphicon glyphicon-folder-open"></i>
                                </g:link>
                                <button type="button" class="btn btn-primary pull-right" style=" margin-left: 3px" data-toggle="modal" data-target="#myModalCompartir"  title="Compartir Expediente"> 
                                    <i class="fa fa-share-alt"></i>
                                </button> 
                            </shiro:hasRole>
                            <button class="btn btn-primary" type="button" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Borrar">
                                <i class="fa fa-trash-o"></i>
                            </button>
                            <shiro:hasRole name="Ministerio">
                                <g:link controller="ministerio" action="denuncia" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" data-original-title="Generar Denuncia/Querella">
                                    <i class=" glyphicon glyphicon-user"></i> 
                                </g:link>
                            </shiro:hasRole>
                        </div>
                    </header>
                    <div class="main-box-body clearfix">
                        <div class="table-responsive">
                            <table id="table-example" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th></th>
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

                                                <input type="checkbox" name="checkbox${expediente.id}" id="checkbox${expediente.id}">
                                                <label for="checkbox${expediente.id}"></label>
                                            </td>
                                            <td>
                                               <div class="star">
                                                <a class="starred"></a>
                                                </div>
                                            </td>
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






        
<!-- -->                                                        
<div class="modal fade" id="myModalCompartir" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <g:form name="formCompartir">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Compartir Documento</h4>
                </div>
                <div class="modal-body">
                    <form role="form">
                        <div class="form-group form-group-select2">
                            <label>Compartir a:</label>
                            <select style="width:570px" name="listCompartir" id="listCompartir" multiple >
                                <g:each in="${usuarios}" var="usuario" status="i">
                                    <option value="${usuario.username}">${usuario.institucion} - ${usuario.puesto} - ${usuario.nombre}</option>
                                </g:each>
                            </select>
                        </div>
                    </form>      
                </div>
                <div class="modal-footer">                                                                           
                    <textarea class="form-control" rows="3" name="commentCompartir" id="commentCompartir" placeholder="Mensaje (Opcional)"></textarea>
                    </br>
                     <!--<a data-dismiss="modal" class="btn btn-primary" id="notificacionCompartir">                                            
                         <span  style="padding-right: 10px;"></span> Aceptar
                     </a> -->  
                    <g:actionSubmit id="btnModalCompartir" class="btn btn-primary" value="Aceptar" action="compartirVariosExp" controller="home"/>
                    <a data-dismiss="modal" class="btn btn-danger">                                            
                        <span style="padding-right: 10px;"></span> Cancelar
                    </a>
                </div>
            </div>
        </div>
    </g:form>
</div>
<!--  -->



 <!--
 <script src="${resource(dir: 'centaurus/js', file: 'select2.min.js')}"></script>

 <script src="${resource(dir: 'centaurus/js', file: 'modernizr.custom.js')}"></script>
 <script src="${resource(dir: 'centaurus/js', file: 'snap.svg-min.js')}"></script>
 <script src="${resource(dir: 'centaurus/js', file: 'classie.js')}"></script>
 <script src="${resource(dir: 'centaurus/js', file: 'scripts.js')}"></script>
 <script src="${resource(dir: 'centaurus/js', file: 'pace.min.js')}"></script>
 <script src="${resource(dir: 'centaurus/js', file: 'notificationFx.js')}"></script>
-->



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













</body>
</html>
