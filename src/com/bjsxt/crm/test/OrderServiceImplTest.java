package com.bjsxt.crm.test;


import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bjsxt.crm.dto.Order_dto;
import com.bjsxt.crm.po.Customer;
import com.bjsxt.crm.po.Order;
import com.bjsxt.crm.po.OrderStatu;
import com.bjsxt.crm.service.CustomerService;
import com.bjsxt.crm.service.ProductService;
import com.bjsxt.crm.service.order.OrderService;

public class OrderServiceImplTest {

	@Test
	public void testAdd() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		@SuppressWarnings("unchecked")
		OrderService<Order> orderService = (OrderService<Order>) context.getBean("orderServiceImpl");
		Order bean = new Order();
		
		Customer customer = new Customer();
		customer.setId(4);		
		bean.setCustomer(customer);
		
		bean.setOrder_money(163.45);
		orderService.add(bean);
	}

	@Test
	public void testDel() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		@SuppressWarnings("unchecked")
		OrderService<Order> orderService = (OrderService<Order>) context.getBean("orderServiceImpl");
		Order bean = new Order();
		bean.setId(1);
		orderService.del(bean);
	}

	@Test
	public void testFind() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		@SuppressWarnings("unchecked")
		OrderService<Order> orderService = (OrderService<Order>) context.getBean("orderServiceImpl");
		Order bean = new Order();
		bean.setId(1);
		bean = orderService.find(bean);
		System.err.println(bean.getCustomer().getName());
	}

	@Test
	public void testFindAll() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		@SuppressWarnings("unchecked")
		OrderService<Order> orderService = (OrderService<Order>) context.getBean("orderServiceImpl");
		List<Order> orders =  orderService.findAll();
		for(Order order : orders){
			System.err.println(order.getTime());
		}
	}
	@Test
	public void testfindByDto() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		@SuppressWarnings("unchecked")
		OrderService<Order> orderService = (OrderService<Order>) context.getBean("orderServiceImpl");
		Order bean = new Order();
		bean.setId(1);
		Order_dto orders =  (Order_dto) orderService.findByDto(bean);
		System.err.println(orders.getOrder_money()+orders.getCustomer_id());
	}
	@Test
	public void findByStatu() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		@SuppressWarnings("unchecked")
		OrderService<Order> orderService = (OrderService<Order>) context.getBean("orderServiceImpl");
		
		OrderStatu orderStatu = new OrderStatu();
		orderStatu.setStatuNum(2);
		
		List<Order> orders = orderService.findByStatu(orderStatu);
		System.err.println("findByStatu  :  "+orders.size());
	}
	@Test
	public void testFindByToday() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		@SuppressWarnings("unchecked")
		OrderService<Order> orderService = (OrderService<Order>) context.getBean("orderServiceImpl");
		
		OrderStatu orderStatu = new OrderStatu();
		orderStatu.setStatuNum(0);
		
		List<Order> orders = orderService.findByTime(orderStatu,"month");
		System.err.println("findByStatu  :  "+orders.size());
	}
	@Test
	public void testDB() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		@SuppressWarnings("unchecked")
		OrderService<Order> orderService = (OrderService<Order>) context.getBean("orderServiceImpl");
		CustomerService userService = (CustomerService) context.getBean("customerServiceImpl");
		ProductService productService = (ProductService) context.getBean("productServiceImpl");
		
	}

}
