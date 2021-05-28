<%-- 
    Document   : productform
    Created on : May 21, 2021, 2:57:50 PM
    Author     : Tuan Khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
            <div class="col-12 grid-margin">
                <c:catch var="product" >
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Lưu thông tin sản phẩm</h4>
                            <form class="form-sample" autocomplete="off" action="<c:url value="/product/save"/>" enctype="multipart/form-data" method="post">
                                <p class="card-description"> Thông tin sản phẩm </p>
                                <div class="row">
                                    <input type="hidden" class="form-control" value="${product.productID}" name="id" placeholder="Nhập tên sản phẩm" />
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Tên sản phẩm</label>
                                            <div class="col-sm-9">
                                                <input type="text" required="" class="form-control" value="${product.productName}" name="name" placeholder="Nhập tên sản phẩm" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Giá sản phẩm</label>
                                            <div class="col-sm-9">
                                                <input type="number" min="0" required="" class="form-control" value="${product.price}" name="price" placeholder="Nhập giá sản phẩm"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Số lượng sản phẩm</label>
                                            <div class="col-sm-9">
                                                <input type="number" min="0" required="" class="form-control" value="${product.quantity}" name="quantity" placeholder="Nhập số lượng" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Màu sản phẩm</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control"  value="${product.color}" name="color" placeholder="Nhập màu sản phẩm"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Bộ cảm biến</label>
                                            <div class="col-sm-9">
                                                <input type="text" required="" class="form-control" value="${product.sensor}" name="sensor" placeholder="Nhập bộ cảm biến" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Dãy ISO</label>
                                            <div class="col-sm-9">
                                                <input type="text" required="" class="form-control" value="${product.iso}" name="iso" placeholder="Nhập dãy ISO"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Độ phân giải (MP)</label>
                                            <div class="col-sm-9">
                                                <input type="number" step="0.01" min="0" required="" class="form-control" value="${product.resolution}" name="resolution" placeholder="Nhập độ phân giải (Megapixel)" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Đo sáng</label>
                                            <div class="col-sm-9">
                                                <input type="text" required="" class="form-control" value="${product.metering}" name="metering" placeholder="Nhập đo sáng"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Kích thước ảnh</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" required="true" name="sizephoto">
                                                    <c:if test="${product!=null}">
                                                        <option value="${product.sizephoto}" hidden="true" selected="true">${product.sizephoto}</option>
                                                    </c:if>
                                                    <option value="1051 x 1500">1051 x 1500</option>
                                                    <option value="1205 x 1795">1205 x 1795</option>
                                                    <option value="1500 x 2102">1500 x 2102</option>
                                                    <option value="1795 x 2398">1795 x 2398</option>
                                                    <option value="2398 x 3000">2398 x 3000</option>
                                                    <option value="2398 x 3602">2398 x 3602</option>
                                                    <option value="3000 x 3602">3000 x 3602</option>
                                                    <option value="3000 x 4500">3000 x 4500</option>
                                                    <option value="3295 x 4205">3295 x 4205</option>
                                                    <option value="3295 x 5102">3295 x 5102</option>
                                                    <option value="3602 x 4500">3602 x 4500</option>
                                                    <option value="3295 x 4205">3295 x 4205</option>
                                                    <option value="3295 x 5102">3295 x 5102</option>
                                                    <option value="3602 x 4500">3602 x 4500</option>
                                                    <option value="6000 x 9500">6000 x 9500</option>
                                                    <option value="1748 x 1240">1748 x 1240</option>
                                                    <option value="3496 x 2480">3496 x 2480</option>
                                                    <option value="6992 x 4960">6992 x 4960</option>
                                                    <option value="13984 x 9920">13984 x 9920</option>
                                                    <option value="27968 x 19840">27968 x 19840</option>
                                                </select>   
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Micro</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" required="true" name="micro">
                                                    <c:if test="${product!=null}">
                                                        <option value="${product.micro}" hidden="true" selected="true">${product.micro}</option>
                                                    </c:if>
                                                    <option value="Có">Có</option>
                                                    <option value="Có">Không</option>
                                                </select>                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Thương Hiệu</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" required="true" name="brand">
                                                    <c:if test="${product!=null}">
                                                        <option value="${product.productBrandID.productBrandID}" hidden="true" selected="true">${product.productBrandID.productBrandName}</option>
                                                    </c:if>
                                                    <c:forEach items="${listbrand}" var="pb">
                                                        <option value="${pb.productBrandID}">${pb.productBrandName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Thời gian bảo hành (Tháng)</label>
                                            <div class="col-sm-9">
                                                <input type="number" required min="0" class="form-control"  value="${product.warranTyperiod}" name="warranTyperiod" placeholder="Nhập thời gian bào hành (tháng)"/>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Loại Sản Phẩm</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" required name="cate">
                                                    <c:if test="${product!=null}">
                                                        <option value="${product.productCategoryID.productCategoryID}" hidden="true" selected="true">${product.productCategoryID.productCategoryName}</option>
                                                    </c:if>
                                                    <c:forEach items="${listcate}" var="pc">
                                                        <option value="${pc.productCategoryID}">${pc.productCategoryName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Hình Ảnh</label>
                                            <div class="col-sm-9">
                                                <c:catch var="r">
                                                    <input type="file" class="form-control" ${r} value="${pageContext.request.contextPath}/imgbrand/${product.img}" name="image" />
                                                </c:catch>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Mô tả</label>
                                            <div class="col-sm-9">
                                                <textarea class="form-control"  id="exampleTextarea1" rows="10" name="des"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2"></div>
                                    <div class="col-md-4">
                                        <c:if test="${product!=null}">
                                            <img src="${pageContext.request.contextPath}/image/${product.img}" style="border-radius: 0px;width: 100%">
                                            <input type="hidden" value="${product.img}" name="imgUp"/>
                                        </c:if>
                                    </div>
                                </div> 
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label"></label>
                                            <div class="col-sm-9">
                                                <button type="submit" class="btn btn-danger mr-2">Lưu</button>
                                                <button class="btn btn-light" type="reset">Hủy</button>
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
