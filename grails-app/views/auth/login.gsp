<!DOCTYPE html>
<html>

    <!-- Mirrored from centaurus.adbee.technology/v5/login-full.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 22 Dec 2014 17:44:46 GMT -->
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <title>Centaurus - Bootstrap Admin Template</title>

        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/bootstrap/', file: 'bootstrap.min.css')}"/>

        <script src="${resource(dir: 'centaurus/js', file: 'demo-rtl.js')}/"></script>


        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs/', file: 'font-awesome.css')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/libs/', file: 'nanoscroller.css')}"/>

        <link rel="stylesheet" type="text/css" href="${resource(dir: 'centaurus/css/compiled', file: 'theme_styles.css')}"/>


        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,600,700,300|Titillium+Web:200,300,400' rel='stylesheet' type='text/css'>

        <link type="image/x-icon" href="favicon.png" rel="shortcut icon"/>
        <!--[if lt IE 9]>
                        <script src="js/html5shiv.js"></script>
                        <script src="js/respond.min.js"></script>
                <![endif]-->        
    </head>
    <body id="login-page-full">
        <div id="login-full-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div id="login-box">
                            <div id="login-box-holder">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <header id="login-header">
                                            <div style="background-color: #bbbbbb;" >
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="${resource(dir: 'centaurus/img', file: 'logo3.png')}" height="120" alt=""/>
                                            </div>
                                        </header>
                                        <div id="login-box-inner">
                                            <g:if test="${flash.message}">
                                                <div class="message">${flash.message}</div>
                                            </g:if>
                                            <g:form action="signIn">
                                                <input type="hidden" name="targetUri" value="${targetUri}" />
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                    <input type="text" name="username" value="${username}" class="form-control" placeholder="Usuario"/>
                                                </div>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                                    <input type="password" class="form-control" name="password" value="" placeholder="Contraseña"/>
                                                </div>
                                                <div id="remember-me-wrapper">
                                                    <div class="row">
                                                        <div class="col-xs-6">
                                                            <div class="checkbox-nice">
                                                                <g:checkBox name="rememberMe" value="${rememberMe}" />
                                                                <label for="remember-me">
                                                                    <g:message code="login.remember" default="Recordarme"/>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <a href="forgot-password-full.html" id="login-forget-link" class="col-xs-6">
                                                            <g:message code="login.forgot" default="Olvidaste tu contraseña?"/>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <button type="submit" class="btn btn-success col-xs-12"><g:message code="login.login" default="Entrar"/></button>
                                                    </div>
                                                </div>

                                            </g:form>
                                        </div>                                        
                                        <div class="panel-footer center-block">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Powered by
                                            <div class="row">
                                                <div class="center-block" style="background:#bbbbbb;">				
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="30%" width="30%" src="${resource(dir: 'centaurus/img', file: 'logo_luc.png')}" alt="">&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp; 
                                                    <img height="20%" width="20%" src="${resource(dir: 'centaurus/img', file: 'logo_tres_i_x_ti.png')}" alt="">
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

    <script src="${resource(dir: 'centaurus/js', file: 'demo-skin-changer.js')}/"></script>  
    <script src="${resource(dir: 'centaurus/js', file: 'jquery.js')}"></script>
    <script src="${resource(dir: 'centaurus/js', file: 'bootstrap.js')}"></script>
    <script src="${resource(dir: 'centaurus/js', file: 'jquery.nanoscroller.min.js')}"></script>
    <script src="${resource(dir: 'centaurus/js', file: 'demo.js')}"></script>  


    <script src="${resource(dir: 'centaurus/js', file: 'scripts.js')}"></script>

    </body>

    <!-- Mirrored from centaurus.adbee.technology/v5/login-full.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 22 Dec 2014 17:44:46 GMT -->
</html>