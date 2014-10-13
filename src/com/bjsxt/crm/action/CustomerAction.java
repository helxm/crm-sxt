package com.bjsxt.crm.action;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.dto.CustomerSearch;
import com.bjsxt.crm.po.Customer;
import com.bjsxt.crm.po.Employee;
import com.bjsxt.crm.po.MyService;
import com.bjsxt.crm.service.CustomerService;
import com.bjsxt.crm.util.DataType;
import com.bjsxt.crm.util.List2Json;

@Component
@Scope("prototype")
public class CustomerAction {
	private CustomerService customerService;

	public CustomerService getCustomerService() {
		return customerService;
	}
	@Resource
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	
	private Customer customer;
	private List<Customer> list;
	private String[] ids;
	private Integer id;
	private Integer lid;
	private Integer eid;
	private Integer sid;
	private List<CustomerSearch> today_cont;
	private List<Customer> detach_cont; 
	private String code;//客户编号
	private String name;//客户姓名
	private String msg;
	
	private List<Employee> eList;
	private InputStream jsonInputStream;
	
	
	/**
	 * 跳转到添加客户的页面
	 * @return
	 */
	public String add(){
		return "add";
	}
	
	/**
	 * 没有条件查询所有的客户
	 * @return
	 */
	public String findAll(){
		this.list= customerService.findAll();
		return "list";
	}

	/**
	 * 添加客户
	 * @return
	 */
	public String save(){
		this.customer.setLatestTouchtime(customer.getCreateTime());
		customerService.add(customer);
		return "listAction";
	}
	/**
	 * 编辑信息
	 * @return
	 */
	public String edit(){
		customer = customerService.findCustomerById(id);
		return "edit";
	}
	/**
	 * 更新客户
	 * @return
	 */
	public String update(){
		//this.customer.setLatestTouchtime(customer.getCreateTime());
		customerService.updateCustomer(customer,eid);
		return "listAction";
	}
	/**
	 * 批量删除客户信息
	 * @return
	 */
	public String delete(){
		if (ids!=null && ids.length>0) {
			customerService.deleteCustomerByIds(DataType.converterStringArray2IntegerArray(ids));
			return "listAction";
		}
		return null;
	}
	/**
	 * 根据条件查询
	 * @return
	 */
	public String findCus(){
		CustomerSearch customerSearch= new CustomerSearch(code,name);
		this.list = customerService.findCustomerWithConditions(customerSearch);
		return "list";
	}
	
	/**
	 * 查询今天要联系的客户
	 * @return
	 */
	public String today_contact(){
		today_cont = customerService.findByDate();
		return "today";
	}
	
	/**
	 * 修改联系日期为今天
	 * @return
	 */
	public String deal(){
		customerService.updateTouchRecode(id);
		return today_contact();
	}
	/**
	 * 查询过时的客户【超过一年没有下单】
	 * @return
	 */
	public String detach(){
		detach_cont = customerService.findDetachCustomer();
		return "detach_cust";
	}
	/**
	 * 分配联系人
	 * @return
	 */
	public String allocate(){
		customerService.updateCustomerByLId(id,lid);
		return "listAction";
	}
	/**
	 * 查询客户的交易记录
	 * @return
	 */
	public String findOrders(){
		customer = customerService.findCustomerById(id);
		return "showOrders";
	}
	/**
	 * 预警提示
	 * @return
	 */
	public String warnLost(){
		list = customerService.warnLost();
		return "warnlost";
	}
	
	/**
	 * 客户流失预警处理
	 * @return
	 */
	public String preDeal(){
		customer = customerService.findCustomerById(id);
		return "predeal";
	}
	/**
	 * 服务处理
	 * @return
	 */
	public String serviceDeal(){
		customer = customerService.findCustomerById(id);
		customerService.updateCustomerService(customer,sid);
		if (StringUtils.isNotBlank(customer.getMyService().getType())) {
			msg = "服务通知处理成功！";
			return "success";
		}else {
			msg = "对不起，服务器正忙。。。请稍后重试！";
			return "error";
		}
	}
	
	
	/**
	 * 查询过去的客户
	 */
	public String findTimedCustomer(){
		list = customerService.findDetachCustomer();
		return "losted";
	}
	
	/**
	 * 客户流失确认处理
	 * @return
	 */
	public String lostDeal(){
		
		return "lostdeal";
	}
	/**
	 * 确认客户流失：修改客户状态为流失
	 * @return
	 */
	public String changeState(){
		customer = customerService.findCustomerById(id);
		boolean flag = customerService.updateState(customer);
		if (flag) {
			msg = "此用户已经确认流失！！";
		}else {
			msg = "不好意思，服务器正忙，请稍等片刻后再次操作。。。";
		}
		return null;
	}
	
	/**
	 * 模拟测试---出问题（懒加载--内存溢出）
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public String findEmployees() throws UnsupportedEncodingException{
		eList = customerService.findEmps();
		this.jsonInputStream = List2Json.json2Stream(eList);
		return "employees";
	}
	/**
	 * 找服务
	 * @return
	 */
	public String findServices(){
		services = customerService.findServs();
		return "showServices";
	}
	
	/**
	 * 查询潜在客户
	 * @return
	 */
	public String findHidden(){
		list = customerService.findHiddens();
		return "showHidden";
	}
	
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public List<Customer> getList() {
		return list;
	}
	public void setList(List<Customer> list) {
		this.list = list;
	}
	public String[] getIds() {
		return ids;
	}
	public void setIds(String[] ids) {
		this.ids = ids;
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<CustomerSearch> getToday_cont() {
		return today_cont;
	}
	public void setToday_cont(List<CustomerSearch> today_cont) {
		this.today_cont = today_cont;
	}
	public List<Customer> getDetach_cont() {
		return detach_cont;
	}
	public void setDetach_cont(List<Customer> detach_cont) {
		this.detach_cont = detach_cont;
	}
	public Integer getLid() {
		return lid;
	}
	public void setLid(Integer lid) {
		this.lid = lid;
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public List<Employee> geteList() {
		return eList;
	}
	public void seteList(List<Employee> eList) {
		this.eList = eList;
	}
	public InputStream getJsonInputStream() {
		return jsonInputStream;
	}
	public void setJsonInputStream(InputStream jsonInputStream) {
		this.jsonInputStream = jsonInputStream;
	}
	private List<MyService> services;

	public List<MyService> getServices() {
		return services;
	}
	public void setServices(List<MyService> services) {
		this.services = services;
	}
	
	
}
