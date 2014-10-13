package com.bjsxt.crm.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.bjsxt.crm.dto.TreeNode;
import com.bjsxt.crm.po.Menu;
import com.bjsxt.crm.po.Role;
import com.bjsxt.crm.service.MenuService;

@Component
public class MenuServiceImpl implements MenuService {
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@SuppressWarnings({ "unchecked" })
	public List<TreeNode> find4tree(Integer roleId) {
		//查出所有menu 
		List<Menu> listMenu = hibernateTemplate.find("from Menu");
		ArrayList<TreeNode> treeList = new ArrayList<TreeNode>();
		//查出指定RoleId下menu
		List<Integer> menuIds = new ArrayList<Integer>();

		menuIds = (ArrayList<Integer>) hibernateTemplate.find("select r.menu.id from Role r where r.id=?", new Object[] { roleId });

		for (Menu menu : listMenu) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(menu.getId());
			treeNode.setName(menu.getName());
			treeNode.setUrl(menu.getUrl());

			if (menu.getParent() != null) {
				treeNode.setpId(menu.getParent().getId());
			}

			if (menuIds.contains(menu.getId())) {
				treeNode.setChecked(true);
			}
			treeNode.setIcon(menu.getIcon());
			treeList.add(treeNode);
		}
		return treeList;
	}

	@Transactional
	public void select(Integer roleId, Integer[] menuIds) {
		Role role = (Role) hibernateTemplate.get(Role.class, roleId);
		for (Integer me : menuIds) {
			Menu menu = (Menu) hibernateTemplate.get(Menu.class, me);
			menu.getRole().remove(role);
			hibernateTemplate.update(menu);
		}
		for (Integer me : menuIds) {
			Menu menu = (Menu) hibernateTemplate.get(Menu.class, me);
			menu.getRole().add(role);
			hibernateTemplate.update(menu);
		}

	}

	//没有选中的添加setChecked 为false
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Integer> menuIds(Integer roleId) {
		String hql = "select m.id from Menu m where m.role.id=?";
		List menuIds = hibernateTemplate.find(hql, roleId);

		return menuIds;
	}

	@SuppressWarnings("unchecked")
	public List<TreeNode> findByUserNametree(String name) {
		final String sql = "select m.id,m.name,m.url,m.parent_id,m.icon from t_menu m where m.id in (select  DISTINCT  mr.menu_id from t_menu_t_role mr where mr.role_id in (select  ru.role_id from t_role_t_user ru where ru.user_id in (SELECT u.id FROM"
				+ " t_user u where u.name='" + name + "')))";

		List<Object[]> menulist = (List<Object[]>) hibernateTemplate.executeFind(new HibernateCallback() {

			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				SQLQuery createSQLQuery = session.createSQLQuery(sql);
				List<Object[]> list2 = createSQLQuery.list();

				return list2;
			}
		});

		//有问题明天重新看看！！！！！！
		ArrayList<Menu> menuList = new ArrayList<Menu>();
		for (int i = 0; i < menulist.size(); i++) {
			Object[] menuArr1 = menulist.get(i);
			Menu menu = new Menu();
			menu.setId((Integer) menuArr1[0]);
			menu.setName((String) menuArr1[1]);
			menu.setUrl((String) menuArr1[2]);
			Object pid = menuArr1[3];
			if (pid != null) {
				Menu ppp = (Menu) hibernateTemplate.get(Menu.class, (Integer) pid);
				menu.setParent(ppp);
			} else {

				menu.setParent((Menu) menuArr1[3]);
			}
			menu.setIcon((String) menuArr1[4]);
			menuList.add(menu);
		}

		ArrayList<TreeNode> treeList = new ArrayList<TreeNode>();
		for (Menu menutem : menuList) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(menutem.getId());
			treeNode.setName(menutem.getName());
			treeNode.setUrl(menutem.getUrl());

			if (menutem.getParent() != null) {
				treeNode.setpId(menutem.getParent().getId());
			}
			treeNode.setIcon(menutem.getIcon());
			treeList.add(treeNode);
		}
		for (TreeNode treeNode : treeList) {
			System.out.println(treeNode.getId());
			System.out.println(treeNode.getName());
			System.out.println(treeNode.getUrl());
			System.out.println(treeNode.getpId());
			System.out.println(treeNode.getIcon());
		}

		return treeList;
	}

	@SuppressWarnings("unchecked")
	public List<Integer> findByRoleMenuId(Integer roleId) {
		List<Integer> menuIds = new ArrayList<Integer>();
		menuIds = (ArrayList<Integer>) hibernateTemplate.find("select r.menu.id from Role r where r.id=?", new Object[] { roleId });
		return menuIds;
	}

	@SuppressWarnings("unused")
	public static void main(String[] args) throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext.xml" });
		//		MenuService menu=(MenuService) ac.getBean("menuServiceImpl");
	}
	/**
	 * 通过id查找菜单
	 */
	@SuppressWarnings("unchecked")
	public Object findByUserIdtree(Integer uid) {
		final String sql = "select m.id,m.name,m.url,m.parent_id,m.icon from t_menu m where m.id in (select  DISTINCT  mr.menu_id from t_menu_t_role mr where mr.role_id in (select  ru.role_id from t_role_t_user ru where ru.user_id in (SELECT u.id FROM"
				+ " t_user u where u.id='" + uid + "')))";

		List<Object[]> menulist = (List<Object[]>) hibernateTemplate.executeFind(new HibernateCallback() {

			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				SQLQuery createSQLQuery = session.createSQLQuery(sql);
				List<Object[]> list2 = createSQLQuery.list();

				return list2;
			}
		});

		ArrayList<Menu> menuList = new ArrayList<Menu>();
		for (int i = 0; i < menulist.size(); i++) {
			Object[] menuArr1 = menulist.get(i);
			Menu menu = new Menu();
			menu.setId((Integer) menuArr1[0]);
			menu.setName((String) menuArr1[1]);
			menu.setUrl((String) menuArr1[2]);
			Object pid = menuArr1[3];
			if (pid != null) {
				Menu ppp = (Menu) hibernateTemplate.get(Menu.class, (Integer) pid);
				menu.setParent(ppp);
			} else {

				menu.setParent((Menu) menuArr1[3]);
			}
			menu.setIcon((String) menuArr1[4]);
			menuList.add(menu);
		}

		ArrayList<TreeNode> treeList = new ArrayList<TreeNode>();
		for (Menu menutem : menuList) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(menutem.getId());
			treeNode.setName(menutem.getName());
			treeNode.setUrl(menutem.getUrl());

			if (menutem.getParent() != null) {
				treeNode.setpId(menutem.getParent().getId());
			}
			treeNode.setIcon(menutem.getIcon());
			treeNode.setTarget(menutem.getTarget());
			treeList.add(treeNode);
		}

		return treeList;
	}

}
