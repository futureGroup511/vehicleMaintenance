package com.future.domain;

import java.util.HashSet;
import java.util.Set;

public class User {

	private Integer id; // id无实际意思
	private String name; // 真实姓名
	private String loginName;// 用户名
	private String password;// 密码
	private String phoneNum;// 联系方式

	Set<RepairHistory> repairHistorys = new HashSet<RepairHistory>();

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

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public Set<RepairHistory> getRepairHistorys() {
		return repairHistorys;
	}

	public void setRepairHistorys(Set<RepairHistory> repairHistorys) {
		this.repairHistorys = repairHistorys;
	}


}
