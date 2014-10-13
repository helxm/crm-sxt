package com.bjsxt.crm.po;

import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="t_employee")
public class Employee {
	@Id
	@GeneratedValue
	private Integer id;
	private String name;
	private String position;
	private String status;
	private String phone;
	
	@OneToMany(mappedBy="employee")
	private Set<Customer> customers;
	
	@OneToOne(mappedBy="employee")
	private Lost lost;
	
	@ManyToOne
	private Department department;
	
	@OneToMany(mappedBy="employee")
	private Set<Order> orders;
	
	
	@OneToMany(mappedBy="employee")
	private Set<S_Create> s_Creates; 
	
	@OneToMany(mappedBy="employee")
	private Set<S_Allocate> s_Allocates; 
	
	@OneToMany(mappedBy="employee")
	private Set<S_Deal> s_Deals; 
	
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
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	
	public Lost getLost() {
		return lost;
	}
	public void setLost(Lost lost) {
		this.lost = lost;
	}
	
	public Employee() {
	}
	public Set<Customer> getCustomers() {
		return customers;
	}
	public void setCustomers(Set<Customer> customers) {
		this.customers = customers;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	public Set<S_Create> getS_Creates() {
		return s_Creates;
	}
	public void setS_Creates(Set<S_Create> s_Creates) {
		this.s_Creates = s_Creates;
	}
	public Set<S_Allocate> getS_Allocates() {
		return s_Allocates;
	}
	public void setS_Allocates(Set<S_Allocate> s_Allocates) {
		this.s_Allocates = s_Allocates;
	}
	public Set<S_Deal> getS_Deals() {
		return s_Deals;
	}
	public void setS_Deals(Set<S_Deal> s_Deals) {
		this.s_Deals = s_Deals;
	}
}
