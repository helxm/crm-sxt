package com.bjsxt.crm.service;

import java.util.List;

import com.bjsxt.crm.dto.CustomerSearch;
import com.bjsxt.crm.po.Customer;
import com.bjsxt.crm.po.Employee;
import com.bjsxt.crm.po.MyService;

public interface CustomerService {
	/**
	 * 添加客户信息
	 * @param customer
	 */
	void add(Customer customer);
	
	/**
	 * 查询所有的客户
	 */
	List<Customer> findAll();
	
	/**
	 * 批量删除客户
	 * @param integers
	 */
	void deleteCustomerByIds(Integer[] integers);
	/**
	 * 根据id查找客户
	 * @param id
	 * @return
	 */
	Customer findCustomerById(Integer id);
	/**
	 * 更新客户信息
	 * @param customer
	 */
	void updateCustomer(Customer customer,Integer eid);
	/**
	 * 根据条件查询相应的客户
	 * @param customerSearch
	 * @return
	 */
	List<Customer> findCustomerWithConditions(CustomerSearch customerSearch);
	
	/**
	 * 查询今天需要联系的客户
	 * @return
	 */
	List<CustomerSearch> findByDate();
	/**
	 * 今天联系一次之后修改联系时间
	 * @param id
	 */
	void updateTouchRecode(Integer id);
	/**
	 * 查询过时的客户
	 * @return
	 */
	List<Customer> findDetachCustomer();
	/**
	 * 添加客户的联系人
	 * @param id
	 * @param lid
	 */
	void updateCustomerByLId(Integer id, Integer lid);
	/**
	 * 客户流失预警
	 * @return
	 */
	List<Customer> warnLost();
	/**
	 * 修改客户关联服务
	 * @param customer
	 * @return
	 */
	
	void updateCustomerService(Customer customer, Integer sid);
	/**
	 * 修改客户的状态
	 * @param customer
	 * @return
	 */
	boolean updateState(Customer customer);

	List<Employee> findEmps();
	/**
	 * 找服务
	 * @return
	 */
	List<MyService> findServs();
	/**
	 * 查找潜在客户
	 * @return
	 */
	List<Customer> findHiddens();
}
