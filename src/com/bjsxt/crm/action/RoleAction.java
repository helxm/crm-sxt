package com.bjsxt.crm.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.dto.RoleDto;
import com.bjsxt.crm.service.MenuService;
import com.bjsxt.crm.service.RoleService;
import com.bjsxt.crm.util.JsonUtil;

@Component
@Scope("prototype")
public class RoleAction {
	private RoleService roleService;
	private MenuService menuService;
	
	
	public MenuService getMenuService() {
		return menuService;
	}
	@Resource
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	public RoleService getRoleService() {
		return roleService;
	}
	@Resource
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}
	private Integer menuId;
	private Integer roleId;
	private Integer userId;
	private List<RoleDto> findAllList ;
	
	public String findAddDelList(){
		return "list";
		
	}
	public String findAll(){
		findAllList= roleService.findAll();
		
		return "showRole";
		
		
	}

	
	@SuppressWarnings("static-access")
	public String findByUserId() throws IOException{
		System.out.println(userId+"-----------userid");
		List<RoleDto> findByUserId = roleService.findByUserId(userId);
		System.out.println(findByUserId+"_____findByUserId.size()");
		JsonUtil jsonUtil = new JsonUtil();
		
		jsonUtil.write2response(findByUserId, ServletActionContext.getResponse());
		return null;
	
	}
	@SuppressWarnings("static-access")
	public String findByNotUserId() throws IOException{
		List<RoleDto> findByUserId = roleService.findNotByUserId(userId);
		JsonUtil jsonUtil = new JsonUtil();
		
		jsonUtil.write2response(findByUserId, ServletActionContext.getResponse());
		return null;
		
	}
	public String addRoleAction(){
		roleService.addRelation(userId, roleId);
		return null;
		
	}
	public String delRoleAction(){
		roleService.delRelation(userId, roleId);
		return null;
		
	}
	
	
	
	
	
	

	public Integer getMenuId() {
		return menuId;
	}
	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	public List<RoleDto> getFindAllList() {
		return findAllList;
	}
	public void setFindAllList(List<RoleDto> findAllList) {
		this.findAllList = findAllList;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
}
