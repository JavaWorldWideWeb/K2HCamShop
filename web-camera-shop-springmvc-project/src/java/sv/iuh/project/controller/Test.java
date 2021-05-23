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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import sv.iuh.project.service.ProductBrandService;

/**
 *
 * @author Tuan Khang
 */
@Controller
public class Test {

    @Autowired
    private ProductBrandService productBrandService;
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String viewHome(ModelMap mm,HttpSession session) {
        mm.put("listbrand", productBrandService.getAll());
        return "user/dashboard";
    }
    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String viewAbout(ModelMap mm) {
        return "user/about";
    }
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String viewLogin(ModelMap mm) {
        return "user/login";
    }
    @RequestMapping("/admin")
    public String adminDashboard(){
        return "admin/dashboard";
    }
}
