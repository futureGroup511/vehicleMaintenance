package com.future.service;

import java.util.List;

import com.future.domain.Car;
import com.future.service.util.PageBean;

public interface CarService {
	public Car findByfFileNum(String filenum);
	
	public Car finByCarnum(String carnum);
	
	public Car findByCarnumAndByFileNum(String filenum,String carnum);
	public Car queryByCarNum(String carNum);
	//保存车辆信息
	public Car saveCarInformation(Car car);
	//更新
	public void updateCarInformation(Car car);
	//删除车辆信息
	public void deleteCarInformation(Car car);
	//通过档案号码查询得到车辆
	 public Car QueryCarInformationByFileName(String carFileNum);
	 
	 
	//查询所有车辆信息
	public List<Car> queryAllCar(PageBean pageBean);
		//修改车辆信息
	public void updateCar(Car car);
		//删除车辆信息
	public void deleteCar(Car car);
	//查询车辆的数量
	public Integer queryCarSize();
	//通过id得到车辆信息
	public Car getTheCar(Integer carId);
	//通过车牌号和车辆类型进行模糊查询
	public PageBean getCarsBySomeCarNum(String someCarNum, String someCarFileNum, String carType,PageBean pageBean);
	//查询所有档案号
	public List<String> getAllFileNum();
	 /**
		 * 得到所有车辆的车牌号
	}
		 */
		public List<String> getAllCarNum();
		
		/**
		 * @author 牛洧鹏
		 * 
		 */
		public List<String> getAllCarFileNum();
		/**
		 * 动态查询
		 * @param car
		 * @return
		 */
		public Car getCarByQBC(Car car);
}
