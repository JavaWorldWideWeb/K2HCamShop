<%-- 
    Document   : orderList
    Created on : May 30, 2021, 3:05:20 PM
    Author     : Thanh Hoai
--%>

<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link href="<c:url value="/resources/Css/body.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="icon" href="<c:url value="/resources/Image/LoadLogo.png"/>">
        <script src="https://kit.fontawesome.com/041bd10679.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <h2>Đơn hàng của tôi</h2>
            <br />     
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th style="font-weight: bold;">Mã đơn hàng</th>
                        <th style="font-weight: bold;">Ngày mua</th>
                        <th style="font-weight: bold;">Sản phẩm</th>
                        <th style="font-weight: bold;">Số lượng</th>
                        <th style="font-weight: bold;">Giá</th>
                        <th style="font-weight: bold;">Tổng tiền</th>
                        <th style="font-weight: bold;">Trạng thái</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="od">
                        <tr>
                            <td>${od.orderDetailId}</td>
                            <td>${od.dateOrder}</td>
                            <td><a href="<c:url value="/product/detail?id=${od.productID.productID}" />" style="text-decoration: none">${od.productID.productName}</a></td>
                            <td>${od.quantity}</td>
                            <td>${od.productID.price}</td>
                            <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${od.total}" /></td>
                            <td>${od.statusOrderDetail}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
    <script>
    </script>
</html>
