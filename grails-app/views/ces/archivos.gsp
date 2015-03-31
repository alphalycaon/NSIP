<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Archivos del IPH</title>
        <meta name="layout" content="main"/>
    </head>
    <body>
        <div id="email-detail" class="email-detail-nano has-scrollbar" style="min-height: 750px;">
            <div class="email-detail-nano-content" tabindex="0" style="right: -16px;">
                <br/>
                <h1 style="padding: 0px 25px 25px; opacity: 1;">Agregar archivos al expediente</h1>

                <doc:explorerAndUpload numeroExpediente="${expedienteIph.numeroIph}"/>
                <div class="row">
                    <div class="col-lg-12" style="padding: 0px 25px 25px;">
                        <g:link controller="home" action="index_Iph" class="btn btn-primary btn-lg">
                            TERMINAR
                        </g:link>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
