package com.bjsxt.crm.service.impl;

import java.util.List;


import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.po.User;
import com.bjsxt.crm.service.UserService;
import com.bjsxt.crm.util.Md5;
@Component
public class UserServiceImpl implements UserService{
	
	private HibernateTemplate hibernateTemplate;
	
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}


	@SuppressWarnings("unchecked")
	public List<User> findAllUser() {
		
		List<User> listUser = hibernateTemplate.find("from User");
		System.out.println(listUser.size()+"@$@#$#@$#@@#$");
		return listUser;
	}

	@SuppressWarnings({ "unchecked", "static-access" })
	public List<User> checke(String name,String pwd) {
//		List<User> find = hibernateTemplate.find("from User as u where u.name="+"'"+name+"'");
		String md5pwd=new Md5().getMD5(pwd);
		System.out.println(md5pwd);
		String hql= "from User as u where u.name=? and u.pwd=?";
		List<User> find = hibernateTemplate.find(hql, new String[]{name,md5pwd});
		return  find;
	}


	@SuppressWarnings("static-access")
	public void updateToUser(String pwd,Integer id) {
		String md5pwd=new Md5().getMD5(pwd);
		System.out.println(md5pwd);
		User user = (User) hibernateTemplate.get(User.class, id);
		user.setPwd(md5pwd);
		
	}
	public User findById(Integer id) {
		User user = (User) hibernateTemplate.get(User.class, id);
		return user;
	}
	
	public void add(User user) {
		hibernateTemplate.save(user);
	}
	public static void main(String[] args) {
		ApplicationContext ac=new ClassPathXmlApplicationContext(
			new String[]{"applicationContext.xml"}	
		
		);
		UserService userService=(UserService) ac.getBean("userServiceImpl");
		userService.checke("admin", "admin");
	}
	/**
	 * 判断用户登录
	 */
	@SuppressWarnings("unchecked")
	public User check(String name, String pwd) {
		if (StringUtils.isNotBlank(name)&&StringUtils.isNotBlank(pwd)) {
			List<User> users = hibernateTemplate.find("from User u where u.name=? and pwd=?", new Object[]{name,pwd});
			if (users.size()>0) {
				return users.get(0);
			}
			return null;
		}
		return null;
	}
}
