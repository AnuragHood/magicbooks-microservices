<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c"
          uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring"
          uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form"
          uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
           prefix="fn" %>
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
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magicbooks.min.css"
          media="screen,projection"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magicbooksCommon.css"
          media="screen,projection"/>

    <!--Let browser know web site is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
</head>

<body class="blue lighten-5">
<div class="container  z-depth-5" id="container">
    <header>
        <%@ include file="/WEB-INF/jsp/shared/navBar.jsp" %>
    </header>
    <c:if test="${message != null}">
        <ul class="collection">
            <li class="collection-item #a5d6a7 green lighten-3">
                    ${message}
            </li>
        </ul>
    </c:if>
    <main>
        <ul class="collection">
            <li class="collection-item">
                Download the format,edit it with your data and upload.
            </li>
            <li class="collection-item">
                <a class="btn-small waves-effect waves-light"
                   href="${pageContext.request.contextPath}/home/download">
                    DOWNLOAD TEMPLATE
                    <i class="material-icons right">cloud_download</i>
                </a>
            </li>
        </ul>

        <br/>
        <div class="row">
            <form:form modelAttribute="bulkUpload"
                       action="${pageContext.request.contextPath}/home/magicbooks/bulkUpload" method="post"
                       class="col s12">
                <div class="row">
                    <div class="file-field input-field col s6">
                        <div class="btn-small blue waves-effect waves-dark">
                            <span>CSV-File</span>
                            <form:input path="bulkFile" type="file"/>
                        </div>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>

                    <div class="input-field col s6">
                        <button class="btn-small teal waves-effect waves-dark" type="submit" name="action">
                            UPLOAD
                            <i class="material-icons right">send</i>
                        </button>
                        <button class="btn-small red waves-effect waves-dark" type="reset" name="action">
                            CLEAR
                            <i class="material-icons right">cancel</i>
                        </button>
                    </div>
                </div>
            </form:form>
        </div>
    </main>
    <footer class="page-footer">
        <%@ include file="/WEB-INF/jsp/shared/footer.jsp" %>
    </footer>
</div>
<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/magicbooks.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/magicbooksCommon.js"></script>
</body>

</html>