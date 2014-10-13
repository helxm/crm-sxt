package com.bjsxt.crm.dto;

public class CustomerSearch {
	private Integer id;
	private String cust_num;
	private String name;
	private String phone;
	
	public CustomerSearch() {
	}

	public String getCust_num() {
		return cust_num;
	}

	public void setCust_num(String cust_num) {
		this.cust_num = cust_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public CustomerSearch(String cust_num, String name) {
		super();
		this.cust_num = cust_num;
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public CustomerSearch(String cust_num, String name, String phone) {
		super();
		this.name = name;
		this.phone = phone;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public CustomerSearch(Integer id, String cust_num, String name, String phone) {
		super();
		this.id = id;
		this.cust_num = cust_num;
		this.name = name;
		this.phone = phone;
	}

	
	
	
}
