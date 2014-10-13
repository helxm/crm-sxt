package com.bjsxt.crm.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.po.Development;
import com.bjsxt.crm.service.DevelopmentService;
import com.bjsxt.crm.util.DataType;

@Component
@Scope("prototype")
public class DevelopmentAction {
	private DevelopmentService developmentService;

	public DevelopmentService getDevelopmentService() {
		return developmentService;
	}
	@Resource
	public void setDevelopmentService(DevelopmentService developmentService) {
		this.developmentService = developmentService;
	}
	
	private List<Development> list = new ArrayList<Development>();
	private Integer id;
	private Development development;
	private String[] ids;
	private Integer mid;
	
	
	/**
	 * 添加
	 */
	public String add(){
		
		return "add";
	}
	/**
	 * 保存对象
	 */
	public String save(){
		developmentService.add(development,mid);
		return "listAction";
	}
	
	/**
	 * 查询所有
	 * @return
	 */
	public String findAll(){
		list = developmentService.findAll();
		return "list";
	}
	
	/**
	 * 批量删除记录
	 * @return
	 */
	public String delete(){
		if (ids!=null && ids.length>0) {
			developmentService.deleteDevelopmentByIds(DataType.converterStringArray2IntegerArray(ids));
			return "listAction";
		}
		return null;
	}
	
	/**
	 * 根据id查询
	 * @return
	 */
	public String edit(){
		development = developmentService.findDevelopmentById(id);
		return "edit";
	}
	
	/**
	 * 更新信息
	 */
	public String update(){
		developmentService.updateDevelopment(development);
		return "listAction";
	}
	
	/**
	 * 显示计划内容
	 * @return
	 */
	public String showContent(){
		development = developmentService.findDevelopmentById(id);
		return "show";
	}
	
	public List<Development> getList() {
		return list;
	}
	public void setList(List<Development> list) {
		this.list = list;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Development getDevelopment() {
		return development;
	}
	public void setDevelopment(Development development) {
		this.development = development;
	}
	public String[] getIds() {
		return ids;
	}
	public void setIds(String[] ids) {
		this.ids = ids;
	}
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
}
