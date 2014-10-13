package com.bjsxt.crm.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.dto.LinkManSearch;
import com.bjsxt.crm.po.LinkMan;
import com.bjsxt.crm.service.LinkManService;

@Component
public class LinkManServiceImpl implements LinkManService {
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	/**
	 * 查询所有的联系人
	 */
	@SuppressWarnings("unchecked")
	public List<LinkMan> findAll() {
		return hibernateTemplate.find("from LinkMan");
	}
	/**
	 * 添加联系人
	 */
	public void add(LinkMan linkMan) {
		hibernateTemplate.save(linkMan);
	}
	
	/**
	 * 条件查询
	 */
	@SuppressWarnings("unchecked")
	public List<LinkMan> findLinkManWithCondition(LinkManSearch linkManSearch) {
		if (linkManSearch ==null) {
			throw new RuntimeException("传递给业务层的权限组查询条件的对象为空！！");
		}
		//组织查询条件  封装查询条件需要的数据
		String whereHql = "select o from LinkMan o where 1=1";
		if (StringUtils.isNotBlank(linkManSearch.getName())) {
			whereHql += " and o.name like '%"+linkManSearch.getName()+"%'";
		}
		whereHql += " order by o.name asc";
		System.out.println(whereHql);
		return hibernateTemplate.find(whereHql);
	}
	/**
	 * 批量删除
	 */
	public void deleteLinkManByIds(Integer[] ids) {
		if (ids!=null && ids.length>0) {
			for (Serializable id : ids) {
				Object obj = this.hibernateTemplate.get(LinkMan.class,id);
				if (obj==null) {
					throw new RuntimeException("你要查找的["+id+"]不存在");
				}
				this.hibernateTemplate.delete(obj);
			}
		}
	}
}
