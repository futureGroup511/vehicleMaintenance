package com.future.service;

import java.util.List;

import com.future.domain.Car;
import com.future.domain.RepairHistory;
import com.future.service.util.PageBean;

public interface RepairHistoryService {
	public List<RepairHistory> queryAllRepairHistory();
	
	public PageBean queryByPage(PageBean pageBean);
	
	//通过QBC的条件查询，查询符合条件
	public PageBean queryByQBC(RepairHistory repairHistory,PageBean pageBean);

	
	/**
	 * 查询所有时间段
	 * @return
	 */
	public List findQuantum();
	//更新指定车辆的其他 维修信息状态
	public void updateOtherHistoryStatus(Car car);
	//保存车辆维修信息
	public void saveRepairHistoryInformation(RepairHistory rHistory);
	//删除数据

	public void deleteDataById(int id);
}
