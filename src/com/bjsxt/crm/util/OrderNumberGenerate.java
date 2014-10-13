package com.bjsxt.crm.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import com.bjsxt.crm.po.Order;
/**
 * 为order生成订单编号
 * 订单编号：or_number(由8位日期+4位商品编号+4位客户编号+uuid，最终截取前16位)
 * @author Administrator
 *
 */
public class OrderNumberGenerate {
	public static Order getOrNumber(Order order){
		if(order.getTime()==null){
			order.setTime(new Date());
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String or_number = dateFormat.format(order.getTime());
		if(order.getProduct()!=null){
			or_number += order.getProduct().getId();
		}
		if(order.getCustomer()!=null){
			or_number += order.getCustomer().getId();
		}
		or_number += UUID.randomUUID().toString().replace("-", "");
		order.setOr_number(or_number.substring(0,16));
		return order;
	}
}
