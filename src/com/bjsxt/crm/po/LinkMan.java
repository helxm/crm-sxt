package com.bjsxt.crm.po;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name="t_linkman")
public class LinkMan {
	@Id
	@GeneratedValue
	private Integer id;
	private String name;
	private String phone;
	
	@OneToMany(mappedBy="linkMan")
	private Set<Customer> customers = new HashSet<Customer>();
	
	@OneToMany(mappedBy="linkMan")
	private Set<MarketChance> marketChances = new HashSet<MarketChance>();
	
	
	public LinkMan() {
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Set<Customer> getCustomers() {
		return customers;
	}

	public void setCustomers(Set<Customer> customers) {
		this.customers = customers;
	}

	public Set<MarketChance> getMarketChances() {
		return marketChances;
	}

	public void setMarketChances(Set<MarketChance> marketChances) {
		this.marketChances = marketChances;
	}
}
