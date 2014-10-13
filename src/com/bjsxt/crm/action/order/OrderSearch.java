package com.bjsxt.crm.action.order;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.po.Customer;
import com.bjsxt.crm.po.Order;
import com.bjsxt.crm.po.OrderStatu;
import com.bjsxt.crm.po.Product;
import com.bjsxt.crm.service.CustomerService;
import com.bjsxt.crm.service.ProductService;
import com.bjsxt.crm.service.order.OrderService;

@Component
@Scope(value="prototype")
public class OrderSearch {
	private OrderService<Order> orderService ;
	private CustomerService customerService;
	private List<Order> orders;
	private Order order;
	private List<Customer> customers;
	private List<Product> products;
	private ProductService productService;
	private double order_money;
	
	private Integer operate;//操作状态码，2为成功，1为失败
	
	private Integer statuNum;//订单状态码
	private int orderby;//排序状态码，1--下单时间，2--订单状态，3--订单金额

	private int burTag;//退货单栏跳转标记
	private OrderStatu orderStatu;
	
	public String query(){
		
		return "ordPro";
	}
	/**
	 * 条件查询与排序
	 * @return
	 */
	public String showSeach(){
		if(orderStatu !=null && orderStatu.getStatuNum()!=null){//按状态查询
			orders =  orderService.findByStatu(orderStatu);
			if(orderStatu.getStatuNum()>-2){
				return "showSeach";
			}
			return "cancel";
		}
		orders =  orderService.findAll();
		if(orderby==1){//1--下单时间
			Collections.sort(orders, new Comparator<Order>() {
				public int compare(Order o1, Order o2) {
					if(o1.getTime()==null){
						return -1;
					}
					if(o2.getTime()==null){
						return 1;
					}
					return o2.getTime().compareTo(o1.getTime());
				}
			});	
		}
		if(orderby==2){//2--订单状态
			Collections.sort(orders, new Comparator<Order>() {
				public int compare(Order o1, Order o2) {
					if(o1.getStatu()==null || o1.getStatu().getStatuNum()==null){
						return -1;
					}
					if(o2.getStatu()==null || o2.getStatu().getStatuNum()==null){
						return 1;
					}
					return o2.getStatu().getStatuNum()-o1.getStatu().getStatuNum();
				}
			});	
		}
		if(orderby==3){//3--订单金额
			Collections.sort(orders, new Comparator<Order>() {
				public int compare(Order o1, Order o2) {
					return (int)(o2.getOrder_money()-o1.getOrder_money());
				}
			});	
		}
		return "orderaction";
		
	}
	
	
	/**
	 * 向页面写入ajax数据
	 * 
	 * @param obj
	 * @return
	 */
/*	private String toJson(Object obj) {
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
	}*/
	
	
	
	
	
	
	
	
	
	
	
	
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

	public Integer getStatuNum() {
		return statuNum;
	}

	public void setStatuNum(Integer statuNum) {
		this.statuNum = statuNum;
	}

	public OrderStatu getOrderStatu() {
		return orderStatu;
	}

	public void setOrderStatu(OrderStatu orderStatu) {
		this.orderStatu = orderStatu;
	}


	public int getOrderby() {
		return orderby;
	}


	public void setOrderby(int orderby) {
		this.orderby = orderby;
	}


	public int getBurTag() {
		return burTag;
	}


	public void setBurTag(int burTag) {
		this.burTag = burTag;
	}

}
