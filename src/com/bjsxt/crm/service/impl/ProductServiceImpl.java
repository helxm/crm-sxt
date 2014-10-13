package com.bjsxt.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.po.Customer;
import com.bjsxt.crm.po.Product;
import com.bjsxt.crm.service.ProductService;

@Component
public class ProductServiceImpl implements ProductService {
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	/**
	 * 添加客户
	 */
	public void add(Customer customer) {
		hibernateTemplate.save(customer);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Product> findAll() {
		List<Product> list = hibernateTemplate.find("from Product");
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> findAllAvailable() {
		return hibernateTemplate.find("from Product p where p.available=true");
	}
	//测试
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext(
				new String[]{"applicationContext.xml"});
		
		ProductService  productService = (ProductService) ac.getBean("productServiceImpl");
		System.out.println(productService.getPrice(1, 1));
//		productService.findAll();
	}
	public void addProduct(Product product) {
		hibernateTemplate.save(product);
	}
	public double getPrice(int customer_id, int product_id) {
		Customer customer = (Customer) hibernateTemplate.get(Customer.class, customer_id);
		Product product = (Product) hibernateTemplate.get(Product.class, product_id);
		
		if(customer.getLevel()!=null && customer.getLevel().equals("1")){
			return product.getP1()*product.getPrice()/10;
		}else if(customer.getLevel()!=null && customer.getLevel().equals("2")){
			return product.getP2()*product.getPrice()/10;
		}else if(customer.getLevel()!=null && customer.getLevel().equals("3")){
			return product.getP3()*product.getPrice()/10;
		}else{
			return product.getPrice();
		}
	}
	public Product getProduct(Integer pid) {
		return (Product) hibernateTemplate.get(Product.class, pid);
	}
//	删除商品
	public void delProduct(Integer id) {
		Product product = (Product) hibernateTemplate.get(Product.class, id);
		product.setAvailable(false);
	}
//	恢复使用
	public void reUseProduct(Integer id) {
		Product product = (Product) hibernateTemplate.get(Product.class, id);
		product.setAvailable(true);
//		hibernateTemplate.update(product);
	}
	public void delProductReal(Integer pid) {
		Product product = (Product) hibernateTemplate.get(Product.class, pid);
		hibernateTemplate.delete(product);
	}

}
