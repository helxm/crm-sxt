package com.bjsxt.crm.service;

import java.util.List;

import com.bjsxt.crm.po.Product;

public interface ProductService {
	public List<Product> findAll();

	public List<Product> findAllAvailable();

	public void addProduct(Product product);

	public double getPrice(int customer_id, int product_id);

	public void delProduct(Integer id);

	public void reUseProduct(Integer id);

	public Product getProduct(Integer pid);

	public void delProductReal(Integer pid);
}
