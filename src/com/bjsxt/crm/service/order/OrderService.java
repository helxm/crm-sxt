package com.bjsxt.crm.service.order;

import java.util.List;

import com.bjsxt.crm.po.OrderStatu;
public interface  OrderService<T> {
	void add(T bean);
	void update(T bean);
	void del(T bean);
	T find(T bean);
	List<T> findAll();
	Object findByDto(final T bean) ;
	List<T> findByStatu(OrderStatu orderStatu) ;
	/**
	 * 
	 * @param orderStatu
	 * @param timeFun ---- 日："date" ; 月： "month" ; 年： "year"
	 * @return
	 */
	List<T> findByTime(OrderStatu orderStatu,String timeFun);
}
