/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.dao;

import java.util.List;
import sv.iuh.project.model.Product;
import sv.iuh.project.model.ProductBrand;
import sv.iuh.project.model.ProductCategory;

/**
 *
 * @author Tuan Khang
 */
public interface ProductDao {
    public List<Product> getAll();
    
    // update
    public boolean update(Product object);

    // delete
    public boolean delete(Product object);

    // find by id
    public Product findById(int categoryId);
    
    public boolean create(Product object);
}
