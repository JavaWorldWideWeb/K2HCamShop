<%-- 
    Document   : orderManagement
    Created on : May 21, 2021, 9:57:08 AM
    Author     : Thanh Hoai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                    <h1 style="margin:0; display: inline-block;"><i class="icon-list"></i>  Danh sách đơn hàng</h1>
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
                                  <th>Mã</th>
                                  <th>Ngày đặt</th>
                                  <th>Khách hàng</th>
                                  <th>Thanh toán</th>
                                  <th>Tổng tiền</th>
                              </tr>
                          </thead>
                          <tbody>
                              <c:forEach items="${list}" var="od">
                                  <tr>
                                      <td>${od.orderID}</td>
                                      <td>${od.dateOrder}</td>
                                      <td>${od.userID.username}</td>
                                      <td>${od.statusOrder}</td>
                                      <td>${od.totalMoney}</td>
                                     
                                  </tr>
                              </c:forEach>
                          </tbody>
                      </table>
                    </div>

                    <div id="NewOrders" class="tabcontent">
                        <h2>new order</h2>
                     <table class="table table-hover">
                          <thead>
                              <tr>
                                  <th>Mã</th>
                                  <th>Ngày đặt</th>
                                  <th>Khách hàng</th>
                                  <th>Thanh toán</th>
                                  <th>Tổng tiền</th>
                              </tr>
                          </thead>
                          <tbody>
                              <c:forEach items="${newlist}" var="od">
                                  <tr>
                                      <td>${od.orderID}</td>
                                      <td>${od.dateOrder}</td>
                                      <td>${od.userID}</td>
                                      <td>${od.statusOrder}</td>
                                      <td>${od.totalMoney}</td>
                                     
                                  </tr>
                              </c:forEach>
                          </tbody>
                      </table> 
                    </div>
                    
                    <div id="Unpaid" class="tabcontent">
                        <h2>Unpaid</h2>
                      <table class="table table-hover">
                          <thead>
                              <tr>
                                  <th>Mã</th>
                                  <th>Ngày đặt</th>
                                  <th>Khách hàng</th>
                                  <th>Thanh toán</th>
                                  <th>Tổng tiền</th>
                              </tr>
                          </thead>
                          <tbody>
                              <c:forEach items="${unpaidlist}" var="od">
                                  <tr>
                                      <td>${od.orderID}</td>
                                      <td>${od.dateOrder}</td>
                                      <td>${od.userID}</td>
                                      <td>${od.statusOrder}</td>
                                      <td>${od.totalMoney}</td>
                                     
                                  </tr>
                              </c:forEach>
                          </tbody>
                      </table>
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
