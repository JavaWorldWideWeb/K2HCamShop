/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.portlet.ModelAndView;
import sv.iuh.project.model.ProductBrand;
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
    public String viewHome(ModelMap mm) {
        mm.put("listCategory", productBrandService.getAll());
        return "admin/dashboard";
    }
}
