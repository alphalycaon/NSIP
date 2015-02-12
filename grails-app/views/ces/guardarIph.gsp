<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generar Iph</title>
        <meta name="layout" content="main"/>
    </head>
    <body>
        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12">
                        <ol class="breadcrumb">
                            <li><a href="${request.contextPath}">Home</a></li>
                            <li class="active"><span>Iph</span></li>
                        </ol>
                        <h1>Iph guardado: ${iph.numeroIph}</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="main-box clearfix" style="min-height: 820px;">
                            <header class="main-box-header clearfix">
                                <h2>El iph fue generado y se le asigno el numero ${iph.numeroIph} creada el ${iph.dateCreated}</h2>
                            </header>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
