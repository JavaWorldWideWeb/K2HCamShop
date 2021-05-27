<%-- 
    Document   : product
    Created on : May 22, 2021, 4:48:06 PM
    Author     : Tuan Khang
--%>
<%@page import="java.text.DecimalFormat"%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
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
    <style>
        a {
            color: black;
        }
        a:hover{
            color: black;
        }
    </style>
    <body>
        <div class="container-custom" style="margin-top: 20px;">
            <div class="row">
                <c:forEach items="${listbrand}" var="lb">
                    <div class="col-2"><a href="${pageContext.request.contextPath}/product/filterBrand?id=${lb.productBrandID}"><img src="${pageContext.request.contextPath}/imgbrand/${lb.img}" style="width: 100%;"></a></div>     
                        </c:forEach>
            </div>
        </div>
        <div class="container-custom" style="padding-top: 20px;">
            <div class="row">
                <div class="col-3" style="border-right: 1px gray solid;">
                    <form action="/action_page.php">
                        <div class="row">
                            <div class="col-11">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" placeholder="Search">
                                    <div class="input-group-append">
                                        <button class="btn btn-success" type="submit">Go</button>  
                                    </div>
                                </div>
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
                <div class="col-9" >
                    <div>
                        <h6><a href="${pageContext.request.contextPath}/product/productpage">Các sản phẩm</a>  
                            <c:catch var="b"> 
                                <c:if test="${b!=null}">
                                    >><a href="">Thương hiệu ${b.productBrandName}</a>
                                </c:if>
                            </c:catch>
                        </h6>
                    </div>
                    <br>
                    <div class="row">
                        <c:forEach items="${list}" var="p">
                            <div class="col-3" style="padding-top: 10px">
                                <div class="card"> <img src="${pageContext.request.contextPath}/image/${p.img}" class="card-img-top" width="100%" height="160vh">
                                    <div class="card-body pt-0 px-0">
                                        <div class="d-flex flex-row justify-content-between mb-0 px-3"> <small class="text-muted mt-1">Giá Bán</small>
                                            <h6><fmt:formatNumber type = "number" 
                                                              maxFractionDigits = "3" value = "${p.price}"/> VND</h6>
                                        </div>
                                        <hr class="mt-2 mx-3">
                                        <div class="d-flex flex-row justify-content-between px-3 pb-4">
                                            <div class="d-flex flex-column"><span class="text-muted">Xuất xứ</span><small class="text-muted"></small></div>
                                            <div class="d-flex flex-column">
                                                <h6 class="mb-0">${p.productBrandID.nationalProduction}</h6><small class="text-muted text-right">(Quốc gia)</small>
                                            </div>
                                        </div>
                                        <small class="text-muted key pl-3">&#10025; Sản phẩm chính hãng </small>
                                        <div class="mx-3 mt-3 mb-2"><a href="" class="btn btn-warning btn-block"><small><b><i class="fas fa-shopping-cart"></i> THÊM VÀO GIỎ HÀNG</small></b></a></div> <small class="d-flex justify-content-center text-muted"><a href="<c:url value="/product/detail?id=${p.productID}"/>" style="color: black;font-weight: bold">Xem chi tiết sản phẩm</a></small>
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
