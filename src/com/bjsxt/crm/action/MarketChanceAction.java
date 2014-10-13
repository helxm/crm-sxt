package com.bjsxt.crm.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.po.Employee;
import com.bjsxt.crm.po.MarketChance;
import com.bjsxt.crm.service.MarketChanceService;
import com.bjsxt.crm.util.DataType;

@Component
@Scope("prototype")
public class MarketChanceAction {
	private MarketChanceService marketChanceService;

	public MarketChanceService getMarketChanceService() {
		return marketChanceService;
	}
	@Resource
	public void setMarketChanceService(MarketChanceService marketChanceService) {
		this.marketChanceService = marketChanceService;
	}
	
	private List<MarketChance> list = new ArrayList<MarketChance>();
	private Integer id;
	private MarketChance marketChance;
	private String[] ids;
	private Integer lid;
	private Integer eid;
	private List<Employee> emps;
	
	/**
	 * 跳转到添加销售机会页面
	 * @return
	 */
	public String add(){
		return "add";
	}
	
	/**
	 * 保存对象
	 * @return
	 */
	public String save(){
		marketChanceService.add(marketChance);
		return "listAction";
	}
	
	/**
	 * 查询所有的数据
	 * @return
	 */
	public String findAll(){
		list = marketChanceService.findAll();
		return "list";
	}
	
	/**
	 * 批量删除销售机会
	 * @return
	 */
	public String deleteBatch(){
		if (ids!=null && ids.length>0) {
			marketChanceService.deleteCustomerByIds(DataType.converterStringArray2IntegerArray(ids));
			return "listAction";
		}
		return null;
	}
	
	/**
	 * 编辑信息
	 * @return
	 */
	public String edit(){
		marketChance = marketChanceService.findMarketChanceById(id);
		return "edit";
	}
	/**
	 * 更新信息
	 * @return
	 */
	public String update(){
		marketChanceService.updateMarketChance(marketChance);
		return "listAction";
	}
	/**
	 * 分配联系人
	 * @return
	 */
	public String allocate(){
		marketChanceService.updateMarketChanceByLId(id,lid);
		return "listAction";
	}
	/**
	 * 分配创建人【此处是错误的行为】
	 * @return
	 */
	public String findEmployees(){
		emps = marketChanceService.findEmps();
		return "chooseEmp";
	}
	/**
	 * 分配联系人
	 * @return
	 */
	public String allocateEmp(){
		marketChanceService.updateMarketChanceByEId(id,eid);
		return "listAction";
	}
	
	/**
	 * 创建人【此处是错误的行为】
	 * @return
	 */
	public String findEmps(){
		emps = marketChanceService.findEmps();
		return "cemps";
	}
	
	public List<MarketChance> getList() {
		return list;
	}
	public void setList(List<MarketChance> list) {
		this.list = list;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public MarketChance getMarketChance() {
		return marketChance;
	}
	public void setMarketChance(MarketChance marketChance) {
		this.marketChance = marketChance;
	}
	public String[] getIds() {
		return ids;
	}
	public void setIds(String[] ids) {
		this.ids = ids;
	}
	public Integer getLid() {
		return lid;
	}
	public void setLid(Integer lid) {
		this.lid = lid;
	}
	public List<Employee> getEmps() {
		return emps;
	}
	public void setEmps(List<Employee> emps) {
		this.emps = emps;
	}
	public Integer getEid() {
		return eid;
	}
	public void setEid(Integer eid) {
		this.eid = eid;
	}
	
	
}
