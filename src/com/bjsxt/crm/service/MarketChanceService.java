package com.bjsxt.crm.service;

import java.util.List;

import com.bjsxt.crm.po.Employee;
import com.bjsxt.crm.po.MarketChance;

public interface MarketChanceService {
	/**
	 * 创建销售机会表
	 * @param marketChance
	 */
	void add(MarketChance marketChance);
	/**
	 * 查询所有的销售机会列表
	 * @return
	 */
	List<MarketChance> findAll();
	/**
	 * 批量删除销售机会记录
	 * @param converterStringArray2IntegerArray
	 */
	void deleteCustomerByIds(Integer[] converterStringArray2IntegerArray);
	/**
	 * 根据id查找销售机会
	 * @param id
	 * @return
	 */
	MarketChance findMarketChanceById(Integer id);
	
	/**
	 * 分配联系人
	 * @param id
	 * @param lid
	 */
	void updateMarketChanceByLId(Integer id, Integer lid);
	
	/**
	 * 更新信息
	 */
	void updateMarketChance(MarketChance marketChance);
	/**
	 * 找到所有的员工
	 * @return
	 */
	List<Employee> findEmps();
	/**
	 * 分配创建人
	 * @param id
	 * @param eid
	 */
	void updateMarketChanceByEId(Integer id, Integer eid);

}
