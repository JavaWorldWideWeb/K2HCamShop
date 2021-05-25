<%-- 
    Document   : orderManagement
    Created on : May 21, 2021, 9:57:08 AM
    Author     : Thanh Hoai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Order Management</title>
        <link rel="stylesheet" href="<c:url value="/resources/admin/css/style.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value="/resources/vendors/simple-line-icons/css/simple-line-icons.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value="/resources/vendors/css/vendor.bundle.base.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value="/resources/vendors/flag-icon-css/css/flag-icon.min.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value="/resources/vendors/daterangepicker/daterangepicker.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value="/resources/vendors/chartist/chartist.min.css"/>" rel='stylesheet' type='text/css'>
        
        
        <link rel="icon" href="<c:url value="/resources/images/LoadLogo.png"/>">
        <link rel="stylesheet" href="<c:url value="/resources/Css/orderManagement.css"/>" rel='stylesheet' type='text/css'>
        
    </head>
    <body>
        <div class="main-panel">
            <div class="card">
                <div class="card-body">
                    <h1 style="margin:0; display: inline-block; color: #007bff"><i class="icon-list" style="color: #007bff"></i>  Danh sách đơn hàng</h1>
                    <button type="button" class="btn btn-primary btn-fw" style="float:right;">
                        <font style="vertical-align: inherit;">
                        <font style="vertical-align: inherit;">Tạo đơn hàng</font></font></button>
                    <br/><br/>
                    
                    <div class="tab">
                        <button class="tablinks" onclick="showContent(event, 'AllOrders')" id="defaultOpen">Tất cả đơn hàng</button>
                        <button class="tablinks" onclick="showContent(event, 'NewOrders')">Đơn hàng mới</button>
                        <button class="tablinks" onclick="showContent(event, 'Unpaid')">Chưa thanh toán</button>
                    </div>

                    <div id="AllOrders" class="tabcontent">
                        <table class="table table-hover">
                          <thead>
                              <tr>
                                  <th style="font-weight: bold;">Mã</th>
                                  <th style="font-weight: bold;">Ngày đặt</th>
                                  <th style="font-weight: bold;">Khách hàng</th>
                                  <th style="font-weight: bold;">Thanh toán</th>
                                  <th style="font-weight: bold;">Tổng tiền</th>
                                  <th></th>
                              </tr>
                          </thead>
                          <tbody>
                              <c:forEach items="${list}" var="od">
                                  <tr class="onRow">
                                      <td>${od.orderID}</td>
                                      <td>${od.dateOrder}</td>
                                      <td>${od.userID.fullName}</td>
                                      <td>${od.statusOrder}</td>
                                      <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${od.totalMoney}" /></td>
                                      
                                      <td>
                                           <a class="detail" href="#" data-toggle="modal" data-target="#myModal" >xem chi tiết</a>
                                      </td>
                                  </tr>
                              </c:forEach>
                          </tbody>
                      </table>
                    </div>

                    <div id="NewOrders" class="tabcontent">
                     <table class="table table-hover">
                          <thead>
                              <tr>
                                  <th style="font-weight: bold;">Mã</th>
                                  <th style="font-weight: bold;">Ngày đặt</th>
                                  <th style="font-weight: bold;">Khách hàng</th>
                                  <th style="font-weight: bold;">Thanh toán</th>
                                  <th style="font-weight: bold;">Tổng tiền</th>
                              </tr>
                          </thead>
                          <tbody>
                              <c:forEach items="${newlist}" var="od">
                                  <tr>
                                      <td>${od.orderID}</td>
                                      <td>${od.dateOrder}</td>
                                      <td>${od.userID.fullName}</td>
                                      <td>${od.statusOrder}</td>
                                      <td>${od.totalMoney}</td>
                                     
                                  </tr>
                              </c:forEach>
                          </tbody>
                      </table> 
                    </div>
                    
                    <div id="Unpaid" class="tabcontent">
                      <table class="table table-hover">
                          <thead>
                              <tr>
                                  <th style="font-weight: bold;">Mã</th>
                                  <th style="font-weight: bold;">Ngày đặt</th>
                                  <th style="font-weight: bold;">Khách hàng</th>
                                  <th style="font-weight: bold;">Thanh toán</th>
                                  <th style="font-weight: bold;">Tổng tiền</th>
                              </tr>
                          </thead>
                          <tbody>
                              <c:forEach items="${unpaidlist}" var="od">
                                  <tr>
                                      <td>${od.orderID}</td>
                                      <td>${od.dateOrder}</td>
                                      <td>${od.userID.fullName}</td>
                                      <td>${od.statusOrder}</td>
                                      <td>${od.totalMoney}</td>
                                     
                                  </tr>
                              </c:forEach>
                          </tbody>
                      </table>
                    </div>
                    
                    <!-- The Modal -->
                    <div class="modal fade" id="myModal">
                      <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                          <!-- Modal Header -->
                          <div class="modal-header">
                              <h4 class="modal-title" id="cusName" style="color: blue">Modal Heading</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                          </div>

                          <!-- Modal body -->
                          <div class="modal-body">
                            <table class="table table-hover">
                          <thead>
                              <tr>
                                  <th style="font-weight: bold;">Mã sản phẩm</th>
                                  <th style="font-weight: bold;">Tên sản phẩm</th>
                                  <th style="font-weight: bold;">Hình ảnh</th>
                                  <th style="font-weight: bold;">Số lượng</th>
                                  <th style="font-weight: bold;">Đơn giá</th>
                                  <th style="font-weight: bold;">Tổng tiền</th>
                              </tr>
                          </thead>
                          <tbody>
                              <c:forEach items="${unpaidlist}" var="od">
                                  <tr>
                                      <td>${od.orderID}</td>
                                      <td>${od.dateOrder}</td>
                                      <td>${od.userID.fullName}</td>
                                      <td>${od.statusOrder}</td>
                                      <td>${od.totalMoney}</td>
                                     
                                  </tr>
                              </c:forEach>
                          </tbody>
                      </table>
                          </div>

                          <!-- Modal footer -->
                          <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                          </div>
                          
                        </div>
                      </div>
                    </div>
  
                </div>
            </div>
        </div>
        
        <script>
            function showContent(evt, cityName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                  tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                  tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";
            }
            document.getElementById("defaultOpen").click();
        </script>
        
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script type="text/javascript">
            $(function () {
                $('.table tr').mouseover(function (e) {
                    var ma = $(this).closest('.onRow').find('td:nth-child(3)').text();
                    $('.detail').click(function (e) {
                        /*e.preventDefault();*/
                        document.getElementById("cusName").innerHTML = "Chi tiết hóa đơn của khách hàng " + ma;
                        
                    });

                });
            });
        </script>

        
        <!-- main-panel ends -->
        <script src="<c:url value="/resources/vendors/js/vendor.bundle.base.js"/>"></script>
        <script src="<c:url value="/resources/vendors/chart.js/Chart.min.js"/>"></script>
        <script src="<c:url value="/resources/vendors/moment/moment.min.js"/>"></script>
        <script src="<c:url value="/resources/vendors/daterangepicker/daterangepicker.js"/>"></script>
        <script src="<c:url value="/resources/vendors/chartist/chartist.min.js"/>"></script>
        <script src="<c:url value="/resources/js/off-canvas.js"/>"></script>
        <script src="<c:url value="/resources/js/dashboard.js"/>"></script>
        <script src="<c:url value="/resources/js/misc.js"/>"></script>
    </body>
</html>
