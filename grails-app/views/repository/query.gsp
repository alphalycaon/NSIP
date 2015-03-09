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
          <div class="row" style="opacity: 1;">
              <div class="col-lg-12">
              <br/>
    <h1>Ejecutar Query</h1>

    <g:form action="executeQuery" >
        <div class="form-group">
        <label>Query</label>
          <input type="text" name="path" class="form-control" placeholder="Select * from [nt:base]"/>

        </div>
    <input type="submit"  class="btn btn-default" />
  </g:form>
  </div>
  </div>
  </body>
</html>
