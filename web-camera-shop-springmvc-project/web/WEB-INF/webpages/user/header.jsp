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
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 300px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                padding: 12px 16px;
                z-index: 1;
            }

            .dropdown:hover .dropdown-content {
                display: block;
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
                        <a class="nav-link " href="<c:url value="/product/productpage"/>">
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
                    <li class="dropdown" style="position: relative; display: inline-block;">
                        <div class="cart">
                            <a class="nav-link" href="<c:url value="/cart/show"/>"><i class="fas fa-shopping-cart" style="color: white"> <span id="cart_count" style="color: red"><c:out value="${sessionScope.myCartNum}"/></span></i></a>

                        </div>
<<<<<<< HEAD
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
=======
                        <div class="dropdown-content">
                            <ul class="sub-icon1 list" style="margin-left: -30px">
                                <h5>Giỏ hàng (<c:out value="${sessionScope.myCartNum}"/>)</h5>
                                <div class="shopping_cart">
                                    <c:forEach var="map" items="${sessionScope.myCartItems}">
                                        <div class="container" style="background-color:#f5f5f5; padding:10px 5px 10px 15px;">
                                            <div class="row">

                                                <div class="col-lg-2">
                                                    <img src="${pageContext.request.contextPath}/image/${map.value.product.img}" style="width: 40px; height: 50px;"/>
                                                </div>
                                                <div class="col-lg-10">
                                                    <a href="<c:url value="/product/detail?id=${map.value.product.productID}"/>" style="color:black; "><c:out value="${map.value.product.productName}"/></a>
                                                    </br>
                                                    <b><c:out value="${map.value.quantity}" /> x <c:out value="${map.value.product.price}" /></b>
                                                    <div class="row" style="margin-right: -60px;">
                                                        <div class="col-lg-3">
                                                            <span style="color:blue; font-size: 14px"><a href="${pageContext.request.contextPath}/cart/remove/${map.value.product.productID}.html">Xóa</a></span>

                                                        </div>
                                                        <div class="col-lg-9">
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <p style="color:red; font-weight:bold; margin-bottom: -5px;"><c:out value="${map.value.product.price}" /> VND</p>

                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                        <br/>
                                    </c:forEach>
                                </div>
                                <hr />
                                <p>
                                    <span style="color:#6d6767">Thành Tiền</span>
                                    <span style="float:right; color:red; font-weight:bold; font-size: 16px"><fmt:formatNumber type = "number" maxFractionDigits = "3" value ="${sessionScope.myCartTotal + (sessionScope.myCartTotal * 0.1)}" /> VNĐ</span>
                                <br />
                                <i style="float: right; color:#2c2929; font-size: 10px">(Đã bao gồm thuế VAT nếu có)</i>
                                </p>


                                <div class="clearfix"></div>

                            </ul>
                        </div>
>>>>>>> 97c673da1c53258b0c4b78ef7d08772d689f3fbb
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

    <script>
        var count = document.getElementById("cart_count").innerHTML;
        if (count == 0) {
            document.getElementById("cart_count").style.display = 'none';
        } else {
            document.getElementById("cart_count").style.display = 'inline-block';

        }
    </script>
</html>
