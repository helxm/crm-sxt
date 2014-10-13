package com.bjsxt.crm.po;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="t_customer")
public class Customer {
	@Id
	@GeneratedValue
	private Integer id;//客户id
	private String cust_num;//客户编号
	private String name;//姓名
	private String level;//等级
	private String type; //类型
	private String status;//状态
	private String email;//电子邮件
	private String source;//资源
	private String createTime;//创建时间
	private String phone;//电话
	private String remark;//备注
	private String latestTouchtime;//最近一次联系时间
	
	
	@ManyToOne
	private LinkMan linkMan;
	
	@ManyToOne
	private Employee employee;
	
	@ManyToOne
	@JoinColumn(unique=true)
	private Lost lost;
	
	@ManyToOne
	private MyService myService;
	
	@OneToMany(mappedBy="customer",cascade={CascadeType.ALL})
	private Set<Order> orders;
	
	@OneToOne(mappedBy="customer",cascade={CascadeType.ALL})
	private MarketChance marketChance;

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
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public Customer() {
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	public Lost getLost() {
		return lost;
	}
	public void setLost(Lost lost) {
		this.lost = lost;
	}
	public MyService getMyService() {
		return myService;
	}
	public void setMyService(MyService myService) {
		this.myService = myService;
	}
	
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	public String getCust_num() {
		return cust_num;
	}
	public void setCust_num(String cust_num) {
		this.cust_num = cust_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getLatestTouchtime() {
		return latestTouchtime;
	}
	public void setLatestTouchtime(String latestTouchtime) {
		this.latestTouchtime = latestTouchtime;
	}
	public LinkMan getLinkMan() {
		return linkMan;
	}
	public void setLinkMan(LinkMan linkMan) {
		this.linkMan = linkMan;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public MarketChance getMarketChance() {
		return marketChance;
	}
	public void setMarketChance(MarketChance marketChance) {
		this.marketChance = marketChance;
	}
	
}
