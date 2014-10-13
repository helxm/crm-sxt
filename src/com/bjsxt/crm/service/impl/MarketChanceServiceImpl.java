package com.bjsxt.crm.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.po.Customer;
import com.bjsxt.crm.po.Employee;
import com.bjsxt.crm.po.LinkMan;
import com.bjsxt.crm.po.MarketChance;
import com.bjsxt.crm.service.MarketChanceService;

@Component
public class MarketChanceServiceImpl implements MarketChanceService {
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	/**
	 * 创建销售机会列表
	 */
	public void add(MarketChance marketChance) {
		hibernateTemplate.save(marketChance);
	}
	/**
	 * 查询所有的销售机会列表
	 */
	@SuppressWarnings("unchecked")
	public List<MarketChance> findAll() {
		return hibernateTemplate.find("from MarketChance");
	}
	/**
	 * 批量删除
	 */
	public void deleteCustomerByIds(Integer[] ids) {
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
	public MarketChance findMarketChanceById(Integer id) {
		return (MarketChance) hibernateTemplate.get(MarketChance.class, id);
	}
	/**
	 * 更新销售机会信息
	 */
	public void updateMarketChance(MarketChance marketChance) {
		hibernateTemplate.update(marketChance);
	}
	
	/**
	 * 分配联系人
	 */
	public void updateMarketChanceByLId(Integer id, Integer lid) {
		MarketChance marketChance = (MarketChance) hibernateTemplate.get(MarketChance.class, id);
		LinkMan linkMan = (LinkMan) hibernateTemplate.get(LinkMan.class, lid);
		marketChance.setLinkMan(linkMan);
		hibernateTemplate.update(marketChance);
		
	}
	/**
	 * 找到所有的员工【此处方法不该在此包下，应该在EmployeeServiceImpl中,此处是为了测试】
	 */
	@SuppressWarnings("unchecked")
	public List<Employee> findEmps() {
		return hibernateTemplate.find("from Employee");
	}
	/**
	 * 分配创建人
	 */
	public void updateMarketChanceByEId(Integer id, Integer eid) {
		MarketChance marketChance = (MarketChance) hibernateTemplate.get(MarketChance.class, id);
		Employee employee = (Employee) hibernateTemplate.get(Employee.class, eid);
		marketChance.setCreateMan(employee.getName());
		hibernateTemplate.update(marketChance);
	}
	
	
}
