<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="layout" content="main"/>
    <title>Sample title</title>
  </head>
  <body>
          <div class="row" style="opacity: 1;">
              <div class="col-lg-12">
              <br/>
    <h1>Subir archivo</h1>
    <llm:uploadForm  controller="repository" action="saveFile">
    <div class="form-group">
    <label>Ubicacion del archivo</label>
      <input type="text" name="path" class="form-control" placeholder="/ruta/para/el/archivo"/>

    </div>
    <div class="form-group">
      <label>Archivo</label>
      <input type="file" data-filename-placement="inside"  title="Buscar" name="myFile" class="form-control" />
    </div>

    <input type="submit" class="btn btn-default" />
    <br/>
    </llm:uploadForm >
    </div>
    </div>
  </body>
</html>
