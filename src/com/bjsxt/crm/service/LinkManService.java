package com.bjsxt.crm.service;

import java.util.List;

import com.bjsxt.crm.dto.LinkManSearch;
import com.bjsxt.crm.po.LinkMan;

public interface LinkManService {
	/**
	 * 查询所有的联系人
	 * @return
	 */
	List<LinkMan> findAll();
	/**
	 * 添加联系人
	 * @param linkMan
	 */
	void add(LinkMan linkMan);
	/**
	 * 根据条件查询
	 * @param linkManSearch
	 * @return
	 */
	List<LinkMan> findLinkManWithCondition(LinkManSearch linkManSearch);
	/**
	 * 批量删除
	 * @param converterStringArray2IntegerArray
	 */
	void deleteLinkManByIds(Integer[] converterStringArray2IntegerArray);
	
}
