package com.bjsxt.crm.service.impl;

import java.io.Serializable;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.dto.CustomerSearch;
import com.bjsxt.crm.po.Customer;
import com.bjsxt.crm.po.Employee;
import com.bjsxt.crm.po.LinkMan;
import com.bjsxt.crm.po.MyService;
import com.bjsxt.crm.po.Order;
import com.bjsxt.crm.service.CustomerService;
import com.bjsxt.crm.util.DataType;

@Component
public class CustomerServiceImpl implements CustomerService {
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	/**
	 * 添加客户
	 */
	public void add(Customer customer) {
		customer.setStatus("1");
		hibernateTemplate.save(customer);
	}

	/**
	 * 查询所有的客户
	 */
	@SuppressWarnings("unchecked")
	public List<Customer> findAll() {
		return hibernateTemplate.find("from Customer");
	}

	/**
	 * 批量删除用户
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
	 * 根据id查找用户
	 */
	public Customer findCustomerById(Integer id) {
		return (Customer) hibernateTemplate.get(Customer.class, id);
	}

	public void updateCustomer(Customer customer, Integer eid) {
		
		customer.setEmployee((Employee) hibernateTemplate.get(Employee.class, eid));
		hibernateTemplate.update(customer);
	}

	/**
	 * 根据搜索条件查询客户
	 */
	@SuppressWarnings("unchecked")
	public List<Customer> findCustomerWithConditions(CustomerSearch customerSearch) {
		if (customerSearch == null) {
			throw new RuntimeException("传递给业务层的权限组查询条件的对象为空！！");
		}
		//组织查询条件  封装查询条件需要的数据
		String whereHql = "select o from Customer o where 1=1";

		if (StringUtils.isNotBlank(customerSearch.getCust_num())) {
			whereHql += " and o.cust_num like '%" + customerSearch.getCust_num() + "%'";
		}
		if (StringUtils.isNotBlank(customerSearch.getName())) {
			whereHql += " and o.name like '%" + customerSearch.getName() + "%'";
		}
		whereHql += " order by o.cust_num asc";
		System.out.println(whereHql);
		return hibernateTemplate.find(whereHql);
	}

