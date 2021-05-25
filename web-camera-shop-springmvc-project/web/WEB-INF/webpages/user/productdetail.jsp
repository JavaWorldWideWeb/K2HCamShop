<%-- 
    Document   : productdetail
    Created on : May 22, 2021, 5:28:15 PM
    Author     : Tuan Khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
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
        <link rel="icon" href="<c:url value="/resources/Image/LoadLogo.png"/>">
    </head>
    <style>
        @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

        /* Styling h1 and links
    ––––––––––––––––––––––––––––––––– */
        h1[alt="Simple"] {
            color: white;
        }


        .starrating>input {
            display: none;
        }

        /* Remove radio buttons */

        .starrating>label:before {
            content: "\f005";
            /* Star */
            font-size: 2em;
            font-family: FontAwesome;
            display: inline-block;
        }

        .starrating>label {
            color: #222222;
            /* Start color when not clicked */
        }

        .starrating>input:checked~label {
            color: #ffca08;
        }


        .starrating>input:hover~label {
            color: #ffca08;
        }

        .qty .count {
            color: #000;
            display: inline-block;
            vertical-align: top;
            font-size: 20px;
            font-weight: normal;
            line-height: 30px;
            padding: 0 2px;
            min-width: 35px;
            text-align: center;
        }

        .qty .plus {
            cursor: pointer;
            display: inline-block;
            vertical-align: top;
            color: white;
            width: 25px;
            height: 25px;
            font: 25px/1 Arial, sans-serif;
            text-align: center;
            border-radius: 50%;
        }

        .qty .minus {
            cursor: pointer;
            display: inline-block;
            vertical-align: top;
            color: white;
            width: 25px;
            height: 25px;
            font: 25px/1 Arial, sans-serif;
            text-align: center;
            border-radius: 50%;
            background-clip: padding-box;
        }


        .minus:hover {
            background-color: white !important;
            border: black 1px solid;
            color: black;
        }

        .plus:hover {
            background-color: white !important;
            border: black 1px solid;
            color: black;
        }

        span {
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
        }

        input{
            border: 0;
            width: 1px;
        }

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        input:disabled {
            background-color: white;
        }
    </style>
    <body>
        <div class="container-custom">
            <c:catch >
                <div class="row">
                    <div class="col-12" style="margin-top: 30px;">
                        <h4>THÔNG TIN SẢN PHẨM</h4>
                        <div style="border-top: 5px solid green; margin-top: 20px; margin-bottom: 20px; width: 59%;"></div>
                    </div>
                    <div class="col-7">
                        <img src="${pageContext.request.contextPath}/image/${p.img}" alt="" width="100%" height="470vh">
                    </div>
                    <div class="col-5">
                        <div class="row">
                            <div class="col-12" style="padding-top: 20px;">
                                <b>${p.productName}</b>
                                <div style="border-top: 5px solid red; margin-top: 20px; margin-bottom: 20px; width: 100%;">
                                </div>
                            </div>
                            <div class="col-4" style="padding-top: 20px;">
                                Mã sản phẩm
                            </div>
                            <div class="col-8" style="padding-top: 20px;">
                                ${p.productID}
                            </div>
                            <div class="col-4" style="padding-top: 20px;">
                                Số lượng còn
                            </div>
                            <div class="col-8" style="padding-top: 20px;">
                                ${p.quantity}
                            </div>
                            <div class="col-4" style="padding-top: 20px;">
                                Giá bán
                            </div>
                            <div class="col-8" style="color: red;padding-top: 20px;">
                                <fmt:formatNumber type = "number" 
                                                              maxFractionDigits = "3" value = "${p.price}"/> VND
                            </div>
                            <div class="col-4" style="padding-top: 20px;">
                                Bảo hành
                            </div>
                            <div class="col-8" style="padding-top: 20px;">
                                <b>${p.warranTyperiod}</b>
                            </div>
                            <div class="col-4" style="padding-top: 20px;">
                                Xuất xứ
                            </div>
                            <div class="col-8" style="padding-top: 20px;">
                                <b>${p.productBrandID.nationalProduction}</b>
                            </div>
                            <form action="">
                                <div class="col-12">
                                    <div class="qty mt-5">
                                        <span class="minus bg-dark"><i class="fas fa-minus"></i></span>
                                        <input type="number" class="count" name="qty" value="1">
                                        <span class="plus bg-dark"><i class="fas fa-plus"></i></span>
                                    </div>
                                </div>
                                <div class="col-12" style="margin-top: 30px;">
                                    <button type="submit" class="btn btn-warning"
                                            style="width: 200px; height: 50px; font-size: large ; font-weight: bold">Mua
                                        ngay &nbsp;<i class="fas fa-shopping-cart"></i></button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-custom">
                <div class="row">
                    <div class="col-12" style="padding-top: 20px;">
                        <b>MÔ TẢ SẢN PHẨM</b>
                    </div>
                    <div class="col-12" style="padding-top: 20px;">
                        ${p.description}
                    </div>
                </div>
            </div>
        </c:catch>
        <form action="">
            <div class="container-custom">
                <div class="row">
                    <div class="col-12" style="padding-top: 20px;">
                        <b>Đánh giá sản phẩm</b>
                    </div>
                    <div class="col-12" style="padding-top: 20px;" style="width: 100%  !important;">
                        <div class=" form-group" style="width: 100%  !important;">
                            <label for="comment">Comment:</label>
                            <textarea class="form-control" rows="5" cols="200" id="comment"
                                      style="max-width: 100%"></textarea>

                        </div>

                    </div>
                </div>
            </div>
            <div class="container-custom">
                <div class="starrating risingstar d-flex justify-content-center flex-row-reverse">
                    <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="5 star"></label>
                    <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="4 star"></label>
                    <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="3 star"></label>
                    <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="2 star"></label>
                    <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="1 star"></label>
                </div>

            </div>
            <div class="container-custom" style="margin-top: 5px; margin-bottom: 10px;">
                <button type="submit" class="btn btn-danger" style="width: 150px; height: 40px; ">Bình luận</button>
            </div>
        </form>

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
        <script src="https://kit.fontawesome.com/041bd10679.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.count').prop('disabled', true);
                $(document).on('click', '.plus', function () {
                    $('.count').val(parseInt($('.count').val()) + 1);
                });
                $(document).on('click', '.minus', function () {
                    $('.count').val(parseInt($('.count').val()) - 1);
                    if ($('.count').val() == 0) {
                        $('.count').val(1);
                    }
                });
            });
        </script>
    </body>
</html>
