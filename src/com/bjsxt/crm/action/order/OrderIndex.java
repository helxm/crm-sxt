package com.bjsxt.crm.action.order;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.po.Customer;
import com.bjsxt.crm.po.Order;
import com.bjsxt.crm.po.OrderStatu;
import com.bjsxt.crm.po.Product;
import com.bjsxt.crm.service.CustomerService;
import com.bjsxt.crm.service.ProductService;
import com.bjsxt.crm.service.order.OrderService;

@Component
@Scope(value="prototype")
public class OrderIndex {
	private OrderService<Order> orderService ;
	private CustomerService customerService;
	private List<Order> orders;
	private Order order;
	private List<Customer> customers;
	private List<Product> products;
	private ProductService productService;
	private double order_money;
	
	private Integer operate;//操作状态码，2为成功，1为失败
	
	private Integer statuNum;//订单状态码
	private int orderby;//排序状态码，1--下单时间，2--订单状态，3--订单金额
	private OrderStatu orderStatu;
	
	/**
	 * 首页，右一布局
	 */
	private int unDealNum;//退单总金额
	private double unDealNumMonay;//退单总金额
	private int unProceNum;//退单总金额
	private double unProceNumMonay;//退单总金额
	
	/**
	 * 首页，左一布局
	 */
	private int todayTradeNum;//今日交易单数
	private double todayTradeNumMoney;//今日交易金额
	private int todayCancelNum;//今日退单数
	private double todayCancelNumMoney;//今日退单总金额
	private int monthTradeNum;//当月交易单数
	private double monthTradeNumMoney;//当月交易金额
	private int monthCancelNum;//当月退单数
	private double monthCancelNumMoney;//当月退单总金额
	private int yearTradeNum;//当月交易单数
	private double yearTradeNumMoney;//当月交易金额
	private int yearCancelNum;//当月退单数
	private double yearCancelNumMoney;//当月退单总金额
	
	public String indexDeal(){
		//计算待处理订单的数量与总金额
		orderStatu = new OrderStatu();
		orderStatu.setStatuNum(1);
		orders =  orderService.findByStatu(orderStatu);
		if(orders!=null){
			unDealNum = orders.size();
			for(Order order : orders){
				unDealNumMonay += order.getOrder_money();
			}
		}
		orders = null;
		//计算退单数与总金额
		orderStatu.setStatuNum(-1);
		orders =  orderService.findByStatu(orderStatu);
		if(orders!=null){
			unProceNum = orders.size();
			for(Order order : orders){
				unProceNumMonay += order.getOrder_money();
			}
		}
		//-----------------------当日-------------------------
		orders = null;
		//今日交易统计
		orderStatu.setStatuNum(1);
		orders =  orderService.findByTime(orderStatu, "date");
		if(orders!=null){
			todayTradeNum = orders.size();
			for(Order order : orders){
				todayTradeNumMoney += order.getOrder_money();
			}
		}
		orders = null;
		//今日退单统计
		orderStatu.setStatuNum(-1);
		orders =  orderService.findByTime(orderStatu, "date");
		if(orders!=null){
			todayCancelNum = orders.size();
			for(Order order : orders){
				todayCancelNumMoney += order.getOrder_money();
			}
		}
		//--------------------当月---------------------
		orders = null;
		//今月交易统计
		orderStatu.setStatuNum(1);
		orders =  orderService.findByTime(orderStatu, "month");
		if(orders!=null){
			monthTradeNum = orders.size();
			for(Order order : orders){
				monthTradeNumMoney += order.getOrder_money();
			}
		}
		orders = null;
		//今月退单统计
		orderStatu.setStatuNum(-1);
		orders =  orderService.findByTime(orderStatu, "month");
		if(orders!=null){
			monthCancelNum = orders.size();
			for(Order order : orders){
				monthCancelNumMoney += order.getOrder_money();
			}
		}
		//--------------------当年---------------------
		orders = null;
		//本年交易统计
		orderStatu.setStatuNum(1);
		orders =  orderService.findByTime(orderStatu, "year");
		if(orders!=null){
			yearTradeNum = orders.size();
			for(Order order : orders){
				yearTradeNumMoney += order.getOrder_money();
			}
		}
		orders = null;
		//本年退单统计
		orderStatu.setStatuNum(-1);
		orders =  orderService.findByTime(orderStatu, "year");
		if(orders!=null){
			yearCancelNum = orders.size();
			for(Order order : orders){
				yearCancelNumMoney += order.getOrder_money();
			}
		}
		return "index";
	}
	
