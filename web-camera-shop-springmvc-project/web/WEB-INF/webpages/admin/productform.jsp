<%-- 
    Document   : productform
    Created on : May 21, 2021, 2:57:50 PM
    Author     : Tuan Khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Admin</title>
        <link rel="stylesheet" href="<c:url value="/resources/admin/css/style.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value="/resources/vendors/simple-line-icons/css/simple-line-icons.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value="/resources/vendors/css/vendor.bundle.base.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value="/resources/vendors/flag-icon-css/css/flag-icon.min.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value="/resources/vendors/daterangepicker/daterangepicker.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value="/resources/vendors/chartist/chartist.min.css"/>" rel='stylesheet' type='text/css'>
        <link rel="icon" href="<c:url value="/resources/images/LoadLogo.png"/>">
    </head>
    <body>
        <div class="main-panel">
            <div align="right">
                <c:if test="${success!=null}">
                    <div class="toast" data-autohide="true" data-delay="1000">
                        <div class="toast-header">
                            <strong class="mr-auto text-primary">Thành công</strong>
                            <small class="text-muted"></small>
                            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                        </div>
                        <div class="toast-body" align="center">
                            <c:catch var="success">
                                ${success}
                            </c:catch>
                        </div>
                    </div>
                </c:if>
            </div>
            <div class="card">
                <div class="card-body">
                    <c:catch var="product">
                        <h4 class="card-title">Nhập thông tin thương hiệu</h4>
                        <form method="Post" class="forms-sample" action="<c:url value="/product/save"/>" enctype="multipart/form-data">
                            <input type="text" class="form-control" hidden="true" value="${product.productID}" id="exampleInputUsername1" name="id" placeholder="Nhập tên thương hiệu">
                            <div class="form-group">
                                <label for="exampleInputUsername1">Tên Sản Phẩm</label>
                                <input type="text" class="form-control"  value="${product.productName}" name="name" placeholder="Nhập tên sản phẩm">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputConfirmPassword1">Giá Sản Phẩm</label>
                                <input type="text" class="form-control"  value="${product.price}" name="price" placeholder="Nhập giá sản phẩm">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputConfirmPassword1">Số Lượng Sản Phẩm</label>
                                <input type="text" class="form-control"  value="${product.quantity}" name="quantity" placeholder="Nhập số lượng">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputConfirmPassword1">Màu</label>
                                <input type="text" class="form-control"  value="${product.color}" name="color" placeholder="Nhập màu sắc">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputConfirmPassword1">Hình Ảnh</label>
                                <input type="file" class="form-control" value="${product.img}" name="image">
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlSelect3">Thương Hiệu</label>
                                <select class="form-control form-control-sm" name="brand">
                                    <c:forEach items="${listbrand}" var="pb">
                                        <option value="${product.productBrandID.productBrandID}" hidden="true" selected="true">${product.productBrandID.productBrandName}</option>
                                        <option value="${pb.productBrandID}">${pb.productBrandName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlSelect3">Loại Sản Phẩm</label>
                                <select class="form-control form-control-sm" name="cate">
                                    <c:forEach items="${listcate}" var="pc">
                                        <option value="${product.productCategoryID.productCategoryID}" hidden="true" selected="true">${product.productCategoryID.productCategoryName}</option>
                                        <option value="${pc.productCategoryID}">${pc.productCategoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="exampleTextarea1">Mô tả</label>
                                <textarea class="form-control" id="exampleTextarea1" rows="4" name=""></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary mr-2">Lưu</button>
                            <button class="btn btn-light" type="reset">Hủy</button>
                        </form>
                    </c:catch>
                </div>
            </div>
        </div>
    </div>
    <script src="<c:url value="/resources/vendors/js/vendor.bundle.base.js"/>"></script>
    <script src="<c:url value="/resources/vendors/chart.js/Chart.min.js"/>"></script>
    <script src="<c:url value="/resources/vendors/moment/moment.min.js"/>"></script>
    <script src="<c:url value="/resources/vendors/daterangepicker/daterangepicker.js"/>"></script>
    <script src="<c:url value="/resources/vendors/chartist/chartist.min.js"/>"></script>
    <script src="<c:url value="/resources/js/off-canvas.js"/>"></script>
    <script src="<c:url value="/resources/js/dashboard.js"/>"></script>
    <script src="<c:url value="/resources/js/misc.js"/>"></script>
    <script>
        $(document).ready(function () {
            $('.toast').toast('show');
        });
    </script>
</body>
</html>
