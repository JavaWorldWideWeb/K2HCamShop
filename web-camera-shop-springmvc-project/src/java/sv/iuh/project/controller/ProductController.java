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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import sv.iuh.project.model.Product;
import sv.iuh.project.model.ProductBrand;
import sv.iuh.project.model.ProductCategory;
import sv.iuh.project.service.ProductBrandService;
import sv.iuh.project.service.ProductCategoryService;
import sv.iuh.project.service.ProductService;

/**
 *
 * @author Tuan Khang
 */
@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductBrandService productBrandService;
    @Autowired
    private ProductCategoryService productCategoryService;
    @Autowired
    private ProductService productService;

    @RequestMapping("/show")
    public String viewAdmin(ModelMap mm,HttpSession session) {
        mm.put("list", productService.getAll());
        mm.put("user", session.getAttribute("userlogin"));
        return "admin/productmanage";
    }

    @RequestMapping("/showproductuser")
    public String viewProduct(ModelMap mm) {
        mm.put("list", productService.getAll());
        mm.put("listbrand", productBrandService.getAll());
        return "user/product";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public String viewProductSave(ModelMap mm, HttpSession session, HttpServletRequest request,
            @RequestParam(value = "image") MultipartFile photo) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String description= request.getParameter("des");
        ProductBrand productBrand = productBrandService.findById(Integer.parseInt(request.getParameter("brand")));
        ProductCategory productCategory = productCategoryService.findById(Integer.parseInt(request.getParameter("cate")));
        String warranTyperiod=request.getParameter("warranTyperiod");
        Product product= new Product(name, price, quantity, color, description, warranTyperiod, saveFile(photo), productBrand, productCategory);
        if ("".equals(request.getParameter("id"))) {
            productService.create(product);
            mm.put("success", "Thêm thành công");
            return "redirect:/product/showform";
        } else {
            int id = Integer.parseInt(request.getParameter("id"));
            product.setProductID(id);
            productService.update(product);
            mm.put("productCategory", productCategory);
            mm.put("listProductCategory", productCategoryService.getAll());
            String inf = "Sua thanh cong";
            return "redirect:/product/showformupdate?id=" + id + "&success=" + inf + "";
        }
    }

    @RequestMapping(value = "/showform", method = RequestMethod.GET)
    public String viewProductNew(ModelMap mm, HttpSession session) {
        mm.put("listcate", productCategoryService.getAll());
        mm.put("listbrand", productBrandService.getAll());
        return "admin/productform";
    }

    @RequestMapping(value = "/showformupdate")
    public String showFormUdate(ModelMap mm, @RequestParam("id") int id, @RequestParam(required = false) String success) {

        Product product = productService.findById(id);
        ProductCategory productCategory = productCategoryService.findById(product.getProductCategoryID().getProductCategoryID());
        ProductBrand productBrand = productBrandService.findById(product.getProductBrandID().getProductBrandID());
        mm.put("listcate", productCategoryService.getAll());
        mm.put("listbrand", productBrandService.getAll());
        mm.put("category", productCategory);
        mm.put("product", product);
        mm.put("brand", productBrand);
        mm.put("success", success);
        return "admin/productform";
    }

    private String saveFile(MultipartFile file) {
        if (null != file && !file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                String rootPath = System.getProperty("catalina.home");
                File dir = new File(rootPath + File.separator + "assets/user/imgproduct");
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
//User
    @RequestMapping(value = "remove")
    public String viewRemove(ModelMap mm, HttpSession session, @RequestParam("id") int id) {
        Product p = productService.findById(id);
        if (p != null) {
            productService.delete(p);
        }
        mm.put("list", productService.getAll());
        return "admin/productmanage";
    }
    @RequestMapping(value = "/detail")
    public String showDetailProduct(ModelMap mm, @RequestParam("id") int id) {

        Product product = productService.findById(id);
        mm.put("p", product);
        return "user/productdetail";
    }
}
