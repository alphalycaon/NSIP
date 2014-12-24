<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="layout" content="main"/>
        <title>Generar denuncia</title>
    </head>
    <body>
        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12">
                        <ol class="breadcrumb">
                            <li><a href="#">Home</a></li>
                            <li class="active"><span>Denuncia</span></li>
                        </ol>
                        <h1>Generar Denuncia</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="main-box clearfix" style="min-height: 820px;">
                            <header class="main-box-header clearfix">
                                <h2>Captura los datos en el orden presentado</h2>
                            </header>
                            <div class="main-box-body clearfix">

                                <div id="myWizard" class="wizard">
                                    <div class="wizard-inner">
                                        <ul class="steps">
                                            <li data-target="#step1" class="active"><span class="badge badge-primary">1</span>Delito<span class="chevron"></span></li>
                                            <li data-target="#step2"><span class="badge">2</span>Victima<span class="chevron"></span></li>
                                            <li data-target="#step3"><span class="badge">3</span>Presunto Responsable<span class="chevron"></span></li>
                                            <li data-target="#step4"><span class="badge">3</span>Archivos<span class="chevron"></span></li>
                                        </ul>
                                        <div class="actions">
                                            <button type="button" class="btn btn-default btn-mini btn-prev"></i>Anterior</button>
                                            <button type="button" class="btn btn-success btn-mini btn-next" data-last="Terminar" onclick="if($(this).html().indexOf('Terminar')==0){$('#denuncia').submit();}">Siguiente</i></button>
                                        </div>
                                    </div>
                                    <g:form controller="ministerio" action="guardarDenuncia" name="denuncia">
                                        <div class="step-content">
                                            <div class="step-pane active" id="step1">
                                                <br/>
                                                <h4>1.- Datos del delito</h4>
                                                <div class="form-group">
                                                    <label for="delito">Nombre</label>
                                                    <input type="text" class="form-control" name="clasificacionDelito.nombre" placeholder="Nombre del delito">
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Modalidad </label>
                                                    <input type="text" class="form-control" name="clasificacionDelito.modalidad" placeholder="Modalidad del delito">
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Modus</label>
                                                    <input type="text" class="form-control" name="clasificacionDelito.modus" placeholder="Modus del delito">
                                                </div>                                                
                                            </div>
                                            <div class="step-pane" id="step2">
                                                <br/>
                                                <h4>2.- Datos de la victima</h4>
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Nombre </label>
                                                    <input type="text" class="form-control" name="victima.nombre" placeholder="Nombre completo de la victima">
                                                </div>                                                
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Genero </label>
                                                    <input type="text" class="form-control" name="victima.genero" placeholder="Genero de la victima">
                                                </div>                                                
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Edad</label>
                                                    <input type="text" class="form-control" name="victima.edad" placeholder="Edad de la victima">
                                                </div>                                                
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Estado Civil</label>
                                                    <input type="text" class="form-control" name="victima.estadoCivil" placeholder="Estado civil de la victima">
                                                </div>                                                
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Escolaridad</label>
                                                    <input type="text" class="form-control" name="victima.escolaridad" placeholder="Escolaridad de la victima">
                                                </div>                                                

                                            </div>
                                            <div class="step-pane" id="step3">
                                                <br/>
                                                <h4>3.- Datos del presunto responsable</h4>
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Nombre </label>
                                                    <input type="text" class="form-control" name="imputado.nombre" placeholder="Nombre completo del presunto responsable">
                                                </div>                                                
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Genero </label>
                                                    <input type="text" class="form-control" name="imputado.genero" placeholder="Genero del presunto responsable">
                                                </div>                                                
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Edad</label>
                                                    <input type="text" class="form-control" name="imputado.edad" placeholder="Edad del presunto responsable">
                                                </div>                                                
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Estado Civil</label>
                                                    <input type="text" class="form-control" name="imputado.estadoCivil" placeholder="Estado civil del presunto responsable">
                                                </div>                                                
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Escolaridad</label>
                                                    <input type="text" class="form-control" name="imputado.escolaridad" placeholder="Escolaridad del presunto responsable">
                                                </div>                                                 
                                            </div>
                                        </g:form>

                                        <div class="step-pane" id="step4">
                                            <br/>
                                            <div class="panel-group accordion" id="accordion">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                                Media Filiacion
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="collapseOne" class="panel-collapse collapse in">
                                                        <div class="panel-body">
                                                            <g:uploadForm action="subirArchivo" name="fileUpload" class="dropzone" name="subirArchivo" id ="mediaFilicacion">
                                                                <div class="fallback">
                                                                    <input type="file" name="file" multiple="" />
                                                                </div>
                                                            </g:uploadForm>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                                Documentos Probatorios
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="collapseTwo" class="panel-collapse collapse" style="height: 1px;">
                                                        <div class="panel-body">
                                                            <g:uploadForm action="subirArchivo" name="fileUpload" class="dropzone" name="subirArchivo" id ="documentoProbatorios">
                                                                <div class="fallback">
                                                                    <input type="file" name="file" multiple="" />
                                                                </div>
                                                            </g:uploadForm>  
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                                                Fotografias de los Hechos
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="collapseThree" class="panel-collapse collapse" style="height: 1px;">
                                                        <div class="panel-body">
                                                            <g:uploadForm action="subirArchivo" name="fileUpload" class="dropzone" name="subirArchivo" id ="fotografiasHechos">
                                                                <div class="fallback">
                                                                    <input type="file" name="file" multiple="" />
                                                                </div>
                                                            </g:uploadForm> 
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>                                                                                        

                                        </div>

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
