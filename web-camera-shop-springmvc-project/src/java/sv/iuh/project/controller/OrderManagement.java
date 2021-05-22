/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import sv.iuh.project.service.OrderManagementService;

/**
 *
 * @author Thanh Hoai
 */
@Controller
@RequestMapping("/orderManagement")
public class OrderManagement {
    
    @Autowired
    private OrderManagementService orderManagementService;
    
    @RequestMapping("/show")
    public String viewHome(ModelMap mm){
        mm.put("list", orderManagementService.getAll());
        Date date = new Date();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String dateString  = df.format(date);
        mm.put("newlist", orderManagementService.getOrdersByDate(dateString));
        mm.put("unpaidlist", orderManagementService.getOrdersUnpaid());
        return "admin/orderManagement";
    }
}


