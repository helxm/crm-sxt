package com.bjsxt.crm.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.po.User;
import com.bjsxt.crm.service.UserService;

@Component
@Scope("prototype")
public class UserAction {

	private UserService userService;

	public UserService getUserService() {
		return userService;
	}

	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	private String admin;
	private Integer login;
	private String repwd;
	private List<User> list;
	private Integer id;
	private User user;
	
	/**
	 * 查询所有的用户
	 * @return
	 */
	public String findAll() {
		this.list = userService.findAllUser();
		return "list";
	}

	@SuppressWarnings("unused")
	public String checkUser() {
		if (repwd.equals(user.getPwd())) {

			List<User> checke = userService.checke(user.getName(), user.getPwd());
			System.out.println(checke.size() + "@###########@#@#@#");
			if (checke != null) {
				HttpSession session = ServletActionContext.getRequest().getSession();
				session.setAttribute("name", user.getName());
				return "login";
			} else {
				this.login = 1;
				System.out.println(login);
				return "index";
			}
		} else {

			this.login = 1;
			System.out.println(login);
			return "index";
		}

	}

	public String updateToUser() {
		if (repwd.equals(user.getPwd()) == false) {
			return findAll();
		}
		System.out.println(user.getPwd() + "@@@@@@@@@@@@@@@user.getPwd()");
		userService.updateToUser(user.getPwd(), id);
		return findAll();
	}

	public String findById() {
		this.user = userService.findById(id);
		return "updateFindId";

	}

	public String add() {
		if (repwd.equals(user.getPwd())) {
			userService.add(user);
			return findAll();
		} else {
			return "adderro";
		}
	}

	public String homePage() {
		if ("admin".equals(admin)) {
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("name", admin);
			return "right";
		}
		return null;
	}

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRepwd() {
		return repwd;
	}

	public void setRepwd(String repwd) {
		this.repwd = repwd;
	}

	public Integer getLogin() {
		return login;
	}

	public void setLogin(Integer login) {
		this.login = login;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}
}
