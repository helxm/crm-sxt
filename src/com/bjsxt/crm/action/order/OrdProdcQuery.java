package com.bjsxt.crm.action.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.dto.CusData;
import com.bjsxt.crm.dto.OpCusDto;
import com.bjsxt.crm.po.Customer;
import com.bjsxt.crm.po.Order;
import com.bjsxt.crm.po.OrderStatu;
import com.bjsxt.crm.po.Product;
import com.bjsxt.crm.service.CustomerService;
import com.bjsxt.crm.service.ProductService;
import com.bjsxt.crm.service.order.OrderService;
import com.google.gson.Gson;

@Component
@Scope(value="prototype")
public class OrdProdcQuery {
	private OrderService<Order> orderService ;
	private CustomerService customerService;
	private List<Order> orders;
	private Order order;
	private List<Customer> customers;
	private List<Product> products;
	private ProductService productService;

	private Integer statuNum;//订单状态码

	private OrderStatu orderStatu;

	public String query(){
		
		return "ordPro";
	}
	/**
	 * 显示客户列表
	 * @return
	 */
	public String ajaxProduct(){
		OpCusDto opCusDto = new OpCusDto();
		opCusDto.setCode(200);
		opCusDto.setMessage("操作成功!");
		
		customers = customerService.findAll();
		List<CusData> cusDatas = new ArrayList<CusData>();
		for(Customer customer : customers){
			CusData cusData = new CusData();
			if(customer!=null && customer.getId()!=null){
				cusData.setId(customer.getId());
			}
			if(customer!=null && customer.getName()!=null){
				cusData.setName(customer.getName());
			}
			cusDatas.add(cusData);
		}
		opCusDto.setData(cusDatas);
		toJson(opCusDto);
		return null;
	}
	/**

	
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

	public CustomerService getCustomerService() {
		return customerService;
	}
	@Resource
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}

	public ProductService getProductService() {
		return productService;
	}
	@Resource
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

}
