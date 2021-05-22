/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.dao;

import java.util.List;
import sv.iuh.project.model.OrderProduct;

/**
 *
 * @author Thanh Hoai
 */
public interface OrderManagementDao {
    
    public boolean create(OrderProduct object);
    
    public boolean update(OrderProduct object);
    
    public boolean delete(OrderProduct object);
    
    public OrderProduct findById(int id);
    
    public List<OrderProduct> getAll();
}
