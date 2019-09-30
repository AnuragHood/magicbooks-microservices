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
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magicbooksCommon.css"
          media="screen,projection"/>

    <!--Let browser know web site is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

</head>

<body class="blue lighten-5">
<div class="container z-depth-5" id="container">
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
        <c:if test="${fn:length(bookList) > 0}">
            <table class="highlight centered responsive-table">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Author</th>
                    <th>MRP Price</th>
                    <th>Selling Price</th>
                    <th>Publishing Date</th>
                    <th>Available in Stock</th>
                    <th>Update Books</th>
                    <th>Delete Books</th>
                </tr>
                </thead>

                <tbody style="font-size: 0.9em;font-weight: lighter">
                <c:forEach items="${bookList}" var="item">
                    <tr>
                        <td>${fn:escapeXml(item.name)}</td>
                        <td>${fn:escapeXml(item.category)}</td>
                        <td>${fn:escapeXml(item.author)}</td>
                        <td>${fn:escapeXml(item.bookMrp)}Rs.</td>
                        <td>${fn:escapeXml(item.bookSellingPrice)}Rs.</td>
                        <td>${fn:escapeXml(item.publishingDate)}</td>
                        <c:if test="${fn:escapeXml(item.quantity) > 0}">
                            <td>${fn:escapeXml(item.quantity)}</td>
                        </c:if>
                        <c:if test="${fn:escapeXml(item.quantity) <= 0}">
                            <td>Out of stock</td>
                        </c:if>
                        <td><a
                                href="${pageContext.request.contextPath}/home/magicbooks/update?name=${fn:escapeXml(item.name)}&category=${item.category}&author=${item.author}&bookMrp=${item.bookMrp}&bookSellingPrice=${item.bookSellingPrice}&id=${item.id}&publishingDate=${item.publishingDate} &quantity=${item.quantity}"><i
                                class="material-icons">
                            edit
                        </i>Edit</a></td>
                        <td><a class="delete"
                               href="${pageContext.request.contextPath}/home/magicbooks/delete?id=${item.id}"><i
                                class="material-icons">
                            delete
                        </i>Delete</a></td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </c:if>
        <c:if test="${fn:length(bookList) == 0}">
            <p class="blue-text text-darken-5 center">Start adding a book.</p>

        </c:if>

    </main>
    <p class="blue-text text-darken-5 center">Note: </p>
    <ul class="collection">
        <li class="collection-item">Your books will not be visible to buyers if stock gets over.</li>
        <li class="collection-item">Deleting a book will make it out of stock.</li>
    </ul>
    <footer class="page-footer">
        <%@ include file="/WEB-INF/jsp/shared/footer.jsp" %>
    </footer>
</div>
<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/magicbooks.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/magicbooksCommon.js"></script>
</body>

</html>