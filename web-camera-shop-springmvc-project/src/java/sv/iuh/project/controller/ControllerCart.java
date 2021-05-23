/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import sv.iuh.project.model.Cart;
import sv.iuh.project.model.Product;
import sv.iuh.project.service.ProductService;

/**
 *
 * @author Thanh Hoai
 */
@Controller
@RequestMapping(value="/cart")
public class ControllerCart {
    
    @Autowired
    private ProductService productService;
    @RequestMapping(value = "/add/{productID}.html", method = RequestMethod.GET)
    public String viewAdd(ModelMap mm, HttpSession session, @PathVariable("productID") int productId) {
        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        Product product = productService.findById(productId);
        if (product != null) {
            if (cartItems.containsKey(productId)) {
                Cart item = cartItems.get(productId);
                item.setProduct(product);
                item.setQuantity(item.getQuantity() + 1);
                cartItems.put(productId, item);
            } else {
                Cart item = new Cart();
                item.setProduct(product);
                item.setQuantity(1);
                cartItems.put(productId, item);
            }
        }
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "user/cart";
    }
    
    @RequestMapping(value = "/sub/{productId}.html", method = RequestMethod.GET)
    public String viewUpdate(ModelMap mm, HttpSession session, @PathVariable("productId") long productId) {
        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        session.setAttribute("myCartItems", cartItems);
        return "user/cart";
    }
    
    @RequestMapping(value = "remove/{productId}.html", method = RequestMethod.GET)
    public String viewRemove(ModelMap mm, HttpSession session, @PathVariable("productId") long productId) {
        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        if (cartItems.containsKey(productId)) {
            cartItems.remove(productId);
        }
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "pages/cart";
    }
    
    public double totalPrice(HashMap<Integer, Cart> cartItems) {
        int count = 0;
        for (Map.Entry<Integer, Cart> list : cartItems.entrySet()) {
            count += list.getValue().getProduct().getPrice() * list.getValue().getQuantity();
        }
        return count;
    }
}
