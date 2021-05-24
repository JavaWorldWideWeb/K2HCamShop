<%-- 
    Document   : header
    Created on : May 20, 2021, 12:28:20 PM
    Author     : Tuan Khang
--%>

<%@page import="java.util.List"%>
<%@page import="sv.iuh.project.model.OrderDetail"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="sv.iuh.project.model.UserShop"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .nav-item:hover .sub-icon1{
                display:block;
                text-decoration: none;
                color: blue;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-4"><img src="<c:url value="/resources/Image/K2NCamShop.png"/>" style="width: 40%;" /></div>

                <div class="col-7" align="right" style="margin-top: 5vh;"></div>
            </div>
        </header>
        <nav class="navbar navbar-expand-lg navbar-dark">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05"
                    aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarsExample05">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="<c:url value="/"/>">Trang chủ <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link " href="<c:url value="/product/showproductuser"/>">
                            Các sản phẩm
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/about"/>">Giới thiệu về chúng tôi</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Liên hệ</a>
                    </li>
                </ul>
                <ul class="navbar-nav" style="padding-right: 7vw;">
                    <li class="nav-item">
                        <div class="cart">
                            <a class="nav-link" href="#"><i class="fas fa-shopping-cart"></i></a>
                            <span><c:out value="${sessionScope.myCartNum}"/></span>
                        </div>
                        <ul class="sub-icon1 list" style="color: white; display: none">
                            <h3>Recently added items (<c:out value="${sessionScope.myCartNum}"/>)</h3>
                                <div class="shopping_cart">
                                    <c:forEach var="map" items="${sessionScope.myCartItems}">
                                        <div class="cart_box">
                                            <div class="message">
                                                <div class="alert-close"> </div> 
                                                <div class="list_img"><img src="${pageContext.request.contextPath}/resources/pages/images/14.jpg" class="img-responsive" alt=""></div>
                                                <div class="list_desc"><h4><a href="#"><c:out value="${map.value.product.productName}"/></a></h4><c:out value="${map.value.quantity}"/> x
                                                    $<c:out value="${map.value.product.productPrice}"/> = <span class="actual"> $<c:out value="${map.value.quantity * map.value.product.productPrice}"/></span></div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="total">
                                    <div class="total_left">Total: </div>
                                    <div class="total_right">$<c:out value="${sessionScope.myCartTotal}"/></div>
                                    <div class="clearfix"> </div>
                                </div>
                                <div class="login_buttons">
                                    <div class="check_button"><a href="checkout.html">Check out</a></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="clearfix"></div>
                        </ul>
                    </li>
                    <%
                        UserShop userShop = (UserShop) session.getAttribute("userlogin");
                    %>
                    <c:set var = "usershop" scope = "session" value = "<%=userShop%>"/>
                    <c:if test="${usershop!=null}">
                        <c:catch var="userShop">
                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value="/login/logout"/>"><%=userShop.getFullName()%></a>
                            </li>
                        </c:catch>
                    </c:if>
                    <c:if test="${usershop==null}">
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/login"/>">Đăng nhập</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Đăng kí</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/admin"/>">Admin</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </nav>
    </body>
</html>
