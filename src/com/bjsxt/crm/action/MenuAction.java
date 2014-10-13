package com.bjsxt.crm.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.po.User;
import com.bjsxt.crm.service.MenuService;
import com.bjsxt.crm.util.JsonUtil;

@Component
@Scope("prototype")
public class MenuAction {

	private Integer uid;

	private MenuService menuService;

	public MenuService getMenuService() {
		return menuService;
	}

	@Resource
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	private List<Integer> findByRoleMenuId;
	private Integer roleId;
	private Integer[] menuIds;
	private User user;

	@SuppressWarnings("static-access")
	public String find4tree() throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException {
		JsonUtil jsonUtil = new JsonUtil();
		jsonUtil.write2response(menuService.find4tree(roleId), ServletActionContext.getResponse());

		return null;
	}

	public String select() throws IOException {
		menuService.select(roleId, menuIds);
		ServletActionContext.getResponse().sendRedirect("roleAction!findAll");
		return null;

	}

	public String findMenu() {
		this.findByRoleMenuId = menuService.findByRoleMenuId(roleId);

		return "grant";

	}

	@SuppressWarnings("static-access")
	public String findByUserNametree() throws IOException {
		JsonUtil jsonUtil = new JsonUtil();
		jsonUtil.write2response(menuService.findByUserNametree(user.getName()), ServletActionContext.getResponse());

		return null;

	}

	/**
	 * 通过id查找对应的树
	 * @return
	 * @throws IOException
	 */
	public String findByUserIdtree() throws IOException {

		JsonUtil.write2response(menuService.findByUserIdtree(uid), ServletActionContext.getResponse());
		return null;

	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer[] getMenuIds() {
		return menuIds;
	}

	public void setMenuIds(Integer[] menuIds) {
		this.menuIds = menuIds;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Integer> getFindByRoleMenuId() {
		return findByRoleMenuId;
	}

	public void setFindByRoleMenuId(List<Integer> findByRoleMenuId) {
		this.findByRoleMenuId = findByRoleMenuId;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}
}
