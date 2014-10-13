package com.bjsxt.crm.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bjsxt.crm.po.OrderStatu;
import com.bjsxt.crm.service.order.OrderService;

public class OrderStatuImplTest {

	@Test
	public void testAdd() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		@SuppressWarnings("unchecked")
		OrderService<OrderStatu> orderService = (OrderService<OrderStatu>) context.getBean("orderStatuImpl");
		OrderStatu bean7 = new OrderStatu(-2, "已退单");
		OrderStatu bean2 = new OrderStatu(-1, "退单中");
		OrderStatu bean1 = new OrderStatu(0, "已完成");
		OrderStatu bean3 = new OrderStatu(1, "待订单审核");
		OrderStatu bean4 = new OrderStatu(2, "待财务审核");
		OrderStatu bean5 = new OrderStatu(3, "待出库审核");
		OrderStatu bean6 = new OrderStatu(4, "待收货确认");
		orderService.add(bean7);
		orderService.add(bean2);
		orderService.add(bean1);
		orderService.add(bean3);
		orderService.add(bean4);
		orderService.add(bean5);
		orderService.add(bean6);
		
		
	}

	@Test
	public void testDel() {
		
	}

	@Test
	public void testFind() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		@SuppressWarnings("unchecked")
		OrderService<OrderStatu> orderService = (OrderService<OrderStatu>) context.getBean("orderStatuImpl");
		OrderStatu bean = new OrderStatu();
		
		bean.setId(1);
		bean = orderService.find(bean);
		System.err.println(bean.getStatu());
		
		bean.setStatuNum(-1);
		bean = orderService.find(bean);
		System.err.println(bean.getStatu());
	}

}
