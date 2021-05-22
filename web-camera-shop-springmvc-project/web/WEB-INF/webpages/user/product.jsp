<%-- 
    Document   : product
    Created on : May 22, 2021, 4:48:06 PM
    Author     : Tuan Khang
--%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sản phẩm</title>
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link href="<c:url value="/resources/Css/body.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="icon" href="<c:url value="/resources/Image/LoadLogo.png"/>">

    </head>
    <body>
        <div class="container-custom" style="margin-top: 20px;">
            <div class="row">
                <div class="col-2"><a href=""><img src="../Image/Logo/kodak.png" style="width: 100%;"></a></div>
                <div class="col-2"><a href=""><img src="../Image/Logo/canon.jpeg" style="width: 100%;"></a></div>
                <div class="col-2"><a href=""><img src="../Image/Logo/sony.jpg" style="width: 100%;"></a></div>
                <div class="col-2"><a href=""><img src="../Image/Logo/Nikon.jpg" style="width: 100%;"></a></div>
                <div class="col-2"><a href=""><img src="../Image/Logo/panasonic.jpg" style="width: 100%;"></a></div>
                <div class="col-2"><a href=""><img src="../Image/Logo/olympus.jpg" style="width: 100%;"></a></div>
            </div>
        </div>
        <div class="container-custom" style="padding-top: 20px;">
            <div class="row">
                <div class="col-3">
                    <form action="/action_page.php">
                        <div class="row">
                            <div class="col-9">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="email" placeholder="Nhập từ khóa tìm kiếm"
                                           name="email" autocomplete="off">
                                </div>
                            </div>
                            <div class="col-3">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </form>
                    <h6 style="border-top: 1px;">SẮP XẾP THEO</h6>
                    <form action="/action_page.php">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="example1">
                            <label class="custom-control-label" for="customRadio">Mặc định</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="example1">
                            <label class="custom-control-label" for="customRadio">Tăng dần</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="example1">
                            <label class="custom-control-label" for="customRadio">Giảm dần</label>
                        </div>
                    </form>
                    <div style="border-top: 1px solid gray; margin-top: 20px; margin-bottom: 20px;">
                    </div>
                    <h6>Khoảng giá</h6>
                    <form>
                        <div class="form-row">
                            <div class="col">
                                <input type="text" class="form-control" id="email" placeholder="đ TỪ" name="email">
                            </div>
                            <div class="col">
                                <input type="text" class="form-control" placeholder="đ Đến" name="pswd">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-12">
                                <button class="btn btn-danger" style="width: 100%;">ÁP DỤNG</button>
                            </div>
                        </div>

                    </form>
                </div>
                <div class="col-9">
                    <div>
                        <h4>Các sản phẩm</h4>
                    </div>
                    <div class="row">
                        <c:forEach items="${list}" var="p">
                            <div class="col-3">
                                <div class="card" style="width:100%; margin-top: 10px;">
                                    <img class="card-img-top" src="${pageContext.request.contextPath}/image/${p.img}" alt="Card image"
                                         style="width:100%;height: 25vh">
                                    <div class="card-body">
                                        <h5 class="card-title" style="color: gray">${p.productName}</h5>
                                        <p class="card-text"><b>$ ${p.price}</b></p>
                                        <a href="<c:url value="/product/detail?id=${p.productID}"/>">Xem chi tiết</a> <br>
                                        <a href=" #" class="btn btn-danger">MUA NGAY</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <footer style="background-color: black; color: white; height: 200px; padding-left: 50px; margin-top: 10px;">
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
        <script src="https://kit.fontawesome.com/041bd10679.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        
    </body>
</html>
