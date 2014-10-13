package com.bjsxt.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.dto.RoleDto;
import com.bjsxt.crm.po.Role;
import com.bjsxt.crm.po.User;
import com.bjsxt.crm.service.RoleService;
@Component
public  class RoleServiceImpl implements RoleService{
	private HibernateTemplate hibernateTemplate;
	
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public void addRelation(Integer userId, Integer roleId) {
		User user = (User) hibernateTemplate.get(User.class, userId);
		Role role = (Role) hibernateTemplate.get(Role.class,roleId);
		role.getUser().add(user);
		hibernateTemplate.update(role);
	}

	public void delRelation(Integer userId, Integer roleId) {
		System.out.println(userId+"---userId");
		System.out.println(roleId+"---roleId");
		
		Role role = (Role) hibernateTemplate.get(Role.class,roleId);
		User user = (User) hibernateTemplate.get(User.class, userId);
		role.getUser().remove(user);
		hibernateTemplate.update(role);
	}

	@SuppressWarnings("unchecked")
	public List<RoleDto> findByUserId(Integer userId) {
		String hql=" select  new com.bjsxt.crm.dto.RoleDto(r.id,r.name)  from Role r where r.user.id=?";
		return hibernateTemplate.find(hql, new Object[]{userId});
	}

	@SuppressWarnings("unchecked")
	public List<RoleDto> findNotByUserId(Integer userId) {
		String hql=" select  new com.bjsxt.crm.dto.RoleDto(r.id,r.name)  from Role r where  r.id not in (select r2.id from Role r2 where r2.user.id=?)";
		return hibernateTemplate.find(hql, new Object[]{userId});
	}
	@SuppressWarnings("unchecked")
	public List<RoleDto> findAll() {
		String hql="select new com.bjsxt.crm.dto.RoleDto(r.id,r.name,r.des,r.priority,r.state)  from Role r";
		return hibernateTemplate.find(hql);
	}
	
	public static void main(String[] args) {
		ApplicationContext  ac =new  ClassPathXmlApplicationContext(
				new String[]{"applicationContext.xml"}
		);
		
		RoleService  roleService = (RoleService) ac.getBean("roleServiceImpl");
		List<RoleDto> findAll = roleService.findAll();
		System.out.println(findAll.size());
	
	}

}
