package com.future.view.action;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.base.BaseAction;
import com.future.domain.Car;
import com.future.domain.RepairHistory;
import com.future.domain.User;
import com.future.service.util.PageBean;
import com.future.service.util.Query;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class RepairHistoryAction extends BaseAction implements RequestAware,ModelDriven<Query>{
	/**
	 * 
	 */
	
	private String carNum;
	private String repairDate;
	//private String nextRepairDate;
	private String peopleName;
	private int id;
	
	private static final long serialVersionUID = 1L;
	private int currentPage;
	private String firstdatatime;
	private String seconddatatime;
	private int pageSize=6;
	//删除数据
	public String deleteData(){
		System.out.println(id);
		if (this.id!=0) {
			repairHistoryInfoInputService.deleteDataById(id);
		}
		currentPage=1;
		PageBean pageBean=new PageBean();
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSize(pageSize);
		
		List<User> users=userService.getUserAll();
		pageBean=repairHistoryInfoInputService.queryByPage(pageBean);
		System.out.println("这是每页多少条"+pageBean.getPageSize());
		request.put("pageBean", pageBean);
		request.put("conditionQuery", 2);
		request.put("users", users);
		return "deletesuccess";
	}
	
	public String query(){
		PageBean pageBean=new PageBean();
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSize(pageSize);
		
		List<User> users=userService.getUserAll();
		pageBean=repairHistoryInfoInputService.queryByPage(pageBean);
		System.out.println("这是每页多少条"+pageBean.getPageSize());
		request.put("pageBean", pageBean);
		request.put("conditionQuery", 2);
		request.put("users", users);
		return "query";
	}
	
	public String conditionQuery() throws ParseException{
		if (firstdatatime!=null&&seconddatatime!=null&&!firstdatatime.equals("")&&!seconddatatime.equals("")) {
			DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
			java.sql.Date modeldate;
			java.sql.Date first=new java.sql.Date(format.parse(firstdatatime).getTime());
			java.sql.Date second=new java.sql.Date(format.parse(seconddatatime).getTime());
			query.setQuery_firstdatatime(first);
			query.setQuery_seconddatatime(second);
		}
		RepairHistory repairHistory=query.getRepairHistory(carInfoInputService, userService);
		PageBean pageBean=new PageBean();
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSize(pageSize);
		if (repairHistory!=null) {
			pageBean=repairHistoryInfoInputService.queryByQBC(repairHistory, pageBean);
		}else{
			pageBean.setRecordList(null);
		}
		List<User> users=userService.getUserAll();
		request.put("users", users);
		request.put("query", query);
		request.put("pageBean", pageBean);
		request.put("conditionQuery", 1);
		return "query";
	}
	public String input(){
		
		return "repairHistoryInput";
	}
	
	public String realInput() throws ParseException{
		RepairHistory rHistory = new RepairHistory();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Car car = carInfoInputService.queryByCarNum(carNum);
		rHistory.setCar(car);
		//Date date1 = new Date();
		
		//Date date1 = format.parse(repairDate);
		//System.out.println(date1.toString());
		//System.out.println(date1.getTime());
		//Date date2 = new Date(date1.getTime()+(120*24*60*60*1000L));
		//System.out.println(date1.getTime()+(120*24*60*60*1000l));
		//System.out.println(format.format(date2));
		//String date3str = "2016-08-11";
		//Date date3 = format.parse(date3str);
		//System.out.println(date3.getTime());
		java.sql.Date date01 = new java.sql.Date(format.parse(repairDate).getTime());
		new java.sql.Date(date01.getTime()+(120*24*60*60*1000));
		java.sql.Date date02 = new java.sql.Date(date01.getTime()+(120*24*60*60*1000L));
		rHistory.setRepairDate(date01);
		rHistory.setNextrepairDate(date02);
		User user = userService.queryUserByUserName(peopleName);
		rHistory.setRepairMan(user);
		//更新该车辆维修的其他维修信息状态为 0
		repairHistoryInfoInputService.updateOtherHistoryStatus(car);
		rHistory.setStatus(1);
		repairHistoryInfoInputService.saveRepairHistoryInformation(rHistory);
		return "repairHistorySuccess";
	}
	
	
	//=====================================
	//=====================================
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> arg0) {
		request=arg0;
	}

	
	public String getFirstdatatime() {
		return firstdatatime;
	}

	public void setFirstdatatime(String firstdatatime) {
		this.firstdatatime = firstdatatime;
	}

	public String getSeconddatatime() {
		return seconddatatime;
	}

	public void setSeconddatatime(String seconddatatime) {
		this.seconddatatime = seconddatatime;
	}

	private Query query;
	@Override
	public Query getModel() {
		return query=new Query();
	}

	//=====================================
	//=====================================
	public String getCarNum() {
		return carNum;
	}

	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}

	public String getRepairDate() {
		return repairDate;
	}

	public void setRepairDate(String repairDate) {
		this.repairDate = repairDate;
	}

/*	public String getNextRepairDate() {
		return nextRepairDate;
	}

	public void setNextRepairDate(String nextRepairDate) {
		this.nextRepairDate = nextRepairDate;
	}*/

	public String getPeopleName() {
		return peopleName;
	}

	public void setPeopleName(String peopleName) {
		this.peopleName = peopleName;
	}
	
public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

public String testajax(){
	System.out.println("过来这里");
	ActionContext.getContext().getValueStack().push("成功了");
	return "ta";
}
	
	
}
