/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.controller;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import sv.iuh.project.model.Contact;
import sv.iuh.project.service.ContactService;

/**
 *
 * @author Thanh Hoai
 */
@Controller
@RequestMapping(value = "/contact")
public class ControllerContact {
    
    @Autowired
    private ContactService contactService;
    
    @RequestMapping("/show")
    public String viewHome(ModelMap mm) {
        return "user/contact";
    }
    
    @RequestMapping("/managementShow")
    public String viewHomeAdmin(ModelMap mm) {
        mm.put("list", contactService.getAll());
        return "admin/ContactManagement";
    }
    
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String viewSave(ModelMap mm, HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException{
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("uname");
        String email = request.getParameter("email");
        String comment = request.getParameter("comment");
        Contact contact = new Contact(name, email, comment);
        contactService.create(contact);
        mm.put("success", "Thêm thành công");
        return "redirect:/contact/show";
    }
  
}
