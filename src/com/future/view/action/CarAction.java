package com.future.view.action;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.swing.event.CaretListener;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import com.future.base.BaseAction;
import com.future.domain.Car;
import com.future.domain.RepairHistory;
import com.future.service.CarService;
import com.future.service.util.PageBean;
import com.future.service.util.Query;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;


@Controller
@Scope("prototype")
	
public class CarAction extends BaseAction implements RequestAware, SessionAware, Preparable, ModelDriven<Car>{
	
	private static final long serialVersionUID = 1L;
	
	private int currentPage;
	private int pageSize=6;
	private String query_carcarNum;
	private String query_cartype;
	private String carNum;
	private boolean queryResult = false;//ajax请求返回值 默认为 没有这辆车
	private String carFileNum;
	private String purchaseDate;
	private Car model;
	
	//删除修改使用carIdcarInformation_deleteCarInformation
	private Integer carId;
	
	
	//车牌号模糊查询使用的数据
	private String someCarNum;
	private String carType;
	
	private String someCarFileNum;
	
	private Map<String, Object> session;
	
	private String showNextFileNum;
	
	public String put(){
		//查询档案号得到最大得
		showNextFileNum = getNextFileNum();
		return "input";
	}
	
	//得到最大档案号，并得出下一个档案号
	public String getNextFileNum(){
		List<String> carFileNums = carInfoInputService.getAllFileNum();
		if(carFileNums.size() == 0){
			return "00001";
		}else{
			int bigOne = Integer.parseInt(carFileNums.get(0));
			for(int i=0;i<carFileNums.size();i++){
					int nowOne = Integer.parseInt(carFileNums.get(i));
					if(nowOne > bigOne){
						bigOne = nowOne;
					}
			}
			return makeItFive((bigOne+1)+"");
		}
	}
	/**
	 * 根据车牌号或者档案号判断是否存在此车
	 */
	public String jugeByCarNumberAndcarFileNum(){
		Car car=null;
		if(carNum!=null&&!carNum.equals("")){
			car=carInfoInputService.finByCarnum(carNum);
			if (car!=null) {
				ActionContext.getContext().getValueStack().push(car.getFileNum());
			}else{
				ActionContext.getContext().getValueStack().push(null);
			}
		}else if(carFileNum!=null&&!carFileNum.equals("")){
			car=carInfoInputService.findByfFileNum(carFileNum);
			if (car!=null) {
				ActionContext.getContext().getValueStack().push(car.getCarNum());
			}else{
				ActionContext.getContext().getValueStack().push(null);
			}
		}
		return "jugeCarNumAndFile";
	}
	/**
	 * 得到所有车的车牌号
	 */
	public String allCarNum(){
		List<String> carnumbers=carInfoInputService.getAllCarNum();
		if (carnumbers.size()==0) {
			ActionContext.getContext().getValueStack().push(null);
		}else{
			ActionContext.getContext().getValueStack().push(carnumbers);
		}
		return "carnum";
	}
	
	/**
	 * 得到所有档案号
	 */
	public String allCarFileNum(){
		List<String> carfilenumbers=carInfoInputService.getAllCarFileNum();
		if (carfilenumbers.size()==0) {
			ActionContext.getContext().getValueStack().push(null);
		}else{
			ActionContext.getContext().getValueStack().push(carfilenumbers);
		}
		return "carfilenum";
	}
	
	/**
	 * 到期车辆查询
	 * @return
	 */
	public String expire(){
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
		PageBean pageBean=new PageBean();
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSize(pageSize);
		Date   date1=new Date();
		Calendar calendar=Calendar.getInstance();
		calendar.setTime(date1);
		calendar.add(Calendar.DATE, 20);
		Date expiredate1=calendar.getTime();
		java.sql.Date date=new java.sql.Date(date1.getTime());
		java.sql.Date expiredate=new java.sql.Date(expiredate1.getTime());
		Query query=new Query();
		RepairHistory repairHistory ;
		if (query_carcarNum==null||query_carcarNum.equals("")
				&&(query_cartype==null||query_cartype.equals(""))
				) {
			repairHistory=new RepairHistory();
			
		}
		else{
			query.setQuery_cartype(query_cartype);
			query.setQuery_carcarNum(query_carcarNum);
			repairHistory=query.getRepairHistory(carInfoInputService, userService);
		}
		if (repairHistory!=null) {
			repairHistory.setRepairDate(date);
			repairHistory.setNextrepairDate(expiredate);
			repairHistory.setStatus(1);
			pageBean=repairHistoryInfoInputService.queryByQBC(repairHistory, pageBean);
		}else{
			pageBean.setRecordList(null);
		}
		request.put("pageBean", pageBean);
		request.put("query", query);
		return "expire";
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	
	
	public String getQuery_carcarNum() {
		return query_carcarNum;
	}

	public void setQuery_carcarNum(String query_carcarNum) {
		this.query_carcarNum = query_carcarNum;
	}



	private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> arg0) {
		request=arg0;
	}
	
	
	
	
	@ResponseBody
	public String queryByCarNum(){
		Car car = carInfoInputService.queryByCarNum(carNum);
		System.out.println(car);
		if(car != null){
			queryResult = true;
		}
		ActionContext.getContext().getValueStack().push(queryResult);
		return "queryByCarNum";
	}
	
