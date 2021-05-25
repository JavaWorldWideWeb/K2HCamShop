<%-- 
    Document   : checkout
    Created on : May 25, 2021, 1:53:45 PM
    Author     : Thanh Hoai
--%>

<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toán</title>
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
        <style>
            li {
                color: red;
            }

            .cart_product_inner button {
                width: 20%;
                margin-left: auto;
                margin-right: auto;
                display: block;
            }

            .cart_product_inner img{
                width: 80px;
                height: 80px;
            }

            #empty img, #empty button{
                width: 20%;
                margin-left: auto;
                margin-right: auto;
                display: block;
            }
        </style>
    </head>
    <body>
        </br></br>
        <div class="container">
            <div class="row" id="cart">
                <div class="col-lg-7" id="cartlist" style="background-color: GhostWhite">
                    <h4>Danh sách sản phẩm</h4>
                    <div class="cart_product_inner">
                        <c:forEach var="map" items="${sessionScope.myCartItems}">
                            <div class="container" style="border: 1px solid LightGray; padding:10px 5px 10px 15px;">
                                <div class="row">

                                    <div class="col-lg-3">
                                        <img src="${pageContext.request.contextPath}/image/${map.value.product.img}" />
                                    </div>
                                    <div class="col-lg-8">
                                        <a href="<c:url value="/product/detail?id=${map.value.product.productID}"/>" style="color:black; "><c:out value="${map.value.product.productName}"/></a>
                                        <br /><br />
                                        <div class="row" style="margin-right: -60px;">
                                            <p style="color:red; font-weight:bold; margin-left: 20px">
                                                <c:out value="${map.value.quantity}" /> x 
                                                <c:out value="${map.value.product.price}" /> = 
                                                <c:out value="${map.value.product.price}" /> VND
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </br>
                        </c:forEach>
                     <hr />
                     <p>
                                <span style="color:#6d6767">Tạm tính</span>
                                <span style="float:right; color:black; font-weight:bold"><c:out value="${sessionScope.myCartTotal}" /> VNĐ</span>
                            </p>
                            <hr />
                            <p>
                                <span style="color:#6d6767">Thành Tiền</span>
                                <span style="float:right; color:red; font-weight:bold; font-size: 22px"><c:out value="${sessionScope.myCartTotal + (sessionScope.myCartTotal * 0.1)}"/> VNĐ </span>
                                <br />
                                <i style="float: right; color:#2c2929; font-size: 13px">(Đã bao gồm thuế VAT nếu có)</i>
                            </p>
                    </div>
                </div>
                <div class="col-lg-4" style="margin-left:30px;" id="cartlist">
                    <h4>Thông tin khách hàng</h4>
                    <div style="background-color:#f5f5f5; padding: 10px 10px 10px 10px">
                        <form action="/action_page.php">
                            <div class="form-group">
                                <label for="email">:</label>
                                <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                            </div>
                            <div class="form-group">
                                <label for="pwd">Password:</label>
                                <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd">
                            </div>
                            <div class="form-group form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox" name="remember"> Remember me
                                </label>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