	/**
	 * 条件查询与排序
	 * @return
	 */
	public String showSeach(){
		if(orderStatu !=null && orderStatu.getStatuNum()!=null){
			orders =  orderService.findByStatu(orderStatu);
			return "showSeach";
		}
		orders =  orderService.findAll();
		if(orderby==1){//1--下单时间
			Collections.sort(orders, new Comparator<Order>() {
				public int compare(Order o1, Order o2) {
					if(o1.getTime()==null){
						return -1;
					}
					if(o2.getTime()==null){
						return 1;
					}
					return o2.getTime().compareTo(o1.getTime());
				}
			});	
		}
		if(orderby==2){//2--订单状态
			Collections.sort(orders, new Comparator<Order>() {
				public int compare(Order o1, Order o2) {
					if(o1.getStatu()==null || o1.getStatu().getStatuNum()==null){
						return -1;
					}
					if(o2.getStatu()==null || o2.getStatu().getStatuNum()==null){
						return 1;
					}
					return o2.getStatu().getStatuNum()-o1.getStatu().getStatuNum();
				}
			});	
		}
		if(orderby==3){//3--订单金额
			Collections.sort(orders, new Comparator<Order>() {
				public int compare(Order o1, Order o2) {
					return (int)(o2.getOrder_money()-o1.getOrder_money());
				}
			});	
		}
		return "orderaction";
		
	}
	
	
	/**
	 * 向页面写入ajax数据
	 * 
	 * @param obj
	 * @return
	 */
/*	private String toJson(Object obj) {
		HttpServletResponse response =  ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		String json = null;
		try {
			json = new Gson().toJson(obj);
			response.getWriter().write(json);
			System.err.println("json-----------------:"+json);
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return json;
	}*/
	
	
	
	
	
	
	
	
	
	
	
	
	public OrderService<Order> getOrderService() {
		return orderService;
	}
	@Resource(name="orderServiceImpl")
	public void setOrderService(OrderService<Order> orderService) {
		this.orderService = orderService;
	}
	public List<Order> getOrders() {
		return orders;
	}
	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public CustomerService getCustomerService() {
		return customerService;
	}
	@Resource
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	public List<Customer> getCustomers() {
		return customers;
	}
	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}
	public ProductService getProductService() {
		return productService;
	}
	@Resource
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	public double getOrder_money() {
		return order_money;
	}
	public void setOrder_money(double order_money) {
		this.order_money = order_money;
	}
	public Integer getOperate() {
		return operate;
	}
	public void setOperate(Integer operate) {
		this.operate = operate;
	}

	public Integer getStatuNum() {
		return statuNum;
	}

	public void setStatuNum(Integer statuNum) {
		this.statuNum = statuNum;
	}

	public OrderStatu getOrderStatu() {
		return orderStatu;
	}

	public void setOrderStatu(OrderStatu orderStatu) {
		this.orderStatu = orderStatu;
	}


	public int getOrderby() {
		return orderby;
	}


	public void setOrderby(int orderby) {
		this.orderby = orderby;
	}

	public int getUnDealNum() {
		return unDealNum;
	}

	public void setUnDealNum(int unDealNum) {
		this.unDealNum = unDealNum;
	}

	public double getUnDealNumMonay() {
		return unDealNumMonay;
	}

	public void setUnDealNumMonay(double unDealNumMonay) {
		this.unDealNumMonay = unDealNumMonay;
	}

	public int getUnProceNum() {
		return unProceNum;
	}

	public void setUnProceNum(int unProceNum) {
		this.unProceNum = unProceNum;
	}

	public double getUnProceNumMonay() {
		return unProceNumMonay;
	}

	public void setUnProceNumMonay(double unProceNumMonay) {
		this.unProceNumMonay = unProceNumMonay;
	}

	public int getTodayTradeNum() {
		return todayTradeNum;
	}

	public void setTodayTradeNum(int todayTradeNum) {
		this.todayTradeNum = todayTradeNum;
	}

	public double getTodayTradeNumMoney() {
		return todayTradeNumMoney;
	}

	public void setTodayTradeNumMoney(double todayTradeNumMoney) {
		this.todayTradeNumMoney = todayTradeNumMoney;
	}

	public int getTodayCancelNum() {
		return todayCancelNum;
	}

	public void setTodayCancelNum(int todayCancelNum) {
		this.todayCancelNum = todayCancelNum;
	}

	public double getTodayCancelNumMoney() {
		return todayCancelNumMoney;
	}

	public void setTodayCancelNumMoney(double todayCancelNumMoney) {
		this.todayCancelNumMoney = todayCancelNumMoney;
	}

	public int getMonthTradeNum() {
		return monthTradeNum;
	}

	public void setMonthTradeNum(int monthTradeNum) {
		this.monthTradeNum = monthTradeNum;
	}

	public double getMonthTradeNumMoney() {
		return monthTradeNumMoney;
	}

	public void setMonthTradeNumMoney(double monthTradeNumMoney) {
		this.monthTradeNumMoney = monthTradeNumMoney;
	}

	public int getMonthCancelNum() {
		return monthCancelNum;
	}

	public void setMonthCancelNum(int monthCancelNum) {
		this.monthCancelNum = monthCancelNum;
	}

	public double getMonthCancelNumMoney() {
		return monthCancelNumMoney;
	}

	public void setMonthCancelNumMoney(double monthCancelNumMoney) {
		this.monthCancelNumMoney = monthCancelNumMoney;
	}

	public int getYearTradeNum() {
		return yearTradeNum;
	}

	public void setYearTradeNum(int yearTradeNum) {
		this.yearTradeNum = yearTradeNum;
	}

	public double getYearTradeNumMoney() {
		return yearTradeNumMoney;
	}

	public void setYearTradeNumMoney(double yearTradeNumMoney) {
		this.yearTradeNumMoney = yearTradeNumMoney;
	}

	public int getYearCancelNum() {
		return yearCancelNum;
	}

	public void setYearCancelNum(int yearCancelNum) {
		this.yearCancelNum = yearCancelNum;
	}

	public double getYearCancelNumMoney() {
		return yearCancelNumMoney;
	}

	public void setYearCancelNumMoney(double yearCancelNumMoney) {
		this.yearCancelNumMoney = yearCancelNumMoney;
	}

}
