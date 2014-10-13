package com.bjsxt.crm.action.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.dto.Order_dto;
import com.bjsxt.crm.dto.Order_dto2;
import com.bjsxt.crm.po.Customer;
import com.bjsxt.crm.po.Order;
import com.bjsxt.crm.po.Product;
import com.bjsxt.crm.service.CustomerService;
import com.bjsxt.crm.service.ProductService;
import com.bjsxt.crm.service.order.OrderService;
import com.bjsxt.crm.util.OrderNumberGenerate;
import com.google.gson.Gson;

@Component
@Scope(value="prototype")
public class OrderAction {
	private OrderService<Order> orderService ;
	private CustomerService customerService;
	private List<Order> orders;
	private Order order;
	private List<Customer> customers;
	private List<Product> products;
	private ProductService productService;
	private double order_money;
	
	private Integer operate;//操作状态码，2为成功，1为失败
	public String shows(){
		orders =  orderService.findAll();
		return "show";
	}
	public String add(){
		/*Customer customer = customerService.findCustomerById(order.getCustomer().getId());
		Product product = productService.getProduct(order.getProduct().getId());
		order.setCustomer(customer);
		order.setProduct(product);*/
		orderService.add(order);
		this.operate=2;
		return "add";
	}
	public String update(){
		orderService.update(order);
		this.operate=2;
		return "update";
	}
	public String update_pre(){
		Order_dto order_dto =  (Order_dto) orderService.findByDto(order);
		//order = orderService.find(order);
		String json = toJson(order_dto);
		System.err.println("********************update_pre********************"+json);
		return null;
	}
	/**
	 * 选择客户
	 * @return
	 */
	public String selCu(){
		customers = customerService.findAll();
		//System.err.println("selCu"+customers.size());
		List<Order_dto2> customer_orders = new ArrayList<Order_dto2>();
		for(Customer customer : customers ){
			Order_dto2 customer_order = new Order_dto2();
			customer_order.setId(customer.getId());
			customer_order.setName(customer.getName());
			customer_orders.add(customer_order);
		}
		toJson(customer_orders);
		return null;
	}
	/**
	 * 选择商品
	 * @return
	 */
	public String selPro(){
		products = productService.findAll();
		List<Order_dto2> dtos = new ArrayList<Order_dto2>();
		for(Product product : products ){
			Order_dto2 dto = new Order_dto2();
			dto.setId(product.getId());
			dto.setName(product.getName());
			dtos.add(dto);
		}
		toJson(dtos);
		return null;
	}
	/**
	 * 计算订单价格
	 * @return
	 */
	public String calucatePrice(){
		order_money = productService.getPrice(order.getCustomer().getId(), order.getProduct().getId());
		order_money = order_money*order.getNum();
		toJson(order_money);
		return null;
	}
	/**
	 * 计算订单编号
	 * @return
	 */
	public String calucateOr_number(){
		order = OrderNumberGenerate.getOrNumber(order);
		toJson(order);
		return null;
	}
	
	/**
	 * 向页面写入ajax数据
	 * 
	 * @param obj
	 * @return
	 */
	private String toJson(Object obj) {
		HttpServletResponse response =  ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		String json = null;
		try {
			json = new Gson().toJson(obj);
			response.getWriter().write(json);
			System.err.println("json-----------------:"+json);
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return json;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	public OrderService<Order> getOrderService() {
		return orderService;
	}
	@Resource(name="orderServiceImpl")
	public void setOrderService(OrderService<Order> orderService) {
		this.orderService = orderService;
	}
	public List<Order> getOrders() {
		return orders;
	}
	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public CustomerService getCustomerService() {
		return customerService;
	}
	@Resource
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	public List<Customer> getCustomers() {
		return customers;
	}
	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}
	public ProductService getProductService() {
		return productService;
	}
	@Resource
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	public double getOrder_money() {
		return order_money;
	}
	public void setOrder_money(double order_money) {
		this.order_money = order_money;
	}
	public Integer getOperate() {
		return operate;
	}
	public void setOperate(Integer operate) {
		this.operate = operate;
	}
	
}
