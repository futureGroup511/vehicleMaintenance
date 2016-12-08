package com.future.domain;

import java.sql.Date;

public class RepairHistory {

	private Integer id; // id
	private Date repairDate; // 维修日期
	private Date nextrepairDate;// 下次维修日期
	private int status; // 当前记录状态 1为最新 0为历史

	private Car car;
	private User repairMan;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getRepairDate() {
		return repairDate;
	}

	public void setRepairDate(Date repairDate) {
		this.repairDate = repairDate;
	}

	public Date getNextrepairDate() {
		return nextrepairDate;
	}

	public void setNextrepairDate(Date nextrepairDate) {
		this.nextrepairDate = nextrepairDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	public User getRepairMan() {
		return repairMan;
	}

	public void setRepairMan(User repairMan) {
		this.repairMan = repairMan;
	}

	


	public RepairHistory(Integer id, Date repairDate, Date nextrepairDate, int status, Car car, User repairMan) {
		super();
		this.id = id;
		this.repairDate = repairDate;
		this.nextrepairDate = nextrepairDate;
		this.status = status;
		this.car = car;
		this.repairMan = repairMan;
	}
	public RepairHistory( Date repairDate, Date nextrepairDate, int status, Car car, User repairMan) {
		super();
		this.repairDate = repairDate;
		this.nextrepairDate = nextrepairDate;
		this.status = status;
		this.car = car;
		this.repairMan = repairMan;
	}

	public RepairHistory() {
		super();
	}

	@Override
	public String toString() {
		return "RepairHistory [id=" + id + ", repairDate=" + repairDate + ", nextrepairDate=" + nextrepairDate
				+ ", status=" + status + ", car=" + car + ", repairMan=" + repairMan + "]";
	}

	
	
}
