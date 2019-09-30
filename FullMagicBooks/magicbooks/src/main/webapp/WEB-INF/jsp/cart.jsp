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
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ribbons.css"
          media="screen,projection"/>

    <!--Let browser know web site is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cart.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/magicbooks.min.js"></script>

    <script type="text/javascript">
        function removeFromCart(e) {

            var bookList = JSON.parse(localStorage.getItem("bookList"));

            bookList = bookList.filter(function (value) {
                return value != e
            });

            localStorage.setItem("bookList", JSON.stringify(bookList));
            var serviceUrl = "/magicbooks/home/magicbooks/cartFeature";
            var baseUrl = window.location.protocol + "//" + window.location.hostname + (window.location.port ? ':' + window.location.port : '');
            var url_tmp = baseUrl + serviceUrl;

            $.ajax({
                type: "POST",
                url: url_tmp,
                data: {
                    bookids: JSON.parse(localStorage.getItem("bookList"))
                },
                success: function (msg) {
                    console.log("Ajax Success")
                    $('body').html(msg);

                }
            });
        }
    </script>
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
            <table class="highlight centered responsive-table sash">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Author</th>
                    <th>MRP Price</th>
                    <th>Selling Price</th>
                    <th>Publishing Date</th>
                    <th>Quantity</th>
                    <th>Remove</th>
                    <th>Buy Individual</th>
                </tr>
                </thead>
                <tbody style="font-size: 0.9em;font-weight: lighter">
                <c:forEach items="${bookList}" var="item">
                    <c:if test="${item.quantity == -1}">

                        <tr class="blur">
                            <td class="prova" data-ribbon="Out of Stock"> ${fn:escapeXml(item.name)}</td>
                            <td>${fn:escapeXml(item.category)}</td>
                            <td>${fn:escapeXml(item.author)}</td>
                            <td>${fn:escapeXml(item.bookMrp)}Rs.</td>
                            <td>${fn:escapeXml(item.bookSellingPrice)}Rs.</td>
                            <td>${fn:escapeXml(item.publishingDate)}</td>
                            <td class="${fn:escapeXml(item.id)}" style="white-space:nowrap;">
                                <div class="value-button decreaseValue" value="Decrease Value">-</div>
                                <input type="text" class="cartValue" value="${fn:escapeXml(item.itemInCart)}"/>
                                <div class="value-button increaseValue" value="${fn:escapeXml(item.quantity)}">+</div>
                            </td>
                            <td class="non-blur blue lighten-5"><a onClick="removeFromCart(${fn:escapeXml(item.id)})" style=" cursor: pointer;"><i
                                    class="material-icons teal-text">
                                remove_circle_outline

                            </i></a></td>
                            <td><a class="btn-small green waves-effect waves-dark"> BUY
                                <i class="material-icons right">send</i></a></td>
                        </tr>
                    </c:if>
                    <c:if test="${item.quantity > 0}">

                        <tr>
                            <td>${fn:escapeXml(item.name)}</td>
                            <td>${fn:escapeXml(item.category)}</td>
                            <td>${fn:escapeXml(item.author)}</td>
                            <td>${fn:escapeXml(item.bookMrp)}Rs.</td>
                            <td>${fn:escapeXml(item.bookSellingPrice)}Rs.</td>
                            <td>${fn:escapeXml(item.publishingDate)}</td>
                            <td class="${fn:escapeXml(item.id)}" style="white-space:nowrap;">
                                <div class="value-button decreaseValue" value="Decrease Value">-</div>
                                <input type="text" class="cartValue" value="${fn:escapeXml(item.itemInCart)}"/>
                                <div class="value-button increaseValue" value="${fn:escapeXml(item.quantity)}">+</div>
                            </td>
                            <td><a onClick="removeFromCart(${fn:escapeXml(item.id)})" style=" cursor: pointer;"><i
                                    class="material-icons teal-text">
                                remove_circle_outline

                            </i></a></td>
                            <td><a class="btn-small green waves-effect waves-dark"
                                   href="${pageContext.request.contextPath}/home/magicbooks/delete?id=${item.id}"> BUY
                                <i
                                        class="material-icons right">send</i></a></td>
                        </tr>
                    </c:if>
                </c:forEach>

                </tbody>
            </table>
            <c:if test="${fn:length(bookList) > 1}">
                <center>
                    <a class="btn-small teal waves-effect waves-dark" type="reset" name="action"
                       href="${pageContext.request.contextPath}/home/addOne">
                        Buy All
                        <i class="material-icons right">send</i>
                    </a>
                </center>
            </c:if>
        </c:if>
        <c:if test="${fn:length(bookList) == 0}">
            <center><p class="blue-text text-darken-5 center">Nothing available in Cart.</p>
                <a class="blink_me" href="${pageContext.request.contextPath}/home/show">Start adding a book!!</a>
            </center>

        </c:if>

    </main>
    <footer class="page-footer">
        <%@ include file="/WEB-INF/jsp/shared/footer.jsp" %>
    </footer>
</div>
<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/magicbooksCommon.js"></script>

</body>

</html>