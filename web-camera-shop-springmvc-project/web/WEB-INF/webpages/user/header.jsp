<%-- 
    Document   : header
    Created on : May 20, 2021, 12:28:20 PM
    Author     : Tuan Khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="dashboard.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                        <a class="nav-link" href="Dashboard.html">Trang chủ <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link " href="Product.html">
                            Các sản phẩm
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="About.html">Giới thiệu về chúng tôi</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Liên hệ</a>
                    </li>
                </ul>
                <ul class="navbar-nav" style="padding-right: 7vw;">
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-shopping-cart"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Đăng nhập</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#">Đăng kí</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../../Admin/index.html">Admin</a>
                    </li>
                </ul>
            </div>
        </nav>
    </body>
</html>
