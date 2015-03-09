<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sample title</title>
        <meta name="layout" content="main"/>
    </head>
    <body>
        <br/>
        <h1 style="padding: 0px 25px 25px; opacity: 1;">Agregar archivos al expediente</h1>
        
    <doc:explorerAndUpload numeroExpediente="${expediente.numeroExpediente}"/>
    <div class="row">
        <div class="col-lg-12" style="padding: 0px 25px 25px;">
            <g:link controller="home" action="index" class="btn btn-primary btn-lg">
                TERMINAR
            </g:link>

        </div>
    </div>
</body>
</html>
