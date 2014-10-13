package com.bjsxt.crm.service;

import java.util.List;

import com.bjsxt.crm.po.User;

public interface UserService {
	public List<User> findAllUser();
	
	public List<User> checke(String name,String pwd);
	public void updateToUser(String pwd,Integer id);
	public void add(User user);
	public User findById(Integer id);
	/**
	 * 判断用户登录
	 * @param name
	 * @param pwd
	 * @return
	 */
	public User check(String name, String pwd);
}
