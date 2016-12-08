package com.future.service.util;


import com.future.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class CheckLoginInterceptor extends AbstractInterceptor {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String intercept(ActionInvocation invocation) throws Exception {
		 //System.out.println("---------> 之前");
		 //String result = invocation.invoke(); // 放行
		 System.out.println("---------> 之后");
		// return result;
		// 获取信息
		User user = (User) ActionContext.getContext().getSession().get("user"); // 当前登录用户
		String namespace = invocation.getProxy().getNamespace();
		String actionName = invocation.getProxy().getActionName();
		String privUrl = namespace + actionName; // 对应的权限URL
		//System.out.println(privUrl);
		// 如果未登录
		if (user == null || user.equals("")) {
			if (privUrl.startsWith("/user_login")) { // "/user_loginUI", "/user_login"
				// 如果是去登录，就放行
				return invocation.invoke();
			} else {
				// 如果不是去登录，就转到登录页面
				return "loginUI";
			}
		}
		// 如果已登 录，就判断权限
		return invocation.invoke();
	}
}
