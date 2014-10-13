package com.bjsxt.crm.service;

import java.util.List;

import com.bjsxt.crm.dto.RoleDto;

public interface RoleService {
	//根据userId查角色
	public List<RoleDto> findByUserId(Integer userId);
	//根据userId查不在USER角色
	public List<RoleDto> findNotByUserId(Integer userId);
	//添加角色
	public void addRelation(Integer userId,Integer roleId);
	//删除角色
	public void delRelation(Integer userId,Integer roleId);
		//查看所有权限
	public List<RoleDto> findAll();
		
		
	
}
