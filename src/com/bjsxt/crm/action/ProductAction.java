package com.bjsxt.crm.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.po.Product;
import com.bjsxt.crm.service.ProductService;

@Component
@Scope("prototype")
public class ProductAction {
	private String pname;
	private float pprice;
	private Integer pid;
	private float p1;
	private float p2;
	private float p3;
	private ProductService productService;
	private List<Product> list;
	private String serialnumber;

	/**
	 * 添加客户
	 * @return
	 */
	public String findAll() {
		this.list = productService.findAll();
		return "list2";
	}

	public String findAllAvailable() {
		this.list = productService.findAllAvailable();
		return "list";
	}

	public String addProduct() {
		Product product = new Product();
		product.setName(pname);
		product.setPrice(pprice);
		product.setSerialnumber(serialnumber);
		product.setP1(p1);
		product.setP2(p2);
		product.setP3(p3);
		product.setAvailable(true);
		productService.addProduct(product);
		return findAllAvailable();
	}

	public String delProduct() {
		productService.delProduct(pid);
		return findAllAvailable();
	}

	public String delProduct2() {
		productService.delProduct(pid);
		return findAll();
	}

	public String delProduct3() {
		productService.delProductReal(pid);
		return findAll();
	}

	public String reUseProduct() {
		productService.reUseProduct(pid);
		return findAll();
	}

	public String modifyProduct() {
		System.out.println(pid);
		Product product = productService.getProduct(pid);
		System.out.println(product.getName());
		product.setName(pname);
		product.setPrice(pprice);
		product.setSerialnumber(serialnumber);
		product.setP1(p1);
		product.setP2(p2);
		product.setP3(p3);

		productService.addProduct(product);
		return findAllAvailable();
	}

	public ProductService getProductService() {
		return productService;
	}

	public List<Product> getList() {
		return list;
	}

	public void setList(List<Product> list) {
		this.list = list;
	}

	@Resource
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public float getPprice() {
		return pprice;
	}

	public void setPprice(float pprice) {
		this.pprice = pprice;
	}

	public float getP1() {
		return p1;
	}

	public void setP1(float p1) {
		this.p1 = p1;
	}

	public float getP2() {
		return p2;
	}

	public void setP2(float p2) {
		this.p2 = p2;
	}

	public float getP3() {
		return p3;
	}

	public void setP3(float p3) {
		this.p3 = p3;
	}

	public String getSerialnumber() {
		return serialnumber;
	}

	public void setSerialnumber(String serialnumber) {
		this.serialnumber = serialnumber;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}
}
