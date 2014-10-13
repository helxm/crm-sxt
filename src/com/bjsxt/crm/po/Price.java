//package com.bjsxt.crm.po;
//
//import javax.persistence.Entity;
//
//import javax.persistence.GeneratedValue;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
//import javax.persistence.Table;
//@Entity
//@Table(name="t_price")
//public class Price {
//	@Id
//	@GeneratedValue
//	private Integer id;
//	private double discount;
//	
//	@ManyToOne
//	@JoinColumn(unique=true)
//	private Product product;
////	
////	@ManyToOne
////	@JoinColumn(unique=true)
////	private Customer customer;
////	
//	public Price() {
//	}
//
//	public Integer getId() {
//		return id;
//	}
//
//	public void setId(Integer id) {
//		this.id = id;
//	}
//
////	public Customer getCustomer() {
////		return customer;
////	}
////
////	public void setCustomer(Customer customer) {
////		this.customer = customer;
////	}
//
//	public Product getProduct() {
//		return product;
//	}
//
//	public void setProduct(Product product) {
//		this.product = product;
//	}
//
//	public double getDiscount() {
//		return discount;
//	}
//
//	public void setDiscount(double discount) {
//		this.discount = discount;
//	}
//}
