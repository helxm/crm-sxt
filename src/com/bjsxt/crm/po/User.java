package com.bjsxt.crm.po;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="t_user")
public class User {
	@Id
	@GeneratedValue
	private Integer id;
	private String name;
	private String pwd;
	private String phone;
	private String duty;
	private Integer duty_no;
	@ManyToMany(mappedBy="user")
	private Set<Role> role=new HashSet<Role>();
	
	
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


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getDuty() {
		return duty;
	}


	public void setDuty(String duty) {
		this.duty = duty;
	}


	public Integer getDuty_no() {
		return duty_no;
	}


	public void setDuty_no(Integer dutyNo) {
		duty_no = dutyNo;
	}


	public Set<Role> getRole() {
		return role;
	}


	public void setRole(Set<Role> role) {
		this.role = role;
	}


	public User() {
		super();
	}


	public User(Integer id, String name, String pwd, String phone, String duty,
			Integer dutyNo, Set<Role> role) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.phone = phone;
		this.duty = duty;
		duty_no = dutyNo;
		this.role = role;
	}
	
}
