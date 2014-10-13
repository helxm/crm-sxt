package com.bjsxt.crm.dto;

import java.util.List;

/**
 * 用于产品统计模块的选择商品分类用
 * @author Administrator
 *
 */
public class OpCusDto {
	private Integer code;//200
	private String message;//操作成功与否的信息
	/**
	 * 客户id+name
	 */
	private List<CusData> data;
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public List<CusData> getData() {
		return data;
	}
	public void setData(List<CusData> data) {
		this.data = data;
	}

	
}
