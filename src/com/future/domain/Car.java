package com.future.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Car {


	private Integer id; // id号，无实际意思
	private String fileNum; // 档案号
	private String carType; // 车辆类别 货运or客运
	private String carOwner; // 车属单位/车主
	private String address; // 地址
	private String carNum; // 车牌照号
	private String businessNum; // 营运证号
	private String factoryNum; // 厂牌型号
	private String engineNum; // 发动机型号
	private String chassisNum; // 底盘号
	private String color; // 颜色
	private String phoneNum; // 联系方式
	private Date purchaseDate; // 出厂日期
	private float capacity; // 吨/座位
	private int status; // 删除为0，不删除为1;
	Set<RepairHistory> repairHistorys = new HashSet<RepairHistory>();

	
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFileNum() {
		return fileNum;
	}

	public void setFileNum(String fileNum) {
		this.fileNum = fileNum;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

	public String getCarOwner() {
		return carOwner;
	}

	public void setCarOwner(String carOwner) {
		this.carOwner = carOwner;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCarNum() {
		return carNum;
	}

	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}

	public String getBusinessNum() {
		return businessNum;
	}

	public void setBusinessNum(String businessNum) {
		this.businessNum = businessNum;
	}

	public String getFactoryNum() {
		return factoryNum;
	}

	public void setFactoryNum(String factoryNum) {
		this.factoryNum = factoryNum;
	}

	public String getEngineNum() {
		return engineNum;
	}

	public void setEngineNum(String engineNum) {
		this.engineNum = engineNum;
	}

	public String getChassisNum() {
		return chassisNum;
	}

	public void setChassisNum(String chassisNum) {
		this.chassisNum = chassisNum;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public Date getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public float getCapacity() {
		return capacity;
	}

	public void setCapacity(float capacity) {
		this.capacity = capacity;
	}

	public Set<RepairHistory> getRepairHistorys() {
		return repairHistorys;
	}

	public void setRepairHistorys(Set<RepairHistory> repairHistorys) {
		this.repairHistorys = repairHistorys;
	}


	
}

