<%-- 
    Document   : userform
    Created on : Jun 1, 2021, 12:11:29 AM
    Author     : Hung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chỉnh sửa thông tin cá nhân</title>
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link href="<c:url value="/resources/Css/body.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="icon" href="<c:url value="/resources/Image/LoadLogo.png"/>">
    </head>
    <body>
        <div class="col-12 grid-margin">
                <c:catch var="userShop" >
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Lưu thông tin khách hàng</h4>
                            <form class="form-sample" autocomplete="off" action="<c:url value="/user/saveUser"/>" enctype="multipart/form-data" method="post">
                                <p class="card-description"> Thông tin khách hàng </p>
                                <div class="row">
                                    <input type="hidden" class="form-control" value="${userShop.userID}" name="id" placeholder="Nhập tên khách hàng" />
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Họ tên</label>
                                            <div class="col-sm-9">
                                                <input type="text" required="" class="form-control" value="${userShop.fullName}" name="fullname" placeholder="Nhập tên khách hàng" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">mật khẩu</label>
                                            <div class="col-sm-9">
                                                <input type="text" required="" class="form-control" value="${userShop.username}" name="password" placeholder="Nhập mật khẩu" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Địa chỉ</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control"  value="${userShop.address}" name="address" placeholder="Nhập địa chỉ"/>
                                            </div>
                                        </div>
                                    </div>
                                            
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Số điện thoại</label>
                                            <div class="col-sm-9">
                                                <input type="text" required="" class="form-control" value="${userShop.phoneNumber}" name="phone" placeholder="Nhập số điện thoại"/>
                                            </div>
                                        </div>
                                    </div>        
                                </div>
                                <div class="row">
                                   
                                    
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Email</label>
                                            <div class="col-sm-9">
                                                <input type="email" required="" class="form-control" value="${userShop.email}" name="email" placeholder="Nhập email"/>
                                            </div>
                                        </div>
                                    </div>        
                                </div>
                             
                
                                    <div class="col-md-6">
                                      <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Hình Ảnh</label>
                                            <div class="col-sm-9">
                                                <c:catch var="r">
                                                    <input type="file" class="form-control" ${r} value="${pageContext.request.contextPath}/imguser/${userShop.img}" name="image" />
                                                </c:catch>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                               
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label"></label>
                                            <div class="col-sm-9">
                                                <button type="submit" class="btn btn-success mr-2">Cập Nhật</button>
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                        </div>
                        </form>
                    </div>
                </div>
            </c:catch>
        </div>
    </body>
    
    
    <footer style="background-color: black; color: white; height: 200px; padding-left: 50px; margin-top: 110px;">
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
</html>
