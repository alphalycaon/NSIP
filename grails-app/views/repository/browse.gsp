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
<h1>Explorador</h1>
    <table id="example-table" class="table table-striped table-bordered table-hover table-green dataTable" aria-describedby="example-table_info">
      <thead>
        <tr>
          <th>
            Nombre
          </th>
          <th>
            Propiedades
          </th>
          <th>
            Mime
          </th>
          <th>
            Version
          </th>
        </tr>
      </thead>
      <tbody>
      <g:each in="${items}" status="i" var="item">
        <tr>
        <g:if test="${item.mime.equals('folder')}">
          <td><a href="${request.contextPath}/repository/browse?ubicacion=${item.ruta}">${item.nombre}</a></td>
          <td></td>
        </g:if> 
        <g:else>
          <td><a href="${request.contextPath}/repository/document?version=${item.version}&ubicacion=${item.ruta}">${item.nombre}</a></td>
          <td>
          <g:each in="${item.propiedades}" var="prop">
            <g:if test="${prop.value instanceof java.util.GregorianCalendar}">
              ${prop.key}:<g:formatDate date="${prop.value}"/>
            </g:if>
            <g:else>
              ${prop.key}:${prop.value}
            </g:else>
            
            <br/>
          </g:each>
          </td>
        </g:else>
        <td>${item.mime}</td>
        <td>${item.version}</td>
        </tr>
      </g:each>  
      <tr>
        <td colspan="4"><a href="${request.contextPath}/repository/browse?ubicacion=${padre}">Subir</a></td>
      </tr>
    </tbody>
  </table>
  </div>
  </div>
</body>
</html>
