/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.service;

import java.util.List;
import sv.iuh.project.model.Product;

/**
 *
 * @author Tuan Khang
 */
public interface ProductService {
    // create
    public boolean create(Product object);
    
    public List<Product> getAll();
     // update
    public boolean update(Product object);

    // delete
    public boolean delete(Product object);

    // find by id
    public Product findById(int categoryId);
}
