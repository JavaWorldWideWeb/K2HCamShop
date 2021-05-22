/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sv.iuh.project.dao.ProductDao;
import sv.iuh.project.model.Product;

/**
 *
 * @author Tuan Khang
 */
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;

    @Override
    public boolean create(Product object) {
        return productDao.create(object);
    }

    @Override
    public List<Product> getAll() {
        return productDao.getAll();
    }
    @Override
    public boolean update(Product object) {
        return productDao.update(object);
    }

    @Override
    public boolean delete(Product object) {
        return productDao.delete(object);
    }

    @Override
    public Product findById(int categoryId) {
        return productDao.findById(categoryId);
    }
}