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

        <h1>Perfil del Usuario</h1>
        <div class="row" id="user-profile">
            <div class="col-lg-3 col-md-4 col-sm-4">
                <div class="main-box clearfix">
                    <header class="main-box-header clearfix">
                        <h2>${usuario.apPaterno} ${usuario.apMaterno} ${usuario.nombre}</h2>
                    </header>
                    <div class="main-box-body clearfix">
                        <div class="profile-status">
                            <i class="fa fa-circle"></i> En linea
                        </div>
                        <img alt="" src="${resource(dir: 'centaurus/img/samples/', file: '')}<shiro:principal/>.jpg" class="profile-img img-responsive center-block"/>

                        
                        <div class="profile-label">
                            <span class="label label-danger">Administrador</span>
                        </div>
                        <!--div class="profile-stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <span>Super User</span>
                        </div-->
                        <div>&nbsp;</div>
                        <div class="profile-since">
                            Miembro desde: 
                            <g:formatDate format="MMM/yyyy" date="${usuario.fechaCreacion}"/>
                        </div>
                        <div class="profile-details">
                            <ul class="fa-ul">
                                <li><i class="fa-li fa fa-tasks"></i>Institucion: <span>${usuario.institucion}</span></li>
                                <li><i class="fa-li fa fa-tasks"></i>Puesto: <span>${usuario.puesto}</span></li>
                            </ul>
                        </div>
                        <!--div class="profile-message-btn center-block text-center">
                            <a href="#" class="btn btn-success">
                                <i class="fa fa-envelope"></i>
                                Send message
                            </a>
                        </div-->
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
