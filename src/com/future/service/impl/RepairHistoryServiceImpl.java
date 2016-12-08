package com.future.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.future.service.RepairHistoryService;
import com.future.service.util.PageBean;
import com.future.dao.RepairHistoryDao;
import com.future.domain.Car;
import com.future.domain.RepairHistory;
import com.future.service.RepairHistoryService;


@Service
@Transactional
public class RepairHistoryServiceImpl  implements RepairHistoryService{
	@Autowired
	private RepairHistoryDao rd;
	@Override
	public List<RepairHistory> queryAllRepairHistory() {
		return rd.queryAllRepairHistory();
	}
	@Override
	public PageBean queryByPage(PageBean pageBean) {
		return rd.queryByPage(pageBean);
	}
	@Override
	public PageBean queryByQBC(RepairHistory repairHistory, PageBean pageBean) {
		return rd.queryByQBC(repairHistory, pageBean);
	}
	@Override
	public List findQuantum() {
		return rd.findQuantum();
	}
	@Override
	public void updateOtherHistoryStatus(Car car) {
		
		rd.updateOtherHistoryStatus(car);
	}
	@Override
	public void saveRepairHistoryInformation(RepairHistory rHistory) {
		rd.saveRepairHistoryInformation(rHistory);
	}
	@Override
	public void deleteDataById(int id) {
		rd.deleteDataById(id);
	}


}
