package com.bjsxt.crm.service.impl.order;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.bjsxt.crm.dto.Order_dto;
import com.bjsxt.crm.po.Order;
import com.bjsxt.crm.po.OrderStatu;
import com.bjsxt.crm.service.order.OrderService;
import com.bjsxt.crm.util.OrderNumberGenerate;

@Component
public class OrderServiceImpl implements OrderService<Order> {
	private HibernateTemplate hibernateTemplate;

	@Transactional
	public void add(Order bean) {
		bean = OrderNumberGenerate.getOrNumber(bean);
		hibernateTemplate.save(bean);

	}

	@Transactional
	public void del(Order bean) {
		hibernateTemplate.delete(bean);
	}

	@Transactional
	public Order find(Order bean) {
		return (Order) hibernateTemplate.get(Order.class, bean.getId());
	}

	@Transactional
	public Order_dto findByDto(final Order bean) {
		return (Order_dto) hibernateTemplate.execute(new HibernateCallback() {

			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query obj = session
						.createQuery("select new com.bjsxt.crm.po.Order_dto(o.id,o.num,o.order_money,o.unpay_money,o.time,o.status,o.or_number,e.id,p.id,c.id) from  Order o left join o.employee e left join o.product p left join o.customer c where o.id="
								+ bean.getId());
				@SuppressWarnings("unchecked")
				List<Order_dto> list = obj.list();
				if(list==null || list.size()==0){
					return null;
				}
				return obj.list().get(0);
			}
		});
	}

	@Transactional
	public void update(Order bean) {
		hibernateTemplate.update(bean);
	}

	@Transactional
	@SuppressWarnings("unchecked")
	public List<Order> findAll() {
		return hibernateTemplate.find("from Order o where o.statu.statuNum > -2");
	}
	@Transactional
	@SuppressWarnings("unchecked")
	public List<Order> findByStatu(OrderStatu orderStatu) {
		if(orderStatu.getStatuNum()>0){
			return hibernateTemplate.find("from Order o where o.statu.statuNum > 0");
		}else if(orderStatu.getStatuNum()==0){
			return hibernateTemplate.find("from Order o where o.statu.statuNum=0");
		}else if(orderStatu.getStatuNum()==-1){
			return hibernateTemplate.find("from Order o where o.statu.statuNum=-1");
		}
		return hibernateTemplate.find("from Order o where o.statu.statuNum=-2");
	}
	@Transactional
	@SuppressWarnings("unchecked")
	public List<Order> findByTime(OrderStatu orderStatu,String timeFun) {
		if(orderStatu.getStatuNum()>0){
			return hibernateTemplate.find("from Order o where o.statu.statuNum > 0 and "+timeFun+"(o.time)>"+timeFun+"(SYSDATE())-1");
		}else if(orderStatu.getStatuNum()==0){
			return hibernateTemplate.find("from Order o where o.statu.statuNum=0 and "+timeFun+"(o.time)>"+timeFun+"(SYSDATE())-1");
		}
		return hibernateTemplate.find("from Order o where o.statu.statuNum=-1 and "+timeFun+"(o.time)>"+timeFun+"(SYSDATE())-1");
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

}
