package com.bjsxt.crm.po;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="t_marketChance")
public class MarketChance {
	@Id
	@GeneratedValue
	private Integer id;
	private String title;
	private double rate;
	private String createMan;
	private String createDate;
	private String allocateMan;
	private String allocateDate;
	private String remark;
	private String status;
			
	@ManyToOne
	private LinkMan linkMan;
	
	@ManyToOne
	@JoinColumn(unique=true)
	private Customer customer;
	
	@OneToOne(mappedBy="marketChance",cascade={CascadeType.ALL})
	private Development development;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public LinkMan getLinkMan() {
		return linkMan;
	}

	public void setLinkMan(LinkMan linkMan) {
		this.linkMan = linkMan;
	}

	public Development getDevelopment() {
		return development;
	}

	public void setDevelopment(Development development) {
		this.development = development;
	}

	public String getCreateMan() {
		return createMan;
	}

	public void setCreateMan(String createMan) {
		this.createMan = createMan;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getAllocateMan() {
		return allocateMan;
	}

	public void setAllocateMan(String allocateMan) {
		this.allocateMan = allocateMan;
	}

	public String getAllocateDate() {
		return allocateDate;
	}

	public void setAllocateDate(String allocateDate) {
		this.allocateDate = allocateDate;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
