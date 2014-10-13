package com.bjsxt.crm.dto;

public class RoleDto {
	private Integer   id;
	
	private String name;
	private String des;
	private Integer priority;
	private String state;

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



	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public Integer getPriority() {
		return priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public RoleDto(Integer id, String name, String des, Integer priority) {
		super();
		this.id = id;
		this.name = name;
		this.des = des;
		this.priority = priority;
	}
	

	public RoleDto(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public RoleDto() {
		super();
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public RoleDto(Integer id, String name, String des, Integer priority,
			String state) {
		super();
		this.id = id;
		this.name = name;
		this.des = des;
		this.priority = priority;
		this.state = state;
	}

	

	
	
}
