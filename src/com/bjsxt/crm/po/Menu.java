package com.bjsxt.crm.po;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name="t_menu")
public class Menu {
	@Id
	@GeneratedValue
	private  Integer  id;
	
	private  String name;
	
	private String url;
	
	private String des;
	private String icon;
	
	@ManyToMany
	private Set<Role>  role=new HashSet<Role>();

	@ManyToOne
	private Menu  parent;
	
	private String target="main";
	
	@OneToMany(mappedBy="parent")
	private Set<Menu> children=new HashSet<Menu>();
	
	
	
	public Menu getParent() {
		return parent;
	}

	public void setParent(Menu parent) {
		this.parent = parent;
	}

	public Set<Menu> getChildren() {
		return children;
	}

	public void setChildren(Set<Menu> children) {
		this.children = children;
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public Set<Role> getRole() {
		return role;
	}

	public void setRole(Set<Role> role) {
		this.role = role;
	}

	public Menu() {
		super();
	}

	

	

	@Override
	public String toString() {
		return "Menu [children=" + children + ", des=" + des + ", id=" + id
				+ ", name=" + name + ", parent=" + parent + ", role=" + role
				+ ", url=" + url + "]";
	}

	public Menu(Integer id, String name, String url) {
		super();
		this.id = id;
		this.name = name;
		this.url = url;
	}

	

	public Menu(Integer id, String name, String url, String des, String icon,
			Set<Role> role, Menu parent, Set<Menu> children) {
		super();
		this.id = id;
		this.name = name;
		this.url = url;
		this.des = des;
		this.icon = icon;
		this.role = role;
		this.parent = parent;
		this.children = children;
	}

	
	
	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Menu(Integer id, String name, String url, String des, String icon, String target, Set<Role> role, Menu parent, Set<Menu> children) {
		super();
		this.id = id;
		this.name = name;
		this.url = url;
		this.des = des;
		this.icon = icon;
		this.target = target;
		this.role = role;
		this.parent = parent;
		this.children = children;
	}

}
