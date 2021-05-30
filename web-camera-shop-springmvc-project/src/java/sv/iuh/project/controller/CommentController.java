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
import sv.iuh.project.model.Comment;
import sv.iuh.project.model.UserShop;
import sv.iuh.project.service.CommentService;
import sv.iuh.project.service.ProductService;

/**
 *
 * @author Tuan Khang
 */
@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private ProductService productService;
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String viewProductSave(ModelMap mm, HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        UserShop userShop=(UserShop) session.getAttribute("userlogin");
        int productId = Integer.parseInt(request.getParameter("productId"));
        String cmt=request.getParameter("cmt");
        int rating=Integer.parseInt(request.getParameter("rating"));
        Comment comment= new Comment();
        comment.setProductID(productService.findById(productId));
        comment.setUserID(userShop);
        comment.setCommentContent(cmt);
        comment.setVote(rating);
        commentService.create(comment);
        mm.put("listComment", commentService.getAll());
        return "redirect:/product/detail?id="+productId+"";
    }
}
