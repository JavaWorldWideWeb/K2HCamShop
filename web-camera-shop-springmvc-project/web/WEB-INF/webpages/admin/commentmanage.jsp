<%-- 
    Document   : commentmanage
    Created on : May 31, 2021, 12:42:45 AM
    Author     : Tuan Khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp" %>
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
        <!-- partial -->

        <div class="main-panel">

            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">QUẢN LÝ BÌNH LUẬN</h4>
                    <p class="card-description"><code>DANH SÁCH BÌNH LUẬN</code> 
                    </p>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Khách hàng bình luận</th>
                                <th>Sản phẩm</th>
                                <th>Ảnh sản phẩm</th>
                                <th>Nội dung bình luận</th>
                                <th>Đánh giá</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="cmt">
                                <tr>
                                    <td>${cmt.userID.username}</td>
                                    <td>${cmt.productID.productName}</td>
                                    <td><img src="${pageContext.request.contextPath}/image/${cmt.productID.img}" style="border-radius: 0px;width: 150px;height: 80px"></td>
                                    <td>${cmt.commentContent}</td>
                                    <td>${cmt.vote}</td>
                                    <td><a href="#" class="delete" data-toggle="modal" data-target="#myModal"><i class="fas fa-trash" style="color: red" data-toggle
                                                                                                                 ="tooltip" title="Delete"></i></a>
                                        <input type="hidden" name="id" id="id" value="${pb.productBrandID}">
                                        <a href="showformupdate?id=${pb.productBrandID}" title="Detail"><i class="fas fa-pen-square"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <form action="<c:url value="/productbrand/remove"/>" >
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Cảnh báo thương hiệu này sẽ bị xóa !!!</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-danger" >Xóa</button>
                                <input type="hidden" name="id" id="id">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- main-panel ends -->
        <script src="<c:url value="/resources/vendors/js/vendor.bundle.base.js"/>"></script>
        <script src="<c:url value="/resources/vendors/chart.js/Chart.min.js"/>"></script>
        <script src="<c:url value="/resources/vendors/moment/moment.min.js"/>"></script>
        <script src="<c:url value="/resources/vendors/daterangepicker/daterangepicker.js"/>"></script>
        <script src="<c:url value="/resources/vendors/chartist/chartist.min.js"/>"></script>
        <script src="<c:url value="/resources/js/off-canvas.js"/>"></script>
        <script src="<c:url value="/resources/js/dashboard.js"/>"></script>
        <script src="<c:url value="/resources/js/misc.js"/>"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
                $('table .delete').on('click', function () {
                    var id = $(this).parent().find("#id").val();
                    $('#myModal #id').val(id);
                });
            });
        </script>
    </body>
</html>
