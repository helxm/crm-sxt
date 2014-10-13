package com.bjsxt.crm.action;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bjsxt.crm.po.User;
import com.bjsxt.crm.service.UserService;
import com.opensymphony.xwork2.ActionContext;
@Component
@Scope("prototype")
public class LoginAction {
	private UserService userService;
	
	
	public UserService getUserService() {
		return userService;
	}
	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	private Integer id;
	private String name;
	private String pwd;
	private String msg;
	
	private User user;
	//验证码验证
	//Struts2中Map类型的session
	private Map<String, Object> session;
	//接收客户端传来的验证码
	private String securityCode;
	
	
	/**
	 * 登录验证
	 * @return
	 * @throws Exception
	 */
	public String checkLogin() throws Exception{
		this.session = ActionContext.getContext().getSession();
		if(this.session.get("user")!=null){
			return "welcome";
		}else {
			User user = userService.check(name,pwd);
			if (user!=null) {
				//将user放入session作用域中
				this.session.put("user", user);
				//从session中获取验证码
				String serverCode = (String) this.session.get("SESSION_SECURITY_CODE");
				//判断session中取出的是否和用户输入的一致
				if (!serverCode.equals(securityCode)) {
					this.msg = "验证码输入错误";
					return "login";
				}else {
					return "welcome";
				}
			}else{
				this.msg = "用户名或密码错误！";
				return "login";
			}
		}
	}
	
	/**
	 * 注销登录
	 * @return
	 * @throws Exception
	 */
	public String logOut() throws Exception{
		ActionContext.getContext().getSession().clear();
		return "login";
	}
	
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	

	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getSecurityCode() {
		return securityCode;
	}

	public void setSecurityCode(String securityCode) {
		this.securityCode = securityCode;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
