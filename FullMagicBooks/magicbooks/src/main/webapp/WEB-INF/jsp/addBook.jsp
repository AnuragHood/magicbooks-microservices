<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
           prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <title>magicBooks</title>
    <base href="/">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="cache-control" content="max-age=0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magicbooks.min.css"
        media="screen,projection" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magicbooksCommon.css"
        media="screen,projection" />

    <!--Let browser know web site is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
        <br /><br />
        <br />
        <main>
            <div class="row">
                <form:form modelAttribute="bookDao" action="${pageContext.request.contextPath}/home/magicbooks/addOne"
                    method="post" class="col s12" enctype="multipart/form-data">
                    <div class="row">
                        <div class="input-field col s6">
                            <form:input path="name" placeholder="Book Name" id="bookName" type="text" class="validate"
                                required="true" />
                            <form:input path="id" type="hidden" />
                            <label for="name">Book Name</label>
                            <span class="helper-text" data-error="Book Name  is required." data-success=""></span>
                        </div>
                        <div class="input-field col s6">
                            <form:select path="category" class="validate icons" required="true">
                                <option value="">Choose Book Category</option>
                                <form:options items="${categories}" />
                            </form:select>
                            <label>Book Category</label>
                            <span class="helper-text" data-error="Book Category is required." data-success=""></span>
                        </div>

                    </div>

                    <div class="row">
                        <div class="input-field col s3">
                            <form:input path="author" placeholder="Author" id="first_name" type="text" class="validate"
                                required="true" />
                            <label for="author">Author</label>
                            <span class="helper-text" data-error="Author Name  is required." data-success=""></span>
                        </div>
                        <div class="input-field col s3">
                            <form:input path="quantity" placeholder="Quantity" type="text" class="validate"
                                required="true" />
                            <label for="quantity">Book Quantity</label>
                            <span class="helper-text" data-error="Quantity is required." data-success=""></span>

                        </div>
                        <div class="input-field col s6">
                            <form:input path="publishingDate" placeholder="Publishing Date" type="text"
                                class="datepicker" id="publishingDate" />
                            <label for="publishingDate">Publishing Date</label>
                        </div>

                    </div>
                    <div class="row">
                        <div class="input-field col s3">
                            <form:input path="bookMrp" placeholder="Book MRP" id="bookPriceText" type="text"
                                class="validate" required="true" />
                            <label for="bookMRP">Book MRP</label>
                            <span class="helper-text" data-error="Prices are required." data-success=""></span>
                        </div>
                        <div class="input-field col s3">
                            <form:input path="bookSellingPrice" placeholder="Selling Price" id="bookPriceText"
                                type="text" class="validate" required="true" />
                            <label for="bookSellingPrice">Selling Price</label>
                            <span class="helper-text" data-error="Prices are required." data-success=""></span>
                        </div>
                        <div class="file-field input-field col s6">
                            <div class="btn">
                                <span>Images</span>
                                <form:input path="bulkFile" type="file" multiple="multiple" />
                            </div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text"
                                    placeholder="Upload one or more pictures" />
                            </div>
                        </div>
                    </div>
                    <br /><br />
                    <div class="center-align">

                        <form:button class="btn-small  waves-effect waves-dark" type="submit" name="action">
                            ${bookDao.bookButton}
                            <i class="material-icons right">send</i>
                        </form:button>
                        <a class="btn-small red waves-effect waves-dark" type="reset" name="action"
                            href="${pageContext.request.contextPath}/home/addOne">
                            CLEAR
                            <i class="material-icons right">cancel</i>
                        </a>

                    </div>
                </form:form>
            </div>
        </main>
        <br /><br /><br />
        <footer class="page-footer">
            <%@ include file="/WEB-INF/jsp/shared/footer.jsp" %>
        </footer>
    </div>
    <!--JavaScript at end of body for optimized loading-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/magicbooks.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/magicbooksCommon.js"></script>
</body>

</html>