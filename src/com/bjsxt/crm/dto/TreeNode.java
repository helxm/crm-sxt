package com.bjsxt.crm.dto;

public class TreeNode {
	private Integer id;
	private String name;
	private Integer pId;
	private String url;
	private String icon;
	private Boolean  checked=false;
	private String target;
	
	
	public Boolean getChecked() {
		return checked;
	}
	public void setChecked(Boolean checked) {
		this.checked = checked;
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
	public Integer getpId() {
		return pId;
	}
	public void setpId(Integer pId) {
		this.pId = pId;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

	
	public TreeNode() {
		super();
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public TreeNode(Integer id, String name, Integer pId, String url,
			String icon, Boolean checked) {
		super();
		this.id = id;
		this.name = name;
		this.pId = pId;
		this.url = url;
		this.icon = icon;
		this.checked = checked;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public TreeNode(Integer id, String name, Integer pId, String url, String icon, Boolean checked, String target) {
		super();
		this.id = id;
		this.name = name;
		this.pId = pId;
		this.url = url;
		this.icon = icon;
		this.checked = checked;
		this.target = target;
	}
	

	
}
