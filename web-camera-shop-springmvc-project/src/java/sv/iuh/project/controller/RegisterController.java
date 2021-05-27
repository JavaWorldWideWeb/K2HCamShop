/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import sv.iuh.project.model.ProductBrand;
import sv.iuh.project.model.UserShop;
import sv.iuh.project.service.ProductBrandService;
import sv.iuh.project.service.RegisterService;

/**
 *
 * @author Hung
 */
@Controller
public class RegisterController {
    
    @Autowired
    private RegisterService registerService;
 
    @RequestMapping("/register")
    public String register(){
        return "user/register";
    }
    
    
    @RequestMapping(value = "/register/save", method = RequestMethod.POST)
    public String viewProductSave(ModelMap mm, HttpSession session, HttpServletRequest request,@RequestParam(value = "image",required = false) MultipartFile photo) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String fullName = request.getParameter("tendaydu");
        String name = request.getParameter("tendangnhap");
        String pass = request.getParameter("matkhau");
        String email = request.getParameter("email");
        String phone = request.getParameter("sodt");
        Date birth =  Date.valueOf(request.getParameter("ngaysinh"));
        String tinh = request.getParameter("calc_shipping_provinces");
        String quan = request.getParameter("calc_shipping_district");
        String diachi = request.getParameter("diachi");
        String address = " DiaChi " + diachi + " - Huyen/Quan " + quan + "- Tinh " + tinh;
        UserShop userShop = new UserShop();
        userShop.setFullName(fullName);
        userShop.setUsername(name);
        userShop.setPassword(pass);
        userShop.setEmail(email);
        userShop.setPhoneNumber(phone);
        userShop.setBirthday(birth);
        userShop.setAddress(address);
        userShop.setRole("user");
        userShop.setActive(0);
        //productBrand.setImg(saveFile(photo));
        
            registerService.create(userShop);
//            mm.put("listUserShop", registerService.getAll());
            mm.put("success", "Bạn đã đăng kí thành công vui lòng đăng nhập !!!");
            return "user/login";
       
    }
}
