package com.future.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.CarDao;
import com.future.domain.Car;
import com.future.service.util.PageBean;

@Repository
public class CarDaoImpl extends BaseDao implements CarDao {

	
	
	
	@Override
	public Car findByfFileNum(String filenum) {
		if (filenum!=null&&filenum!="") {
			String hql="FROM Car c WHERE c.fileNum=? and c.status=1";
			Car car=(Car) getsession().createQuery(hql).setString(0, filenum).uniqueResult();
			return car;
		}else {
			return null;
		}
		
	}

	@Override
	public Car finByCarnum(String carnum) {
		if (carnum!=null&&carnum!="") {
			String hql="FROM Car c WHERE c.carNum=? and c.status=1";
			Car car=(Car) getsession().createQuery(hql).setString(0, carnum).uniqueResult();
			return car;
		}else {
			return null;
		}
		
	}

	@Override
	public Car findByCarnumAndByFileNum(String filenum, String carnum) {
		if (filenum!=null&&filenum!=""&&carnum!=null&&carnum!="") {
			String hql="FROM Car c WHERE c.carNum=? AND c.fileNum=? and c.status=1";
			Car car=(Car) getsession().createQuery(hql).setString(0, carnum).setString(1, filenum).uniqueResult();
			return car;
		}else {
			return null;
		}
		
	}
	@Override
	public Car queryByCarNum(String carNum) {
		String hql = "from Car car where car.carNum = :carNum and car.status = 1";
		Car car = (Car) getsession().createQuery(hql).setString("carNum", carNum).uniqueResult();
		return car;
	}

	@Override
	public Car saveCarInformation(Car car) {
		if(car.getId() == null){
			car.setStatus(1);
			getsession().save(car);
			return queryByCarNum(car.getCarNum());
		}else{
			car.setStatus(1);
			getsession().update(car);
			System.out.println(car);
			return car;
		}
	}

	@Override
	public void updateCarInformation(Car car) {
		
		getsession().update(car);
	}

	@Override
	public void deleteCarInformation(Car car) {
		getsession().delete(car);
	}

	@Override
	public Car QueryCarInformationByFileName(String carFileNum) {
		String hql = "from Car car where car.fileNum = :fileNum and car.status = 1";
		Car car = (Car) getsession().createQuery(hql).setString("fileNum",carFileNum).uniqueResult();
		return car;
	}

	@Override
	public List<Car> queryAllCar(PageBean pageBean) {
		String hql = "from Car car where car.status = 1";
		List<Car> carList = getsession().createQuery(hql)//
				.setFirstResult((pageBean.getCurrentPage()-1)*pageBean.getPageSize())//
							.setMaxResults(pageBean.getPageSize()).list();//
		return carList;
	}

	@Override
	public void updateCar(Car car) {
		getsession().update(car);
	}
	
	@Override
	public void deleteCar(Car car) {
		String hql = "update Car car set car.status = 0 where car.id = :id";
		getsession().createQuery(hql).setInteger("id", car.getId()).executeUpdate();
	}

	@Override
	public Integer queryCarSize() {
		String hql = "from Car car where car.status = 1";
		Integer carSize = getsession().createQuery(hql).list().size();
		return carSize;
	}

	@Override
	public Car getTheCar(Integer carId) {
		String hql = "from Car car where car.id = :carId and car.status = 1";
		Car car = (Car) getsession().createQuery(hql).setInteger("carId", carId).uniqueResult();
		return car;
	}

	public PageBean getCarsBySomeCarNum(String someCarNum, String someCarFileNum,String carType,PageBean pageBean) {
		
		Criteria criteria = getsession().createCriteria(Car.class);
		
		if(someCarNum != null && !"".equals(someCarNum.trim())){
			criteria.add(Restrictions.like("carNum", someCarNum.trim(), MatchMode.ANYWHERE));
		}
		if(someCarFileNum != null && !"".equals(someCarFileNum.trim())){
			criteria.add(Restrictions.like("fileNum", someCarFileNum.trim(), MatchMode.ANYWHERE));
		}
		if(carType != null && !"".equals(carType.trim())){
			criteria.add(Restrictions.eq("carType", carType.trim()));
		}
		criteria.add(Restrictions.eq("status", 1));
		List<Car> carList = criteria.setFirstResult((pageBean.getCurrentPage()-1)*pageBean.getPageSize())
					.setMaxResults(pageBean.getPageSize()).list();
		
		int count = getCarCount(someCarNum, someCarFileNum, carType, pageBean);
		PageBean pageBean2 = new PageBean(pageBean.getCurrentPage(), pageBean.getPageSize(), count, carList);
		return pageBean2;
	}
	
	public Integer getCarCount(String someCarNum, String someCarFileNum,String carType,PageBean pageBean){
		
		Criteria criteria = getsession().createCriteria(Car.class);
		if(someCarNum != null && !"".equals(someCarNum.trim())){
			criteria.add(Restrictions.like("carNum", someCarNum, MatchMode.ANYWHERE));
		}
		if(someCarFileNum != null && !"".equals(someCarFileNum.trim())){
			criteria.add(Restrictions.like("fileNum", someCarFileNum.trim(), MatchMode.ANYWHERE));
		}
		if(carType != null && !"".equals(carType.trim())){
			criteria.add(Restrictions.eq("carType", carType));
		}
		criteria.add(Restrictions.eq("status", 1));
		int count = criteria.list().size();
		return count;
	}

	@Override
	public List<String> getAllCarNum() {
		String hql="select  c.carNum FROM  Car c WHERE c.status=1";
		List<String> carnumbers=getsession().createQuery(hql).list();
		return carnumbers;
	}

	@Override
	public List<String> getAllCarFileNum() {
		String hql="select  c.fileNum FROM  Car c WHERE c.status=1";
		List<String> fileNums=getsession().createQuery(hql).list();
		return fileNums;
	}
	
	
	/**
	 * 动态查询车辆
	 */
	@Override
	public Car getCarByQBC(Car car) {
		Criteria criteria=getsession().createCriteria(Car.class);
		Car resultCar=new Car();
		if (car.getCarNum()!=null&&!car.getCarNum().equals("")) {
				criteria.add(Restrictions.eq("carNum", car.getCarNum()));
		}
		if (car.getFileNum()!=null&&!car.getFileNum().equals("")) {
			criteria.add(Restrictions.eq("fileNum", car.getFileNum()));
		}
		if (car.getCarType()!=null&&!car.getCarType().equals("")) {
			criteria.add(Restrictions.eq("carType", car.getCarType()));
		}
		if (car.getCarType()!=null&&!car.getCarType().equals("")&&(car.getCarNum()==null||car.getCarNum().equals(""))
			&&(car.getFileNum()==null||car.getFileNum().equals(""))	
				) {
			resultCar.setCarType(car.getCarType());
			return resultCar;
		}else{
			resultCar=(Car) criteria.uniqueResult();
		}
		if (resultCar!=null) {
			return resultCar;
		}else{
			return null;
		}
		
	}
//得到所有的档案号，删除的也要
	@Override
	public List<String> getAllFileNum() {
		String hql = "select car.fileNum from Car car"; 
		List<String> list = getsession().createQuery(hql).list();
		return list;
	}

}
