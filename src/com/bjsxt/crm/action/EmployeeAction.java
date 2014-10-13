package com.bjsxt.crm.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.po.Employee;
import com.bjsxt.crm.service.EmployeeDao;
import com.bjsxt.crm.util.JsonUtil;

@Component
@Scope("prototype")
public class EmployeeAction {
	private List<Employee> employees;
	private EmployeeDao employeeDao;
	
	public String findAll(){
		System.out.println("findAll");
		this.employees=employeeDao.findEmps();
		toJson(employees);
		return null;
	}

	private void toJson(Object object) {
		HttpServletResponse response =ServletActionContext.getResponse();
		try {
			JsonUtil.write2response(object, response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	public EmployeeDao getEmployeeDao() {
		return employeeDao;
	}
	@Resource
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}
	
	
}
