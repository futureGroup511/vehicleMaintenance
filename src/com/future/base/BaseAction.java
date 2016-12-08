package com.future.base;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.future.service.CarService;
import com.future.service.RepairHistoryService;
import com.future.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class BaseAction extends ActionSupport{
	
	//=========所有service实例声明==============
	@Resource
	protected UserService userService;
	@Resource
	protected CarService carInfoInputService;
	@Resource
	protected RepairHistoryService repairHistoryInfoInputService;
}
