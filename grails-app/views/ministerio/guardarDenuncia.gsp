<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generar denuncia</title>
        <meta name="layout" content="main"/>
    </head>
    <body>
        <div class="row">
            <div class="col-lg-12">
                <div id="email-detail" class="email-detail-nano has-scrollbar" style="min-height: 650px;">
                    <div class="email-detail-nano-content" tabindex="0" style="right: -16px;">
                        <div id="email-detail-inner">
                            <div class="row">
                                <div class="col-lg-12">
                                    <ol class="breadcrumb">
                                        <li><a href="${request.contextPath}">Home</a></li>
                                        <li class="active"><span>Denuncia</span></li>
                                    </ol>
                                    <h1>Denunicia guardada: ${expediente.numeroExpediente}</h1>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="main-box clearfix" style="min-height: 820px;">
                                        <header class="main-box-header clearfix">
                                            <h2>La denuncia fue generada y se le asigno el numero ${expediente.numeroExpediente} creada el ${expediente.dateCreated}</h2>
                                        </header>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
