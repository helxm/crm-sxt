package com.bjsxt.crm.service;

import java.util.List;

import com.bjsxt.crm.dto.TreeNode;

public interface MenuService {
	
	List<TreeNode> find4tree(Integer roleId);

	List<TreeNode> findByUserNametree(String name);

	public List<Integer> findByRoleMenuId(Integer roleId);

	public void select(Integer roleId, Integer[] menuIds);
	
	/**
	 * 通过id查找树
	 * @param uid
	 * @return
	 */
	Object findByUserIdtree(Integer uid);

}
