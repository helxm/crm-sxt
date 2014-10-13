package com.bjsxt.crm.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.po.Employee;
import com.bjsxt.crm.service.EmployeeDao;

@Component
public class EmployeeImpl implements EmployeeDao {
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@SuppressWarnings("unchecked")
	public List<Employee> findEmps() {
		List<Employee> employees=new ArrayList<Employee>();
		//employees=hibernateTemplate.find("from Employee");
		employees=hibernateTemplate.find("select e.id,e.name from Employee e ");
		return employees;
	}

}
