package com.bjsxt.crm.po;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
@Entity
@Table(name="t_lost")
public class Lost {
	@Id
	@GeneratedValue
	private Integer id;
	private Date last_order_time;
	
	private Date lost_date;
	private String lost_delay;
	private String lost_reason;
	private String lost_status;
	
	@OneToOne(mappedBy="lost")
	private Customer customer;
	
	@ManyToOne
	@JoinColumn(unique=true)
	private Employee employee;
	
	public Lost() {
		// TODO Auto-generated constructor stub
	}

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

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Date getLast_order_time() {
		return last_order_time;
	}

	public void setLast_order_time(Date last_order_time) {
		this.last_order_time = last_order_time;
	}

	public Date getLost_date() {
		return lost_date;
	}

	public void setLost_date(Date lost_date) {
		this.lost_date = lost_date;
	}

	public String getLost_delay() {
		return lost_delay;
	}

	public void setLost_delay(String lost_delay) {
		this.lost_delay = lost_delay;
	}

	public String getLost_reason() {
		return lost_reason;
	}

	public void setLost_reason(String lost_reason) {
		this.lost_reason = lost_reason;
	}

	public String getLost_status() {
		return lost_status;
	}

	public void setLost_status(String lost_status) {
		this.lost_status = lost_status;
	}

	
	
}
