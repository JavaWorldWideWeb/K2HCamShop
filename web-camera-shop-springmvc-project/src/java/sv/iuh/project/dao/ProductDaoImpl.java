/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;
import sv.iuh.project.model.Product;
import sv.iuh.project.model.ProductCategory;
import sv.iuh.project.util.HibernateUtil;

/**
 *
 * @author Tuan Khang
 */
@Repository
public class ProductDaoImpl implements ProductDao {

    @Override
    
    public List<Product> getAll() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Product");
            List<Product> list = query.list();
            transaction.commit();
            return list;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return null;

    }

    @Override
    public List<Product> getNewProduct() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Product order by productID desc");
            query.setMaxResults(8);
            List<Product> list = query.list();
            transaction.commit();
            return list;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return null;

    }

    @Override
    public boolean create(Product object) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(object);
            transaction.commit();
            return true;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
            session.clear();
            session.flush();
            session.close();
        }
        return false;
    }

    @Override
    public boolean update(Product object) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.update(object);
            transaction.commit();
            return true;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
            session.clear();
            session.flush();
            session.close();
        }
        return false;
    }

    @Override
    public boolean delete(Product object) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.delete(object);
            transaction.commit();
            return true;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return false;
    }

    @Override
    public Product findById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Product WHERE ProductID = :ProductID");
            query.setInteger("ProductID", id);
            Product obj = (Product) query.uniqueResult();
            transaction.commit();
            return obj;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return null;
    }

    @Override
    public List<Product> getListNav(int start, int limit) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Product");
            query.setFirstResult(start);
            query.setMaxResults(limit);
            List<Product> list = query.list();
            transaction.commit();
            return list;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return null;
    }

    @Override
    public Long totalItem() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("select count(p) from Product p");
            Long count = (Long) query.list().get(0);
            transaction.commit();
            return count;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return null;
    }

    @Override
    public List<Product> getListByBrand(int brandId, String name) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            List<Product> obj = new ArrayList<Product>();
            if (brandId == 0 && name != null) {
                Query query = session.createQuery("FROM Product WHERE ProductName like:ProductName");
                query.setString("ProductName", "%" + name + "%");
                obj = query.list();
            }
            if (brandId != 0 && name == null) {
                Query query = session.createQuery("FROM Product WHERE ProductBrandID = :ProductBrandID");
                query.setInteger("ProductBrandID", brandId);
                obj = query.list();
            }
            if (brandId != 0 && name != null) {
                Query query = session.createQuery("FROM Product WHERE ProductBrandID = :ProductBrandID and ProductName like:ProductName");
                query.setInteger("ProductBrandID", brandId);
                query.setString("ProductName", "%" + name + "%");
                obj = query.list();
            }
            transaction.commit();
            return obj;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return null;
    }

    @Override
    public List<Product> getListBrand(int brandId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            List<Product> obj = new ArrayList<Product>();
            Query query = session.createQuery("FROM Product WHERE ProductBrandID = :ProductBrandID");
            query.setInteger("ProductBrandID", brandId);
            obj = query.list();
            transaction.commit();
            return obj;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return null;
    }
}
