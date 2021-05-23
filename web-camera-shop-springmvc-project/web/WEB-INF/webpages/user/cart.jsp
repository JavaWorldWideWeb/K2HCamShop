<%-- 
    Document   : cart
    Created on : May 23, 2021, 9:55:34 AM
    Author     : Thanh Hoai
--%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link href="<c:url value="/resources/Css/body.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="icon" href="<c:url value="/resources/Image/LoadLogo.png"/>">
    </head>
    <body>

            <br/><br/>

            <div class="container">
                <div class="content">
                    <div class="shopping_cart">
                    <c:forEach var="map" items="${sessionScope.myCartItems}">
                        <div class="cart_box">
                            <div class="message">
                                <div class="list_img"><img src="${pageContext.request.contextPath}/resources/pages/images/pi1.jpg" class="img-responsive" alt=""></div>
                                <div class="list_close"><a href="${pageContext.request.contextPath}/cart/remove/${map.value.product.productId}.html">Remove item</a></div> 
                                <div class="list_desc"><h4><a href="#"><c:out value="${map.value.product.productName}"/></a></h4><c:out value="${map.value.quantity}"/> x
                                    $<c:out value="${map.value.product.productPrice}"/> = <span class="actual">  $<c:out value="${map.value.quantity * map.value.product.productPrice}"/></span></div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="total">
                    <div class="total_right">Free Shipping</div>
                    <div class="clearfix"> </div>
                    <div class="total_right">Total: $<c:out value="${sessionScope.myCartTotal}"/></div>
                    <div class="clearfix"> </div>
                    <div class="total_right">VAT (10%): <c:out value="${sessionScope.myCartTotal * 0.1}"/></div>
                    <div class="clearfix"> </div>
                    <div class="total_right">Pay: $<c:out value="${sessionScope.myCartTotal + (sessionScope.myCartTotal * 0.1)}"/></div>
                    <div class="clearfix"> </div>
                </div>
                <div class="login_buttons">
                    <div class="check_button"><a href="checkout.html">Check out</a></div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>

        </div>

        <br/><br/>

    </body>
</html>
