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
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/book_logo.png">
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magicbooks.min.css"
          media="screen,projection"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magicbooksCommon.css"
          media="screen,projection"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cart.css"
          media="screen,projection"/>

    <!--Let browser know web site is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

</head>

<body class="blue lighten-5">

<div id="modal1" class="modal" style="overflow: hidden">
    <i class="material-icons right modal-close">close</i>
    <div class="modal-content ">
        <div class="carousel carousel-slider center ">

        </div>
    </div>
</div>

<div class="container  z-depth-5" id="container">

    <header>
        <%@ include file="/WEB-INF/jsp/shared/navBar.jsp" %>

    </header>
    
    <c:if test="${fn:length(bookList) > 0}">

        <%@ include file="/WEB-INF/jsp/shared/specialNav.jsp" %>
    </c:if>
    <c:if test="${fn:length(bookList) == 0}">
        <p class="blue-text text-darken-5 center">No Result found For your search!!</p>
    </c:if>
<c:if test="${message != null}">
            <ul class="collection">
                <li class="collection-item #a5d6a7 green lighten-3">
                    ${message}
                </li>
            </ul>
        </c:if>
        <br /><br />
        <br />
    <main style="font-size: 1em;">
        <div class="row">

            <c:if test="${fn:length(bookList) > 0}">
                <c:forEach items="${bookList}" var="item">
                    <div class="col m4">
                        <div class="card hoverable">
                            <div class="card-image waves-effect waves-block waves-light">
                                <c:if test="${item.picture != null}">
                                    <img class="activator responsive-image" src="${fn:escapeXml(item.picture)}">
                                </c:if>
                                <c:if test="${item.picture == null}">
                                    <img class="activator responsive-image"
                                         src="https://www.gstatic.com/webp/gallery3/1.png">
                                </c:if>
                            </div>
                            <div class="card-content">
                                    <span
                                            class="card-title activator teal-text text-darken-1">${fn:escapeXml(item.name)} <p
                                            class="teal-text text-darken-1"
                                            style="font-size:0.6em; color:#4e342e !important">A book by
                          ${fn:escapeXml(item.author)} </p><i
                                            class="material-icons right">more_vert</i><p
                                            class="blue-text text-darken-3">Rs.${fn:escapeXml(item.bookSellingPrice)} only</p></span>

                                <c:if test="${not empty fn:escapeXml(item.priceDrop) }">
                                <p style="font-size:0.7em">Price Dropped by <span class="green-text text-darken-3"
                                                                                  style="font-size:1.3em"> ${fn:escapeXml(item.priceDrop)}%</span>
                                    </c:if>
                                    <c:if test="${fn:escapeXml(item.quantity) < 5}">
                                    <span class="red-text text-darken-1">
                                            &nbsp;hurry only ${fn:escapeXml(item.quantity)} left in stock!!</span></p>
                                </c:if>


                                <p class="teal-text text-darken-1" style="font-size:0.75em">MRP Price
                                    Rs. ${fn:escapeXml(item.bookMrp)} only</p>

                            </div>

                            <div class="card-reveal" style="overflow: hidden;font-size: small">
                                    <span class="card-title grey-text text-darken-4"><i
                                            class="material-icons right">close</i></span>

                                <table class="highlight centered ">

                                    <tr>
                                        <td class="teal-text text-darken-1"> Rating</td>
                                        <td>${fn:escapeXml(item.rating)}</td>
                                    </tr>
                                    <tr>
                                        <td class="teal-text text-darken-1">Category</td>
                                        <td>${fn:escapeXml(item.category)}</td>
                                    </tr>
                                    <c:if test="${not empty fn:escapeXml(item.priceDrop) }">
                                        <tr>
                                            <td class="teal-text text-darken-1">Price Drop</td>
                                            <td> ${fn:escapeXml(item.priceDrop)}%</td>
                                        </tr>
                                    </c:if>
                                    <tr>
                                        <td class="teal-text text-darken-1">Published on</td>
                                        <td>${fn:escapeXml(item.publishingDate)}</td>
                                    </tr>

                                    <tr>
                                        <td class="teal-text text-darken-1"> Selling Price</td>
                                        <td>Rs.${fn:escapeXml(item.bookSellingPrice)}/-</td>
                                    </tr>

                                    <tr>
                                        <td><a class="btn-floating btn-small waves-effect waves-light red"><i
                                                class="material-icons add-to-cart"
                                                value="${fn:escapeXml(item.quantity)}"
                                                id="${fn:escapeXml(item.id)}">add</i></a></td>
                                        <c:if test="${fn:length(item.pictures) > 0}">

                                            <td><a class="btn-floating btn-small waves-effect waves-light blue
                                            btn modal-trigger showCarousalPictures" href="#modal1"
                                                   data-picures="${fn:escapeXml(item.pictures)}"><i
                                                    class="material-icons">photo_library</i></a>
                                            </td>
                                        </c:if>
                                        <td><a
                                                class="btn-floating btn-small teal waves-effect waves-light blue" href="${pageContext.request.contextPath}/login">buy</a>
                                        </td>
                                    </tr>
                                </table>

                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>

    </main>

    <footer class="page-footer">
        <%@ include file="/WEB-INF/jsp/shared/footer.jsp" %>
    </footer>
</div>
<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/magicbooks.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/magicbooksCommon.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cart.js"></script>


</body>

</html>