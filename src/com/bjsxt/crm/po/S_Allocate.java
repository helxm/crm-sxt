package com.bjsxt.crm.po;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
@Entity
@Table(name="t_allocate")
public class S_Allocate {
	@Id
	@GeneratedValue
	private Integer id;
	private Date allcateTime;
	
	
	@OneToOne(mappedBy="s_Allocate")
	private MyService myService;
	
	@ManyToOne
	private Employee employee;
	
	public S_Allocate() {
	}

	public MyService getMyService() {
		return myService;
	}

	public void setMyService(MyService myService) {
		this.myService = myService;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getAllcateTime() {
		return allcateTime;
	}

	public void setAllcateTime(Date allcateTime) {
		this.allcateTime = allcateTime;
	}

	
	
}
