<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>        



        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file:'dataTables.fixedHeader.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs', file:'dataTables.tableTools.css')}" />







        <meta name="layout" content="main"/>
        <title>Bandeja de Entrada</title>
    </head>
    <body>

        <div class="row">
            <div class="col-lg-12">
                <div class="main-box clearfix">
                    <header class="main-box-header clearfix">
                        <h2><g:if test="${tc == 'EE'}">
                                Bandeja de Entrada
                            </g:if>
                            <g:elseif test="${tc == 'II'}">
                                Carpeta de Indicios de Invetsigación
                            </g:elseif>
                            <g:elseif test="${tc == 'CR'}">
                                Carpeta de Corroboración
                            </g:elseif>
                            <g:elseif test="${tc == 'DQ'}">
                                Denunucias o Querellas
                            </g:elseif>
                            <g:elseif test="${tc == 'IN'}">
                                Investigaciones
                            </g:elseif>
                            <g:elseif test="${tc == 'AT'}">
                                Archivos Temporales
                            </g:elseif>    
                            <g:elseif test="${tc == 'AD'}">
                                Archivos Definitivos
                            </g:elseif>
                            <g:elseif test="${tc == 'AJ'}">
                                Archivos Judicializados
                            </g:elseif>
                            <g:elseif test="${tc == 'CC'}">
                                Cuadernillo de Causa
                            </g:elseif>
                            <g:elseif test="${tc == 'CA'}">
                                Causa
                            </g:elseif>
                            <g:elseif test="${tc == 'PP'}">
                                Acción Penal por Particular
                            </g:elseif>
                            <g:elseif test="${tc == 'CO'}">
                                Causa Concluida
                            </g:elseif>
                            <g:elseif test="${tc == 'CI'}">
                                Control Interno
                            </g:elseif>
                            <g:elseif test="${tc == 'CS'}">
                                Casos
                            </g:elseif>
                            <g:elseif test="${tc == 'CL'}">
                                Concluidos
                            </g:elseif>
                            <g:else>
                                Hello unknown person!
                            </g:else>
                        </h2>


                        <div class="btn-group  pull-left">

                            <g:link controller="home" action="denuncias" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" data-original-title="Actualizar">
                                <i class="fa fa-arrow-circle-o-left"></i>
                            </g:link>

                            <shiro:hasRole name="CES">
                                <button class="btn btn-primary" type="button" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Notificar a unidad de atencion a victimas del delito">
                                    <i class="fa fa-slack"></i>
                                </button>                                            
                                <button type="button" class="btn btn-primary pull-right" style=" margin-left: 3px" data-toggle="modal" data-target="#myModalCompartir" title="Compartir Expediente">
                                    <i class="fa fa-circle-o"></i>
                                </button>
                            </shiro:hasRole>
                            <shiro:hasRole name="Ministerio">
                                <button class="btn btn-primary" type="button" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Notificar a unidad de atencion a victimas del delito">
                                    <i class="fa fa-recycle"></i>
                                </button>
                                <button class="btn btn-primary" type="button" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Notificar a unidad justicia alternativa restaurativa">
                                    <i class="fa fa-dot-circle-o"></i>
                                </button>
                                <g:link controller="home" action="moverDenuncia" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" data-original-title="Crear documento relacionado">
                                    <i class="glyphicon glyphicon-folder-open"></i>
                                </g:link>
                                <button type="button" class="btn btn-primary pull-right" style=" margin-left: 3px" data-toggle="modal" data-target="#myModalCompartir"  title="Compartir Expediente"> 
                                    <i class="fa fa-legal"></i>
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


                                    <g:each in="${expedientesCompartidos}" var="expediente" status="i">
                                        <tr>
                                            <td>

                                                <input type="checkbox" name="checkbox${expediente.id}" id="checkbox${expediente.id}">
                                                <label for="checkbox${expediente.id}"></label>
                                            </td>
                                            <td>
                                                <div class="star">
                                                    <a></a>
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



        <div class="row" style="opacity: 1;">
            <div class="col-lg-12">
                <div id="email-box" class="clearfix">


                    <div class="row">
                        <div class="col-lg-12">                           
                            <div id="email-content" class="email-content-nano has-scrollbar" style="min-height: 650px;">
                                <div class="email-content-nano-content" tabindex="0" style="right: -16px;">
                                    <ul id="email-list">



                                        <shiro:hasRole name="Juez">
                                            <g:each in="${expedientesFiltradosJuez}" var="expediente" status="i">
                                                <li class="unread" data-href="${request.contextPath}/home/detail" >
                                                    <div class="chbox">
                                                        <div class="checkbox-nice">
                                                            <input type="checkbox" name="checkbox${expediente.id}" id="checkbox${expediente.id}">
                                                            <label for="checkbox${expediente.id}"></label>
                                                        </div>
                                                    </div>
                                                    <div class="star">
                                                        <a></a>
                                                    </div>
                                                    <g:link action="detail"  id="${expediente.id}" style="color: #000000; text-decoration: none;">
                                                        <div class="name">
                                                            ${expediente.numeroExpediente}
                                                        </div>
                                                        <div class="message">
                                                            <span class="label label-danger">${expediente.delito.clasificacionDelito.modalidad}</span>
                                                            <span class="subject">${expediente.delito.imputado.nombre}</span>
                                                            <span class="body">${expediente.delito.clasificacionDelito.nombre}</span>
                                                        </div>
                                                        <div class="meta-info">
                                                            <a href="#" class="attachment">
                                                                <i class="fa fa-paperclip"></i>
                                                            </a>
                                                            <span><g:formatDate format="dd/MM/yyyy HH:mm" date="${expediente.dateCreated}"/></span>
                                                        </div>
                                                    </li></g:link>                                                
                                            </g:each>                                        
                                        </shiro:hasRole> 
                                        <shiro:hasRole name="Defensor">
                                            <g:each in="${expedientesFiltrados}" var="expediente" status="i">
                                                <li class="unread" data-href="${request.contextPath}/home/detail" >
                                                    <div class="chbox">
                                                        <div class="checkbox-nice">
                                                            <input type="checkbox" name="checkbox${expediente.id}" id="checkbox${expediente.id}">
                                                            <label for="checkbox${expediente.id}"></label>
                                                        </div>
                                                    </div>
                                                    <div class="star">
                                                        <a></a>
                                                    </div>
                                                    <g:link action="detail"  id="${expediente.id}" style="color: #000000; text-decoration: none;">
                                                        <div class="name">
                                                            ${expediente.numeroExpediente}
                                                        </div>
                                                        <div class="message">
                                                            <span class="label label-danger">${expediente.delito.clasificacionDelito.modalidad}</span>
                                                            <span class="subject">${expediente.delito.imputado.nombre}</span>
                                                            <span class="body">${expediente.delito.clasificacionDelito.nombre}</span>
                                                        </div>
                                                        <div class="meta-info">
                                                            <a href="#" class="attachment">
                                                                <i class="fa fa-paperclip"></i>
                                                            </a>
                                                            <span><g:formatDate format="dd/MM/yyyy HH:mm" date="${expediente.dateCreated}"/></span>
                                                        </div>
                                                    </li></g:link>                                                
                                            </g:each>                                        
                                        </shiro:hasRole>
                                         
                                            <g:each in="${expedientesFiltrados}" var="expediente" status="i">
                                                <li class="unread" data-href="${request.contextPath}/home/detail" >
                                                    <div class="chbox">
                                                        <div class="checkbox-nice">
                                                            <input type="checkbox" name="checkbox${expediente.id}" id="checkbox${expediente.id}">
                                                            <label for="checkbox${expediente.id}"></label>
                                                        </div>
                                                    </div>
                                                    <div class="star">
                                                        <a></a>
                                                    </div>
                                                    <g:link action="detail"  id="${expediente.id}" style="color: #000000; text-decoration: none;">
                                                        <div class="name">
                                                            ${expediente.numeroExpediente}
                                                        </div>
                                                        <div class="message">
                                                            <span class="label label-danger">${expediente.delito.clasificacionDelito.modalidad}</span>
                                                            <span class="subject">${expediente.delito.imputado.nombre}</span>
                                                            <span class="body">${expediente.delito.clasificacionDelito.nombre}</span>
                                                        </div>
                                                        <div class="meta-info">
                                                            <a href="#" class="attachment">
                                                                <i class="fa fa-paperclip"></i>
                                                            </a>
                                                            <span><g:formatDate format="dd/MM/yyyy HH:mm" date="${expediente.dateCreated}"/></span>
                                                        </div>
                                                    </li></g:link>                                                
                                            </g:each>     
                                    </ul>
                                </div>
                                <div class="nano-pane"><div class="nano-slider" style="height: 104px; transform: translate(0px, 0px);"></div></div></div>
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














    </body>
</html>