	/**
	 * 今天需要联系的客户
	 */
	@SuppressWarnings("unchecked")
	public List<CustomerSearch> findByDate() {
		return (List<CustomerSearch>) hibernateTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				String sql = "select o.id from t_customer o where (select to_days(date_format(now(),'%Y-%m-%d %H:%i:%S'))-to_days(date_format(o.createTime,'%Y-%m-%d %H:%i:%S'))>90)";
				String sql2 = "select o.phone from t_customer o where (select to_days(date_format(now(),'%Y-%m-%d %H:%i:%S'))-to_days(date_format(o.createTime,'%Y-%m-%d %H:%i:%S'))>90)";
				String sql3 = "select o.cust_num from t_customer o where (select to_days(date_format(now(),'%Y-%m-%d %H:%i:%S'))-to_days(date_format(o.createTime,'%Y-%m-%d %H:%i:%S'))>90)";
				String sql4 = "select o.name from t_customer o where (select to_days(date_format(now(),'%Y-%m-%d %H:%i:%S'))-to_days(date_format(o.createTime,'%Y-%m-%d %H:%i:%S'))>90)";
				List<Integer> list1 = session.createSQLQuery(sql).list();
				List<String> list2 = session.createSQLQuery(sql2).list();
				List<String> list3 = session.createSQLQuery(sql3).list();
				List<String> list4 = session.createSQLQuery(sql4).list();
				List<CustomerSearch> list5 = new ArrayList<CustomerSearch>();
				for (int i = 0; i < list1.size(); i++) {
					CustomerSearch customerSearch = new CustomerSearch(list1.get(i), list3.get(i), list4.get(i), list2.get(i));
					list5.add(customerSearch);

				}
				return list5;
			}
		});
	}

	/**
	 * 修改联系记录（今天联系的人）
	 */
	public void updateTouchRecode(Integer id) {
		Customer customer = (Customer) hibernateTemplate.get(Customer.class, id);
		customer.setLatestTouchtime(DataType.getCurrentTime());
		hibernateTemplate.update(customer);
	}

	/**
	 * 查询过时的客户（订单记录是一年以前的）
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Customer> findDetachCustomer() {
		//获取订单中的最新记录时间
		List<Customer> customers = new ArrayList<Customer>();
		List<Order> orders = hibernateTemplate.find("from Order");
		Map<Customer, Date> map = new HashMap<Customer, Date>();
		
		for (Iterator iterator = orders.iterator(); iterator.hasNext();) {
			Order order = (Order) iterator.next();
			if (map!=null&& map.containsKey(order.getCustomer())) {
				Date date1 = map.get(order.getCustomer());
				if (order.getTime().getTime()>date1.getTime()) {
					map.put(order.getCustomer(), order.getTime());
				}
				continue;
			}
			map.put(order.getCustomer(), order.getTime());
		}
		for (Map.Entry<Customer,Date> entry : map.entrySet()) {
			System.out.println(new Date().getTime());
			System.out.println(entry.getValue().getTime());
			System.out.println(new Date().getTime()-entry.getValue().getTime());
			System.out.println((new Date().getTime()-entry.getValue().getTime())>(31536000000l));
			if ((new Date().getTime()-entry.getValue().getTime())>31536000000l) {
				customers.add(entry.getKey());
			}
		}
		return customers;
		
	}

	/**
	 * 添加联系人
	 */
	public void updateCustomerByLId(Integer id, Integer lid) {
		Customer customer = (Customer) hibernateTemplate.get(Customer.class, id);
		LinkMan linkMan = (LinkMan) hibernateTemplate.get(LinkMan.class, lid);
		customer.setLinkMan(linkMan);
		hibernateTemplate.update(customer);
	}

	//测试
	@SuppressWarnings("unused")
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext.xml" });
		CustomerService customerService = (CustomerService) ac.getBean("customerServiceImpl");
		//		List list = customerService.warnLost();
		//		System.out.println(list.size());

	}

	/**
	 * 客户流失预警
	 * 六个月没有下单的客户
	 */
	@SuppressWarnings("unchecked")
	public List<Customer> warnLost() {
		String time = getOrderMaxTime();
		if (StringUtils.isNotBlank(time)) {
			return hibernateTemplate.find("from Customer o where (to_days(date_format(now(),'%Y-%m-%d %H:%i:%S'))-to_days(date_format('" + time + "','%Y-%m-%d %H:%i:%S'))>180) and "
					+ "(to_days(date_format(now(),'%Y-%m-%d %H:%i:%S'))-to_days(date_format('" + time + "','%Y-%m-%d %H:%i:%S'))<210) and o.status=1 and " +
					"(to_days(date_format(now(),'%Y-%m-%d %H:%i:%S'))-to_days(date_format(o.latestTouchtime,'%Y-%m-%d %H:%i:%S'))>90)");
		}
		return null;
	}

	/**
	 * 获取订单的最新时间
	 * @return
	 */
	private String getOrderMaxTime() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date myDate = (Date)hibernateTemplate.execute(new HibernateCallback() {
			String sql = "select max(r.time) from t_order r";

			public Date doInHibernate(Session session) throws HibernateException, SQLException {
				Date date = (Date) session.createSQLQuery(sql).list().get(0);
				return date;
			}
		});
		if (myDate==null) {
			return null;
		}else{
			String time = sf.format(myDate);
			return time;
		}
	}

	/**
	 * 添加服务
	 */
	public void updateCustomerService(Customer customer, Integer sid) {
		customer.setMyService((MyService) hibernateTemplate.get(MyService.class, sid));
		customer.setLatestTouchtime(DataType.getCurrentTime());
		hibernateTemplate.update(customer);
	}

	/**
	 * 修改客户的状态
	 */
	public boolean updateState(Customer customer) {
		customer.setStatus("0");
		hibernateTemplate.update(customer);
		return true;
	}
	/**
	 * 测试
	 */
	@SuppressWarnings("unchecked")
	public List<Employee> findEmps() {
		return hibernateTemplate.find("from Employee");
	}
	/**
	 * 找服务
	 */
	@SuppressWarnings("unchecked")
	public List<MyService> findServs() {
		return hibernateTemplate.find("from MyService");
	}
	/**
	 * 查找潜在客户
	 */
	@SuppressWarnings("unchecked")
	public List<Customer> findHiddens() {
		String hql = "from Customer c where c.type=0 and c.marketChance.status<>1";
		return hibernateTemplate.find(hql);
	}
}
