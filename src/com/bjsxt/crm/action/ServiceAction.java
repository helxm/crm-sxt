package com.bjsxt.crm.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.po.MyService;
import com.bjsxt.crm.service.MyServiceDao;
import com.bjsxt.crm.util.JsonUtil;

@Component
@Scope("prototype")
public class ServiceAction {
	private MyService myService;
	private Integer id;
	private String cust_num;
	private List<MyService> myServices;
	private MyServiceDao myServiceDao;
	private Integer eid;
	private Integer aid;
	private Integer did;
	private Integer mid;
	private String status;
	public String findById() {
		this.myService = myServiceDao.findById(id);
		System.out.println("ServiceAction.findById()" + myService.getId());
		return "myservicelist";
	}
	public List<MyService> findByStatus(){
		this.myServices=(List<MyService>) myServiceDao.findByStatus(status);
		return myServices;
	}
	public String findByStatus1(){
		findByStatus();
		return "add";
	}
	public String findByStatus2(){
		findByStatus();
		return "add1";
	}
	public String findByStatus3(){
		findByStatus();
		return "add2";
	}
	public String findByStatus4(){
		findByStatus();
		return "add3";
	}
	public String findByStatus5(){
		findByStatus();
		return "myserviceMgr3";
	}
	public String findMyServices() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		this.myServices = myServiceDao.findMyServices();
		JsonUtil.write2response(myServices, response);
		return null;
	}
	public String findAll() {
		this.myServices = myServiceDao.findAll();
		return "myserviceMgr";
	}

	public String addMyService() {
		myServiceDao.add(myService,eid);
		this.status="1";
		return findByStatus1();
	}
	public String add1MyService() {
		MyService mS=myServiceDao.findById(mid);
		mS.setStatus(myService.getStatus());
		myService=mS;
		myServiceDao.update(myService, did, aid);
		this.status="1";
		return findByStatus2();
	}
	public String add2MyService() {
		MyService mS=myServiceDao.findById(mid);
		mS.setStatus(myService.getStatus());
		myServiceDao.update(mS, did);
		this.status="2";
		return findByStatus3();
	}
	public String add3MyService() {
		MyService mS=myServiceDao.findById(mid);
		mS.setRequest(myService.getRequest());
		mS.setSatisfy(myService.getSatisfy());
		mS.setStatus(myService.getStatus());
		myServiceDao.update(mS);
		this.status="3";
		return findByStatus4();
	}
	public String add4MyService() {
		MyService mS=myServiceDao.findById(mid);
		mS.setRequest(myService.getRequest());
		mS.setSatisfy(myService.getSatisfy());
		mS.setStatus(myService.getStatus());
		myServiceDao.update(mS);
		this.status="4";
		return findByStatus5();
	}

	public MyServiceDao getMyServiceDao() {
		return myServiceDao;
	}

	@Resource
	public void setMyServiceDao(MyServiceDao myServiceDao) {
		this.myServiceDao = myServiceDao;
	}

	public MyService getMyService() {
		return myService;
	}

	public void setMyService(MyService myService) {
		this.myService = myService;
	}

	public List<MyService> getMyServices() {
		return myServices;
	}

	public void setMyServices(List<MyService> myServices) {
		this.myServices = myServices;
	}

	public String getCust_num() {
		return cust_num;
	}

	public void setCust_num(String cust_num) {
		this.cust_num = cust_num;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getEid() {
		return eid;
	}

	public void setEid(Integer eid) {
		this.eid = eid;
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public Integer getDid() {
		return did;
	}

	public void setDid(Integer did) {
		this.did = did;
	}

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	
	
}
