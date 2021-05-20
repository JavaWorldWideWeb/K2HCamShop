/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.dao;

import sv.iuh.project.model.Product;

/**
 *
 * @author Tuan Khang
 */
public interface ProductDao {
     // create
    public boolean create(Product object);

    // update
    public boolean update(Product object);

    // delete
    public boolean delete(Product object);

//    // find by id
//    public Category findById(int categoryId);
//
//    // load list category
//    public List<Category> getAll();
}
