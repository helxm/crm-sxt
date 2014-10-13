package com.bjsxt.crm.po;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="t_orderstatu")
public class OrderStatu {
	@Id
	@GeneratedValue
	private Integer id;
	private Integer statuNum;//状态码（待收货确认--4,待出库审核--3,待财务审核--2,已完成--0,退单中-1,已退单-2，待订单审核--1）
	private String statu;
	@OneToMany(mappedBy="statu")
	private Set<Order> orders;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getStatuNum() {
		return statuNum;
	}
	public void setStatuNum(Integer statuNum) {
		this.statuNum = statuNum;
	}
	public String getStatu() {
		return statu;
	}
	public void setStatu(String statu) {
		this.statu = statu;
	}
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	public OrderStatu(Integer statuNum, String statu) {
		super();
		this.statuNum = statuNum;
		this.statu = statu;
	}
	public OrderStatu() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
