/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import sv.iuh.project.model.OrderDetail;
import sv.iuh.project.model.OrderProduct;
import sv.iuh.project.service.OrderDetailService;
import sv.iuh.project.service.OrderManagementService;

/**
 *
 * @author Thanh Hoai
 */
@Controller
@RequestMapping(value = "/orderDetailManagement")
public class ControllDetailManagement {
    @Autowired
    private OrderDetailService orderDetailService;
    
    @Autowired 
    private OrderManagementService orderManagementService;
       
    @RequestMapping("/show/{orderID}.html")
    public String viewOrderDetail(ModelMap mm, HttpSession session, @PathVariable("orderID") int orderId){
        mm.put("listDetail", orderDetailService.getOrdersOfUser(orderId));
         session.setAttribute("OrderID", orderId);
        return "admin/orderDetailManagement";
    }
    
     @RequestMapping(value = "remove")
    public String viewOrderProductRemove(ModelMap mm, HttpSession session, @RequestParam("id") int id, @RequestParam("orderID") int orderID) {
         OrderDetail orderDetail = orderDetailService.findById(id);
         double total = orderDetail.getTotal();
        if (orderDetail != null) {
            orderDetailService.delete(orderDetail);
        }
        OrderProduct orderProduct = orderManagementService.findById(orderID);
        orderProduct.setTotalMoney(orderProduct.getTotalMoney() - total);
        orderManagementService.update(orderProduct);
        mm.put("listDetail", orderDetailService.getOrdersOfUser(orderID));
        return "admin/orderDetailManagement";
    }
}
