<%-- 
    Document   : register
    Created on : May 23, 2021, 9:02:52 PM
    Author     : Hung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
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
        <link href="<c:url value="/resources/register/signup.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="icon" href="<c:url value="/resources/Image/LoadLogo.png"/>">
    </head>
    <body>
        <div class="container-custom" style="margin-top: 20px;">

            <div class="row">
                <div class="col-12">

                    <div class="container">
                        <div class="title">Đăng kí</div>
                        <form action="<c:url value="/register/save"/>" method="POST" enctype="multipart/form-data">
                            <div class="user-detail">
                                <div class="input-box">
                                    <i class="fas fa-pen"></i></span>
                                    <span class="details">Tên đầy đủ</span>

                                    <input type="text" placeholder="nhập họ tên" name="tendaydu">
                                </div>

                                <div class="input-box">
                                    <i class="fas fa-user-alt"></i></span>
                                    <span class="details">Tên đăng nhập </span>

                                    <input type="text" placeholder="nhập tên đăng nhập " name="tendangnhap">
                                </div>

                                <div class="input-box">
                                    <i class="fas fa-key"></i>
                                    <span class="details">Mật khẩu </span>
                                    <input type="password" placeholder="nhập mật khẩu" name="matkhau">
                                </div>
                                <div class="input-box">
                                    <i class="fas fa-envelope-square"></i>
                                    <span class="details">Email </span>
                                    <input type="text" placeholder="nhập email" name="email">
                                </div>
                                <div class="input-box">
                                    <i class="fas fa-undo"></i>
                                    <span class="details">Xác nhận mật khẩu </span>
                                    <input type="password" placeholder="nhập lại mật khẩu" >
                                </div>
                                <div class="input-box">
                                    <i class="fas fa-mobile-alt"></i>
                                    <span class="details"> Số điện thoại </span>
                                    <input type="text" placeholder="nhập số điện thoại" name="sodt">
                                </div>

                                <div class="input-box">
                                    <i class="fas fa-calendar"></i>
                                    <span class="details"> Ngày sinh </span>
                                    <input type="date" placeholder="nhập số điện thoại" name="ngaysinh">
                                </div>

                                <div class="input-box">


                                    <i class="fas fa-home"></i>
                                    <span class="details"> Địa chỉ </span>
                                    <select name="calc_shipping_provinces" required="">
                                        <option value="tinh">Tỉnh / Thành phố</option>
                                    </select>
                                    <select name="calc_shipping_district" required="">
                                        <option value="quan">Quận / Huyện</option>
                                    </select>
                                    <input class="billing_address_1" name="" type="hidden" value="">
                                    <input class="billing_address_2" name="" type="hidden" value="">
                                    <input type="text" placeholder="nhập địa chỉ" name="diachi">

                                </div>


                            </div>
                            <div class="button">
                                <input type="submit" value="Đăng kí">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <footer style="background-color: black; color: white; height: 200px; padding-left: 50px;">
            <div class="row">
            <div class="col-9">
                <h4 style="padding-top: 20px;padding-bottom: 20px;">CỬA HÀNG MÁY ẢNH K2NCamShop</h4>
                <p class="pFooter">Địa chỉ: số 8 Nguyễn Văn Bảo, Phường 4, Quận Gò Vấp, TP Hồ Chí Minh</p>
                <p class="pFooter">Điện thoại: 0976553787 - Email: K2NCamShop@gmail.vn </p>
                <p class="pFooter">&copy Copyright 2021</p>
            </div>
            <div class="col-3" style="padding-top: 20px;">
                <a href=""><img src="../Image/Logo/fb.png" style="width: 10%;"></a>
                <a href=""><img src="../Image/Logo/yt.png" style="width: 10%;"></a>
                <a href=""><img src="../Image/Logo/ins.png" style="width: 10%;"></a>
            </div>
        </div>
         </footer>

        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js' ></script>
       
        <script src="https://kit.fontawesome.com/041bd10679.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src='https://cdn.jsdelivr.net/gh/vietblogdao/js/districts.min.js'></script>

    </body>
</html>
