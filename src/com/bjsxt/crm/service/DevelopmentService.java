package com.bjsxt.crm.service;

import java.util.List;

import com.bjsxt.crm.po.Development;

public interface DevelopmentService {
	/**
	 * 添加
	 */
	void add(Development development,Integer mid);
	/**
	 * 查询所有
	 * @return
	 */
	List<Development> findAll();
	/**
	 * 批量删除
	 * @param converterStringArray2IntegerArray
	 */
	void deleteDevelopmentByIds(Integer[] converterStringArray2IntegerArray);
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	Development findDevelopmentById(Integer id);
	/**
	 * 更新信息
	 */
	void updateDevelopment(Development development);

}
