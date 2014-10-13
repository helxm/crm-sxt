package com.bjsxt.crm.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.dto.LinkManSearch;
import com.bjsxt.crm.po.LinkMan;
import com.bjsxt.crm.service.LinkManService;
import com.bjsxt.crm.util.DataType;

@Component
@Scope("prototype")
public class LinkManAction {
	private LinkManService linkManService;

	public LinkManService getLinkManService() {
		return linkManService;
	}

	@Resource
	public void setLinkManService(LinkManService linkManService) {
		this.linkManService = linkManService;
	}

	private List<LinkMan> links;
	private LinkMan linkMan;
	private List<LinkManSearch> search;
	private String name;
	private String[] ids;
	
	
	
	/**
	 * 查询所有的联系人
	 * @return
	 */
	public String findAll() {
		links = linkManService.findAll();
		return "list";
	}
	/**
	 * 进入到添加页面
	 * @return
	 */
	public String add(){
		return "add";
	}
	
	/**
	 * 保存
	 * @return
	 */
	public String save(){
		linkManService.add(linkMan);
		return "listAction";
	}
	
	/**
	 * 条件查询
	 * @return
	 */
	public String findLink(){
		LinkManSearch linkManSearch = new LinkManSearch(name);
		this.links = linkManService.findLinkManWithCondition(linkManSearch);
		return "list";
		
	}
	
	/**
	 * 批量删除
	 * @return
	 */
	public String delete(){
		if (ids!=null && ids.length>0) {
			linkManService.deleteLinkManByIds(DataType.converterStringArray2IntegerArray(ids));
			return "listAction";
		}
		return null;
	}
	/**
	 * 客户管理模块
	 * @return
	 */
	public String findAllocates(){
		links = linkManService.findAll();
		return "allocate";
	}
	/**
	 * 营销管理模块
	 * @return
	 */
	public String findForAllocates(){
		links = linkManService.findAll();
		return "mallocate";
	}
	
	public List<LinkMan> getLinks() {
		
		return links;
	}

	public void setLinks(List<LinkMan> links) {
		this.links = links;
	}


	public LinkMan getLinkMan() {
		return linkMan;
	}

	public void setLinkMan(LinkMan linkMan) {
		this.linkMan = linkMan;
	}

	public List<LinkManSearch> getSearch() {
		return search;
	}

	public void setSearch(List<LinkManSearch> search) {
		this.search = search;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String[] getIds() {
		return ids;
	}

	public void setIds(String[] ids) {
		this.ids = ids;
	}
}
