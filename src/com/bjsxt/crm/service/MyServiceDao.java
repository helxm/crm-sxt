package com.bjsxt.crm.service;

import java.util.List;

import com.bjsxt.crm.po.MyService;

public interface MyServiceDao {
	public void add(MyService myService,Integer eid);
	public void add(MyService myService,Integer did,Integer aid);
	public void update(MyService myService,Integer did,Integer aid);
	public void update(MyService myService,Integer did);
	public void update(MyService myService);
	public List<MyService> findAll();
	public List<MyService> findMyServices();
	public List<MyService> findByStatus(String status);
	public MyService findById(Integer id);
}
