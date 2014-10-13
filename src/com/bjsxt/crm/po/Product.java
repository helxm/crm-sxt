package com.bjsxt.crm.po;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t_product")
public class Product {
	@Id
	@GeneratedValue
	private Integer id;
	private String name;
	private String serialnumber;
	private Float price;
	private Boolean available;
//	//对大客户，中客户，小客户的折扣值。
//	@Column(columnDefinition="10")
	private Float p1;
	private Float p2;
	private Float p3;
	
//	@OneToOne(mappedBy="product",fetch=FetchType.LAZY)
//	private Order order;
	
	
	public Boolean getAvailable() {
		return available;
	}
	public void setAvailable(Boolean available) {
		this.available = available;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSerialnumber() {
		return serialnumber;
	}
	public void setSerialnumber(String serialnumber) {
		this.serialnumber = serialnumber;
	}
	public Float getP1() {
		return p1;
	}
	public void setP1(Float p1) {
		this.p1 = p1;
	}
	public Float getP2() {
		return p2;
	}
	public void setP2(Float p2) {
		this.p2 = p2;
	}
	public Float getP3() {
		return p3;
	}
	public void setP3(Float p3) {
		this.p3 = p3;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public Product() {
	}
}
