package com.bjsxt.crm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.po.Employee;
import com.bjsxt.crm.po.MyService;
import com.bjsxt.crm.po.S_Allocate;
import com.bjsxt.crm.po.S_Create;
import com.bjsxt.crm.po.S_Deal;
import com.bjsxt.crm.service.MyServiceDao;

@Component
public class MyServiceImpl implements MyServiceDao {
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public void add(MyService myService,Integer eid) {
		
		Employee employee = (Employee) hibernateTemplate.get(Employee.class, eid);
		S_Create s_Create = new S_Create();
		s_Create.setEmployee(employee);
		s_Create.setCreate_date(new Date());
		hibernateTemplate.save(s_Create);
		myService.setS_Create(s_Create);
		
		hibernateTemplate.save(myService);
	}

	@SuppressWarnings("unchecked")
	public List<MyService> findAll() {
		List<MyService> list = hibernateTemplate.find("from MyService");
		return list;
	}

	public MyService findById(Integer id) {
		MyService myService = new MyService();
		myService = (MyService) hibernateTemplate.get(MyService.class, id);
		return myService;
	}

	public void add(MyService myService, Integer did, Integer aid) {
		Employee employee = (Employee) hibernateTemplate.get(Employee.class, did);
		Employee employee2=(Employee) hibernateTemplate.get(Employee.class, aid);
		S_Allocate s_Allocate=new S_Allocate();
		S_Deal s_Deal=new S_Deal();
		s_Allocate.setEmployee(employee2);
		s_Deal.setEmployee(employee);
		hibernateTemplate.save(s_Allocate);
		hibernateTemplate.save(s_Deal);
		myService.setS_Allocate(s_Allocate);
		myService.setS_Deal(s_Deal);
		hibernateTemplate.save(myService);
	}

	public void update(MyService myService,Integer did,Integer aid) {
		Employee employee = (Employee) hibernateTemplate.get(Employee.class, did);
		Employee employee2=(Employee) hibernateTemplate.get(Employee.class, aid);
		S_Allocate s_Allocate=new S_Allocate();
		S_Deal s_Deal=new S_Deal();
		s_Allocate.setEmployee(employee2);
		s_Allocate.setAllcateTime(new Date());
		s_Deal.setEmployee(employee);
		s_Deal.setDealTime(new Date());
		hibernateTemplate.save(s_Allocate);
		hibernateTemplate.save(s_Deal);
		myService.setS_Allocate(s_Allocate);
		myService.setS_Deal(s_Deal);
		hibernateTemplate.update(myService);
	}

	public void update(MyService myService, Integer did) {
		Employee employee = (Employee) hibernateTemplate.get(Employee.class, did);
		S_Deal s_Deal=new S_Deal();
		s_Deal.setEmployee(employee);
		s_Deal.setDealTime(new Date());
		hibernateTemplate.save(s_Deal);
		myService.setS_Deal(s_Deal);
		hibernateTemplate.update(myService);
	}

	public void update(MyService myService) {
		System.out.println("MyServiceImpl.update()"+myService.getRequest());
		hibernateTemplate.update(myService);
	}
	
	@SuppressWarnings("unchecked")
	public List<MyService> findMyServices() {
		List<MyService> myServices=new ArrayList<MyService>();
		//employees=hibernateTemplate.find("from Employee");
		myServices=hibernateTemplate.find("select e.id,e.title from MyService e ");
		return myServices;
	}

	@SuppressWarnings("unchecked")
	public List<MyService> findByStatus(String status) {
		List<MyService> myServices=new ArrayList<MyService>();
		myServices=hibernateTemplate.find("from MyService m where m.status= "+status);
		return myServices;
	}

}
