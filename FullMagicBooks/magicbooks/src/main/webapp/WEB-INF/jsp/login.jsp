<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <title>magicBooks</title>
    <base href="/">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="cache-control" content="max-age=0"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT"/>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magicbooks.min.css"
          media="screen,projection"/>

    <!--Let browser know web site is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8=" crossorigin="anonymous"></script>
    <style>
        html,
        body,
        .login-box {
            height: 100%;
        }
    </style>
    <script>
        $(document).ready(function () {
        $("#reset").click();})
    </script>
</head>

<body class="blue lighten-5">
<div class="container z-depth-5" id="container">
    <div class="valign-wrapper row login-box">
        <div class="col card hoverable s10 pull-s1 m6 pull-m3 l4 pull-l4">
            <form:form method="post" modelAttribute="loginDao"
                       action="${pageContext.request.contextPath}/login"  class="col s12">
                <div class="card-content">
                    <span class="card-title">Welcome to MagicBooks</span>
                    <div class="row">
                        <div class="input-field col s12">
                            <label for="email">Email address</label>
                            <form:input path="email" type="email" class="validate" name="email" id="email"/>
                        </div>
                        <div class="input-field col s12">
                            <label for="password">Password </label>
                            <form:input path="password" type="password" class="validate" name="password" id="password"/>
                        </div>
                    </div>
                </div>
                <div class="card-action center-align">
                    <button class="btn-small blue waves-effect waves-dark" type="submit" name="action">LOGIN
                    </button>
                    <button class="btn-small red waves-effect waves-dark" type="reset" name="action" id="reset">RESET
                    </button>
                    <br/><br/><br/>
                    <button class="btn-small waves-effect waves-light" type="submit" name="action">SIGNUP
                        <i class="material-icons right">send</i>
                    </button>
                </div>
            </form:form>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#reset").click();
        $("#reset").on("click", function () {
            $('label').removeClass('active');
        });
    })
</script>
<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/magicbooks.min.js"></script>
</body>

</html>