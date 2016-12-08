package com.future.service.util;


import java.sql.Date;
import com.future.domain.Car;
import com.future.domain.RepairHistory;
import com.future.domain.User;
import com.future.service.CarService;
import com.future.service.UserService;


public class Query{
	private int query_manname;  //维修人员
	private String query_carfileNum;// 档案号
	private String query_carcarNum;// 车牌照号
	private String query_cartype;  //车辆类型
	private Date  query_firstdatatime; //第一个时间
	private Date  query_seconddatatime;//第二个时间
	private CarService cs;
	private UserService us;
	private final String COMPAER="first"; 
	public RepairHistory getRepairHistory(CarService cs,UserService us){
		this.cs=cs;
		this.us=us;
		Car car=new Car();
		User user;
		RepairHistory repairHistory=new RepairHistory();
		/*
		 * 三种情况 填了一种  填了两种   两种都没有填
		 */
		
		/*if (query_carfileNum!=null&&query_carcarNum!=null&&!query_carfileNum.equals("")&&!query_carcarNum.equals("")) {
			car=cs.findByCarnumAndByFileNum(this.query_carfileNum, this.query_carcarNum);
			if (car==null) {
				return null;
			}
		}
		else if (query_carfileNum!=null&&!query_carfileNum.equals("")) {
			car=cs.findByfFileNum(query_carfileNum);
			//System.out.println("query中的car"+car);
			if (car==null) {
				return null;
			}
		}
		else if (query_carcarNum!=null&&!query_carcarNum.equals("")) {
			car=cs.finByCarnum(query_carcarNum);
			if (car==null) {
				return null;
			}
		}
		else {
			car=null;
		}*/
		
		//都等于空的对立面是其中一个不等于空
		if ((query_carfileNum==null||query_carfileNum.equals(""))&&(query_carcarNum==null||query_carcarNum.equals(""))
			&&(query_cartype==null||query_cartype.equals(""))	
				) {
			car=null;
		}else{
			//全部放进去到数据库之前判断
			car.setCarNum(query_carcarNum);
			car.setFileNum(query_carfileNum);
			car.setCarType(query_cartype);
			car=cs.getCarByQBC(car);
			if (car==null) {
				return null;
			}
		}
		
		if (query_manname!=0) {
			user=us.findById(this.query_manname);
			if (user==null) {
				return null;
			}
		}else{
		    user=null;
		}
		/*
		 * 每个都填的情况
		 */
		if (query_manname!=0&&query_carfileNum!=null&&query_carcarNum!=null&&query_firstdatatime!=null&&query_seconddatatime!=null
				&&!query_carfileNum.equals("")&&!query_carcarNum.equals("")&&!query_firstdatatime.equals("")&&!query_seconddatatime.equals("")
				) {
			if (car!=null&&user!=null) {
				repairHistory.setCar(car);
				repairHistory.setRepairMan(user);
				if (query_firstdatatime.after(query_seconddatatime)) {
					Date date;
					date=query_firstdatatime;
					query_firstdatatime=query_seconddatatime;
					query_seconddatatime=date;
				}
				repairHistory.setRepairDate(query_firstdatatime);
				repairHistory.setNextrepairDate(query_seconddatatime);
				return repairHistory;
			}else {
				return null;
			}
		}else{
			
			if (car!=null) {
				//System.out.println("执行到这");
				repairHistory.setCar(car);
			}
			if (user!=null) {
				repairHistory.setRepairMan(user);
			}
			if (query_firstdatatime!=null&&query_seconddatatime!=null) {
				if (query_firstdatatime.after(query_seconddatatime)) {
					Date date;
					date=query_firstdatatime;
					query_firstdatatime=query_seconddatatime;
					query_seconddatatime=date;
				}
				repairHistory.setRepairDate(query_firstdatatime);
				repairHistory.setNextrepairDate(query_seconddatatime);
			}
			return repairHistory;
		}
	}

	public int getQuery_manname() {
		return query_manname;
	}

	public void setQuery_manname(int query_manname) {
		this.query_manname = query_manname;
	}



	public String getQuery_carfileNum() {
		return query_carfileNum;
	}

	public void setQuery_carfileNum(String query_carfileNum) {
		this.query_carfileNum = query_carfileNum;
	}

	public String getQuery_carcarNum() {
		return query_carcarNum;
	}

	public void setQuery_carcarNum(String query_carcarNum) {
		this.query_carcarNum = query_carcarNum;
	}

	public Date getQuery_firstdatatime() {
		return query_firstdatatime;
	}

	public void setQuery_firstdatatime(Date query_firstdatatime) {
		this.query_firstdatatime = query_firstdatatime;
	}

	public Date getQuery_seconddatatime() {
		return query_seconddatatime;
	}

	public void setQuery_seconddatatime(Date query_seconddatatime) {
		this.query_seconddatatime = query_seconddatatime;
	}
	

	public String getQuery_cartype() {
		return query_cartype;
	}

	public void setQuery_cartype(String query_cartype) {
		this.query_cartype = query_cartype;
	}

	@Override
	public String toString() {
		return "Query [query_manname=" + query_manname + ", query_carfileNum=" + query_carfileNum + ", query_carcarNum="
				+ query_carcarNum + ", query_firstdatatime=" + query_firstdatatime + ", query_seconddatatime="
				+ query_seconddatatime + "]";
	}
	
	
	
}
