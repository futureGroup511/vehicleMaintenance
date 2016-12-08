package com.future.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.CarDao;
import com.future.domain.Car;
import com.future.service.CarService;
import com.future.service.util.PageBean;

@Service
@Transactional
public class CarServiceImpl implements CarService{
	
	@Autowired
	private CarDao cd;
	
	@Override
	public Car findByfFileNum(String filenum) {
		return cd.findByfFileNum(filenum);
	}

	@Override
	public Car finByCarnum(String carnum) {
		return cd.finByCarnum(carnum);
	}

	@Override
	public Car findByCarnumAndByFileNum(String filenum, String carnum) {
		return cd.findByCarnumAndByFileNum(filenum, carnum);
	}

	

	
	@Autowired
	private CarDao carDao;
	
	@Override
	public Car queryByCarNum(String carNum) {
		return carDao.queryByCarNum(carNum);
	}

	@Override
	public Car saveCarInformation(Car car) {
		return carDao.saveCarInformation(car);
	}

	@Override
	public void updateCarInformation(Car car) {
		
		carDao.updateCarInformation(car);
	}

	@Override
	public void deleteCarInformation(Car car) {
		carDao.deleteCarInformation(car);
	}

	@Override
	public Car QueryCarInformationByFileName(String carFileNum) {
		return carDao.QueryCarInformationByFileName(carFileNum);
	}

	@Override
	public List<Car> queryAllCar(PageBean pageBean) {
		return carDao.queryAllCar(pageBean);
	}

	@Override
	public void updateCar(Car car) {
		carDao.updateCar(car);
	}

	@Override
	public void deleteCar(Car car) {
		carDao.deleteCar(car);
	}

	@Override
	public Integer queryCarSize() {
		return carDao.queryCarSize();
	}

	@Override
	public Car getTheCar(Integer carId) {
		return carDao.getTheCar(carId);
	}

	@Override
	public PageBean getCarsBySomeCarNum(String someCarNum, String someCarFileNum,String carType,PageBean pageBean) {
		return carDao.getCarsBySomeCarNum(someCarNum,someCarFileNum, carType,pageBean);
	}

	@Override
	public List<String> getAllCarNum() {
		return carDao.getAllCarNum();
	}

	@Override
	public List<String> getAllCarFileNum() {
		return carDao.getAllCarFileNum();
	}

	@Override
	public Car getCarByQBC(Car car) {
		
		return carDao.getCarByQBC(car);
	}

	@Override
	public List<String> getAllFileNum() {
		return carDao.getAllFileNum();
	}

}