	 public String carFileNumByCarNum(){
		Car car = new Car();
		car.setCarNum(carNum);
		Car carTemp = carInfoInputService.saveCarInformation(car);
		carFileNum = getNextFileNum();
		//carFileNum = makeItFive(carFileNum);
		carTemp.setFileNum(carFileNum);
		carInfoInputService.updateCarInformation(carTemp);
		ActionContext.getContext().getValueStack().push(carFileNum);
		return "toughtProcessGetCarFileNum";
	}
	 
	//删除车辆信息根据 档案号
	public String deleteCarInformation(){
		Car car = carInfoInputService.QueryCarInformationByFileName(carFileNum);
		carInfoInputService.deleteCarInformation(car);
		return "deleteCarInformationSuccess";
	}
	
	
	public void prepareSaveCarInformation(){ 
		
		/*model = carInfoInputService.QueryCarInformationByFileName(carFileNum);
		model.getFileNum();*/
		model = new Car();
	}
	//提交表单的内容的接受
	public String saveCarInformation() throws ParseException{
		//判读日期的非空
		if( purchaseDate == null||"".equals(purchaseDate.trim())){
			model.setPurchaseDate(null);
		}else{
			java.sql.Date dateSrc = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(purchaseDate).getTime());
			model.setPurchaseDate(dateSrc);
		}
		model.setCarNum(makeCarNumBigger(model.getCarNum()));
		model.setFileNum(this.getNextFileNum());
		carInfoInputService.saveCarInformation(model);
		return "addCarInformationSuccess";
	}
	
	//查看所有车辆信息
	public String seeAllCarInformation(){
		
		System.out.println(currentPage+"  ");
		Integer pageSize = 6 ;
		Integer recordCount = carInfoInputService.queryCarSize();
		System.out.println("总车辆是"+recordCount+"%%%%%%%%%%%%%%%");
		/*if(currentPage>((recordCount + pageSize - 1) / pageSize)){
			currentPage = ((recordCount + pageSize - 1) / pageSize);
		}else{
			currentPage = 1;
		}*/
		PageBean pageBean = new PageBean(currentPage, pageSize, recordCount, null);
		List<Car> carList = carInfoInputService.queryAllCar(pageBean);
		pageBean.setRecordList(carList);
		System.out.println(pageBean.getRecordList());
		request.put("pageBean", pageBean);
		session.put("currentPage", currentPage);
		return "AllCarInformation";
	}
	
	//查看车辆的详细信息
	public String queryCarAllInformation(){
		Car car = carInfoInputService.getTheCar(carId);
		ActionContext.getContext().getValueStack().push(car);
		return "SeeTheCarAllInformation";
	}
	
	//删除车辆信息
	public String deleteTheCar(){
		Car car = new Car();
		car.setId(carId);
		//carInfoInputService.deleteCar(car);
		System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAA"+currentPage);
		System.out.println("BBBBBBBBBBBBBBBBBBBBBBB"+car.getId());
		carInfoInputService.deleteCar(car);
		return "deleteCarToAllCarInformation";
	}
	//模糊查询的删除
	public String deleteTheCarFuzzy(){
		Car car = new Car();
		car.setId(carId);
		//carInfoInputService.deleteCar(car);
		System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAA"+currentPage);
		System.out.println("BBBBBBBBBBBBBBBBBBBBBBB"+car.getId());
		carInfoInputService.deleteCar(car);
		return "deleteCarToFuzzyAllPage";
	}
	//到达模糊车辆信息修改界面
	public String updateCarInformationInputFuzzy(){
		System.out.println(carId+"HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH");
		Car car = carInfoInputService.getTheCar(carId);
		ActionContext.getContext().getValueStack().push(car);
		return "toFuzzyUpdateInputPage";
	}
	//模糊信息修改成功updateCarSuccessFuzzy
	public String updateCarSuccessFuzzy(){
		
		currentPage = (Integer) session.get("currentPage");
		System.out.println("当前页是===============》"+currentPage);
		System.out.println(model);
		System.out.println("BBBBBBBBBBBBBBBBBBBBBBBBBB"+model.getId()+model.getAddress()+"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
		model.setStatus(1);
		/**以下一句 刘阳添加*/
		//改变输入车牌小写问题
		model.setCarNum(makeCarNumBigger(model.getCarNum()));
		
		carInfoInputService.saveCarInformation(model);
		return "updateSuccessToFuzzyPage";
	}
	public void prepareUpdateCarSuccessFuzzy(){
		model = new Car();
	}
	//到达车辆信息修改界面
	public String updateCarInformationInput(){
		System.out.println(carId+"HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH");
		Car car = carInfoInputService.getTheCar(carId);
		ActionContext.getContext().getValueStack().push(car);
		return "toUpdateCarInformationInput";
	}
	//车辆信息更新
	public String updateCarSuccess(){
		
		currentPage = (Integer) session.get("currentPage");
		System.out.println("当前页是===============》"+currentPage);
		System.out.println("BBBBBBBBBBBBBBBBBBBBBBBBBB"+model.getId()+model.getAddress()+"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
		model.setStatus(1);
		/**以下一句 刘阳添加*/
		//改变输入车牌小写问题
		model.setCarNum(makeCarNumBigger(model.getCarNum()));
		
		carInfoInputService.saveCarInformation(model);
		return "deleteCarToAllCarInformation";
	}
	public void prepareUpdateCarSuccess(){
		
		model = new Car();
	}
	
	//根据车牌号模糊查询车辆 **到达的jsp界面和查看所有的车辆的jsp界面一样
	public String getCarBySomeCarNum(){
		if(currentPage == 0){
			currentPage = 1;
		}
			Integer pageSize = 6 ;
			System.out.println("******************"+someCarNum+" uuuuu "+carType);
			PageBean pageBean2 = new PageBean();
			pageBean2.setCurrentPage(currentPage);
			pageBean2.setPageSize(pageSize);
			PageBean pageBean = carInfoInputService.getCarsBySomeCarNum(someCarNum, someCarFileNum,carType, pageBean2);
			request.put("pageBean", pageBean);
			for(int i=0;i<pageBean.getRecordList().size();i++){
				System.out.println(pageBean.getRecordList().get(i).toString()); 
			}
			request.put("someCarNum", someCarNum);
			request.put("carType", carType);
			request.put("someCarFileNum", someCarFileNum);
			ActionContext.getContext().getValueStack().push(someCarNum);
			session.put("currentPage", currentPage);
		return "fuzzyQueryToPage";
	}
	//========================================
	

	public String getCarNum() {
		return carNum;
	}

	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}

	public boolean isQueryResult() {
		return queryResult;
	}

	public void setQueryResult(boolean queryResult) {
		this.queryResult = queryResult;
	}

	public void setCarFileNum(String carFileNum) {
		this.carFileNum = carFileNum;
	}
	
	
	public String getCarFileNum() {
		return carFileNum;
	}
	
	public String getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(String purchaseDate) {
			this.purchaseDate = purchaseDate;
	}
	
	public Integer getCarId() {
		return carId;
	}

	public void setCarId(Integer carId) {
		this.carId = carId;
	}
	

	public String getSomeCarNum() {
		return someCarNum;
	}

	public void setSomeCarNum(String someCarNum) {
		this.someCarNum = someCarNum;
	}

	//===============================================
//工具方法
//==============================================
	private String makeItFive(String src){
		char[] ch = {'0','0','0','0'};//最多加四个零
		if(src != null && src.length()>0){
			int length = src.length();
			int needZero = 5 - length;
			String strEnd = "";
			for(int i=0;i<needZero;i++){
				strEnd += ch[i];
			}
			return strEnd+src;
		}else{
			return null;
		}
	}
	
	public String makeCarNumBigger(String carNumStr){
		//a-z  097－122
		String carNumCode = carNumStr.substring(2);
		char[] carNumCodes = carNumCode.toCharArray();
		char[] carNumBigCopy = new char[carNumCodes.length];
		for(int i=0;i<carNumCodes.length;i++){
			int temp = carNumCodes[i];
			if(temp>=97 && temp <=122){
				temp = temp - 32;
			}
			carNumBigCopy[i] = (char)temp;
		}
		return "豫G"+new String(carNumBigCopy);
	}
	//===============================================
	//工具方法
	//==============================================
	@Override
	public void prepare() throws Exception {}

	@Override
	public Car getModel() {
		return model;
	}
	
	public String getQuery_cartype() {
		return query_cartype;
	}

	public void setQuery_cartype(String query_cartype) {
		this.query_cartype = query_cartype;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

	public String getShowNextFileNum() {
		return showNextFileNum;
	}

	public void setShowNextFileNum(String showNextFileNum) {
		this.showNextFileNum = showNextFileNum;
	}

	public String getSomeCarFileNum() {
		return someCarFileNum;
	}

	public void setSomeCarFileNum(String someCarFileNum) {
		this.someCarFileNum = someCarFileNum;
	}

	
	
}
