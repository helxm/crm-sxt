package com.bjsxt.crm.service.impl.order;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.bjsxt.crm.po.OrderStatu;
import com.bjsxt.crm.service.order.OrderService;

@Component
public class OrderStatuImpl implements OrderService<OrderStatu> {
	private HibernateTemplate hibernateTemplate;

	@Transactional
	public void add(OrderStatu bean) {
		//bean = OrderNumberGenerate.getOrNumber(bean);
		hibernateTemplate.save(bean);

	}
	
	@Transactional
	public void del(OrderStatu bean) {
		hibernateTemplate.delete(bean);
	}
	/**
	 * 可用方法
	 * 优先按OrderStatu 状态码查找,再按id查找
	 */
	@Transactional
	public OrderStatu find(OrderStatu bean) {
		if(bean.getStatuNum()!=null){//优先按OrderStatu 状态码查找
			@SuppressWarnings("unchecked")
			List<OrderStatu> orderStatus = hibernateTemplate.find("from OrderStatu os where os.statuNum="+bean.getStatuNum());
			if(orderStatus!=null && orderStatus.size()!=0){
				return orderStatus.get(0);
			}
		}
		return (OrderStatu) hibernateTemplate.get(OrderStatu.class, bean.getId());
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public void update(OrderStatu bean) {
		// TODO Auto-generated method stub
		
	}

	public List<OrderStatu> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public Object findByDto(OrderStatu bean) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<OrderStatu> findByStatu(OrderStatu orderStatu) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<OrderStatu> findByTime(OrderStatu orderStatu, String timeFun) {
		// TODO Auto-generated method stub
		return null;
	}

}
