package com.bjsxt.crm.po;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name="t_myservice")
public class MyService {
	@Id
	@GeneratedValue
	private Integer id;
	private String type;
	private String title;
	private String status;
	private String request;
	private String satisfy;
	
	
	@OneToMany(mappedBy="myService")
	private Set<Customer> customers;
	
	@ManyToOne
	@JoinColumn(unique=true)
	private S_Create s_Create;
	
	
	
	@ManyToOne
	@JoinColumn(unique=true)
	private S_Allocate s_Allocate;
	
	
	
	@ManyToOne
	@JoinColumn(unique=true)
	private S_Deal s_Deal;
	
	public MyService() {
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public Set<Customer> getCustomers() {
		return customers;
	}
	public void setCustomers(Set<Customer> customers) {
		this.customers = customers;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public S_Create getS_Create() {
		return s_Create;
	}
	public void setS_Create(S_Create s_Create) {
		this.s_Create = s_Create;
	}
	public S_Allocate getS_Allocate() {
		return s_Allocate;
	}
	public void setS_Allocate(S_Allocate s_Allocate) {
		this.s_Allocate = s_Allocate;
	}
	public S_Deal getS_Deal() {
		return s_Deal;
	}
	public void setS_Deal(S_Deal s_Deal) {
		this.s_Deal = s_Deal;
	}
	public String getSatisfy() {
		return satisfy;
	}
	public void setSatisfy(String satisfy) {
		this.satisfy = satisfy;
	}
	
}
