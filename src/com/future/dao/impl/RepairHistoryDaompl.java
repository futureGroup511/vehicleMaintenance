package com.future.dao.impl;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.ListIterator;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.RepairHistoryDao;
import com.future.domain.Car;
import com.future.domain.RepairHistory;
import com.future.service.util.PageBean;

@Repository
public class RepairHistoryDaompl  extends BaseDao implements RepairHistoryDao {

	@Override
	public List<RepairHistory> queryAllRepairHistory() {
		/*String hql="FROM RepairHistory";
		List<RepairHistory> repairHistories=getsession().createQuery(hql).list();*/
		List<RepairHistory> repairHistories=getsession().createCriteria(RepairHistory.class).createCriteria("car", "c").add(Restrictions.eq("c.status", 1)).list();
		return repairHistories;
	}

	@Override
	public PageBean queryByPage(PageBean pageBean) {
		/*String hql="select count(*) FROM RepairHistory as repairHistory";
		int count=((Number) getsession().createQuery(hql).uniqueResult()).intValue();*/
		//String hql2="FROM RepairHistory r order by r.nextrepairDate  desc";
		int count=0;
		Criteria criteria=getsession().createCriteria(RepairHistory.class);
		criteria.setProjection(Projections.rowCount());
		criteria.addOrder(Order.desc("nextrepairDate"));
		criteria.createCriteria("car").add(Restrictions.eq("status", 1));
		
		//System.out.println(pageBean.getPageSize());
		//List<RepairHistory> repairHistories=getsession().createQuery(hql2).setMaxResults(pageBean.getPageSize()).setFirstResult((pageBean.getCurrentPage()-1)*pageBean.getPageSize()).list();
		count = ((Number)criteria.uniqueResult()).intValue();
		criteria.setProjection(null);
		
		criteria.setFirstResult((pageBean.getCurrentPage()-1)*pageBean.getPageSize());  
        criteria.setMaxResults(pageBean.getPageSize());
		List<RepairHistory> repairHistories=criteria.list();
		PageBean page=new PageBean(pageBean.getCurrentPage(), pageBean.getPageSize(), count, repairHistories);
		return page;
	}

	@SuppressWarnings("deprecation")
	@Override
	public PageBean queryByQBC(RepairHistory repairHistory, PageBean pageBean) {
		Criteria criteria=getsession().createCriteria(RepairHistory.class);
		criteria.setProjection(Projections.rowCount());
		if (repairHistory.getCar()!=null) {
			if (repairHistory.getCar().getId()==null) {
				criteria.createCriteria("car").add(Restrictions.eq("carType", repairHistory.getCar().getCarType())).add(Restrictions.eq("status", 1));
			}else{
				criteria.add(Restrictions.eq("car", repairHistory.getCar())).createCriteria("car").add(Restrictions.eq("status", 1));
			}
		}else{
			criteria.createCriteria("car").add(Restrictions.eq("status", 1));
		}
		
		if (repairHistory.getRepairMan()!=null) {
			criteria.add(Restrictions.eq("repairMan", repairHistory.getRepairMan()));
		}
		if (repairHistory.getStatus()!=1) {
			if (repairHistory.getRepairDate()!=null) {
				criteria.add(Restrictions.between("repairDate", repairHistory.getRepairDate(), repairHistory.getNextrepairDate()));
			}
			criteria.addOrder(Order.desc("repairDate"));
		}
			  
		if (repairHistory.getStatus()==1) {
			criteria.add(Restrictions.between("nextrepairDate", repairHistory.getRepairDate(), repairHistory.getNextrepairDate()));
			criteria.addOrder(Order.desc("nextrepairDate"));
			criteria.add(Restrictions.eq("status",repairHistory.getStatus()));
		}
		int count = ((Number)criteria.uniqueResult()).intValue();
		criteria.setProjection(null);
		criteria.setFirstResult((pageBean.getCurrentPage()-1)*pageBean.getPageSize());  
	    criteria.setMaxResults(pageBean.getPageSize());
	        
	        List<RepairHistory> repairHistories=criteria.list();
		//System.out.println("数据库里面所查询得数据"+repairHistories.size());
		PageBean page=new PageBean(pageBean.getCurrentPage(), pageBean.getPageSize(), count, repairHistories);
		if (repairHistories.size()==0) {
			page.setRecordList(null);
		}
		return page;
	}

	@Override
	public List findQuantum() {
		String hql="SELECT r.repairDate FROM RepairHistory r order by repairDate asc";
		List    list=getsession().createQuery(hql).list();
		ListIterator iterator=list.listIterator();
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
		while (iterator.hasNext()) {
			Date date=(Date) iterator.next();
			iterator.add(simpleDateFormat.format(date).toString());
		}
		iterator=list.listIterator();
		while (iterator.hasNext()) {
			if (!(iterator.next() instanceof String)) {
				 iterator.remove();
			}
		}
		Set<String> set=new LinkedHashSet<String>();         
        set.addAll(list);
        list.clear();
        list.addAll(set);
		return list;
	}

	@Override
	public void updateOtherHistoryStatus(Car car) {
		
		String hql = "update t_RepairHistory history set history.I_STATUS = 0 where history.carId = :carId";
		getsession().createSQLQuery(hql).setInteger("carId", car.getId()).executeUpdate();
	}

	@Override
	public void saveRepairHistoryInformation(RepairHistory rHistory) {
		getsession().save(rHistory);
	}

	@Override
	public void deleteDataById(int id) {
		String hql="delete from RepairHistory r where id=?";
		getsession().createQuery(hql).setInteger(0, id).executeUpdate();
		
	}
	
	

}
