/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.annotations.common.util.impl.Log_$logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import sv.iuh.project.model.ProductBrand;
import sv.iuh.project.service.ProductBrandService;

/**
 *
 * @author Tuan Khang
 */
@Controller
@RequestMapping("/productbrand")
public class ProductBrandManage {

    @Autowired
    private ProductBrandService productBrandService;

    @RequestMapping("/show")
    public String viewHome(ModelMap mm) {
        mm.put("list", productBrandService.getAll());
        return "admin/productbrandmanage";
    }

    @RequestMapping(value = "/showform", method = RequestMethod.GET)
    public String viewProductNew(ModelMap mm, HttpSession session) {
        return "admin/productbrandform";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String viewProductSave(ModelMap mm, HttpSession session, HttpServletRequest request,@RequestParam(value = "image") MultipartFile photo) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String nation = request.getParameter("nation");
        ProductBrand productBrand = new ProductBrand();
        productBrand.setProductBrandName(name);
        productBrand.setNationalProduction(nation);
        productBrand.setImg(saveFile(photo));
        if ("".equals(request.getParameter("id"))) {
            productBrandService.create(productBrand);
            mm.put("listProductBrand", productBrandService.getAll());
            mm.put("success", "Thêm thành công");
            return "admin/productbrandform";
        } else {
            int id = Integer.parseInt(request.getParameter("id"));
            productBrand.setProductBrandID(id);
            productBrandService.update(productBrand);
            mm.put("productBrand", productBrand);
            mm.put("listProductBrand", productBrandService.getAll());
            String inf="Sua thanh cong";
            return "redirect:/productbrand/showformupdate?id="+id+"&success="+inf+"";
        }
    }
    @RequestMapping(value = "/showformupdate")
    public String showFormUdate(ModelMap mm,@RequestParam("id") int id,@RequestParam(required = false) String success) {
        ProductBrand productBrand=productBrandService.findById(id);
        mm.put("productBrand", productBrand);
        mm.put("success", success);
        return "admin/productbrandform";
    }
    @RequestMapping(value = "remove")
    public String viewProductRemove(ModelMap mm, HttpSession session, @RequestParam("id") int id) {
        ProductBrand p = productBrandService.findById(id);
        if (p != null) {
            productBrandService.delete(p);
        }
        mm.put("list", productBrandService.getAll());
        return "admin/productbrandmanage";
    }
    private String saveFile(MultipartFile file) {
        if (null != file && !file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                String rootPath = System.getProperty("catalina.home");
                File dir = new File(rootPath + File.separator + "assets/user/imgbrand");
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                String name = String.valueOf(new Date().getTime() + ".jpg");
                File serverFile = new File(dir.getAbsoluteFile() + File.separator + name);
                System.out.println("Path on server: " + serverFile.getPath());
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
                return name;
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Not exist");

        }
        return null;
    }
}
