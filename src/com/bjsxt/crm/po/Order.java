package com.bjsxt.crm.po;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
@Entity
@Table(name="t_order")
public class Order {
	@Id
	@GeneratedValue
	private Integer id;
	private Integer num;
	private double order_money;
	private double unpay_money;
	private Date time;
	@ManyToOne
	@Fetch(FetchMode.JOIN)
	private OrderStatu statu;
	private String or_number;
	
	public String getOr_number() {
		return or_number;
	}
	public void setOr_number(String or_number) {
		this.or_number = or_number;
	}
	@ManyToOne(fetch=FetchType.LAZY)
	private Product product;
	
	@ManyToOne
	@Fetch(FetchMode.JOIN)
	private Employee employee;
	
	@ManyToOne
	@Fetch(FetchMode.JOIN)
	private Customer customer;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public double getOrder_money() {
		return order_money;
	}
	public void setOrder_money(double order_money) {
		this.order_money = order_money;
	}
	public double getUnpay_money() {
		return unpay_money;
	}
	public void setUnpay_money(double unpay_money) {
		this.unpay_money = unpay_money;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Order() {
	}
	public OrderStatu getStatu() {
		return statu;
	}
	public void setStatu(OrderStatu statu) {
		this.statu = statu;
	}
	
	
}
