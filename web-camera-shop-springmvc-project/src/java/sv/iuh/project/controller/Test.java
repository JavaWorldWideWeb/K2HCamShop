/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.controller;

import java.io.InputStream;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.portlet.ModelAndView;
import sv.iuh.project.model.ProductBrand;
import sv.iuh.project.service.ProductBrandService;

/**
 *
 * @author Tuan Khang
 */
@Controller
public class Test {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String viewHome(ModelMap mm) {
        return "user/dashboard";
    }
    @RequestMapping("/admin")
    public String adminDashboard(){
        return "admin/dashboard";
    }
}
