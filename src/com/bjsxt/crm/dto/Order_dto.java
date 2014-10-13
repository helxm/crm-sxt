package com.bjsxt.crm.dto;

import java.util.Date;
public class Order_dto {

	private Integer id;
	private Integer num;
	private double order_money;
	private double unpay_money;
	private Date time;
	private String status;
	private String or_number;
	private Integer product_id;
	private Integer employee_id;
	private Integer customer_id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOr_number() {
		return or_number;
	}
	public void setOr_number(String or_number) {
		this.or_number = or_number;
	}
	public Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	public Integer getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(Integer employee_id) {
		this.employee_id = employee_id;
	}
	public Integer getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(Integer customer_id) {
		this.customer_id = customer_id;
	}
	public Order_dto(Integer id, Integer num, double order_money,
			double unpay_money, Date time, String status, String or_number,
			Integer product_id, Integer employee_id, Integer customer_id) {
		super();
		this.id = id;
		this.num = num;
		this.order_money = order_money;
		this.unpay_money = unpay_money;
		this.time = time;
		this.status = status;
		this.or_number = or_number;
		this.product_id = product_id;
		this.employee_id = employee_id;
		this.customer_id = customer_id;
	}
	

}
