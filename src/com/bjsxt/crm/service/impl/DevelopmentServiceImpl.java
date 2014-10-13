package com.bjsxt.crm.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.po.Customer;
import com.bjsxt.crm.po.Development;
import com.bjsxt.crm.po.MarketChance;
import com.bjsxt.crm.service.DevelopmentService;
@Component
public class DevelopmentServiceImpl implements DevelopmentService {
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	/**
	 * 添加开发计划
	 */
	public void add(Development development,Integer mid) {
		MarketChance marketChance = (MarketChance)hibernateTemplate.get(MarketChance.class, mid);
		marketChance.setStatus("1");
		development.setMarketChance(marketChance);
		development.setResult("1");
		hibernateTemplate.save(development);
	}
	/**
	 * 查询所有
	 */
	@SuppressWarnings("unchecked")
	public List<Development> findAll() {
		return hibernateTemplate.find("from Development");
	}
	/**
	 * 批量删除
	 */
	public void deleteDevelopmentByIds(Integer[] ids) {
		if (ids != null && ids.length > 0) {
			for (Serializable id : ids) {
				Object obj = this.hibernateTemplate.get(Customer.class, id);
				if (obj == null) {
					throw new RuntimeException("你要查找的[" + id + "]不存在");
				}
				this.hibernateTemplate.delete(obj);
			}
		}
	}
	/**
	 * 根据id查询
	 */
	public Development findDevelopmentById(Integer id) {
		return (Development) hibernateTemplate.get(Development.class, id);
	}
	/**
	 * 更新信息
	 */
	public void updateDevelopment(Development development) {
		hibernateTemplate.update(development);
	}
	
	
}
