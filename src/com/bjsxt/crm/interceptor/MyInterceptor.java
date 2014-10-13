package com.bjsxt.crm.interceptor;

import java.util.Map;

import com.bjsxt.crm.po.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

@SuppressWarnings("serial")
public class MyInterceptor implements Interceptor{

	public void destroy() {
		
	}

	public void init() {
		System.out.println("拦截器启动");
		
	}

	@SuppressWarnings("unchecked")
	public String intercept(ActionInvocation invocation) throws Exception {
		
		@SuppressWarnings("unused")
		ActionContext ac = invocation.getInvocationContext();
		
		String method= invocation.getProxy().getMethod();//checkLogin
		
		User user = (User) ActionContext.getContext().getSession().get("user");
		String userName = null;
		if (user==null) {
			userName = null;
		}else {
			userName = user.getName();
		}
		
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		
		if (userName!=null) {
			//已登录[类似于servlet中的Filter]
			return invocation.invoke();
		}else {
			if ("checkLogin".equals(method)) {
				return invocation.invoke();
			}else {
				request.put("msg", "请先登录！！");
				return "login";
			}
		}
	}
}
