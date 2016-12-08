package com.future.test;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class TestService {

	@Resource
	private SessionFactory sessionFactory;
	
	//这个注解是为了开启事务
	@Transactional
	public void saveTwoUser(){
		Session session = sessionFactory.getCurrentSession(); ;
		
		//测试事务是否成功，  如果没有//int a = 10 / 0 ;   则可以插入两条新纪录
		//如果有插入不了，一条插入成功，但是由于事务开启，产生了事务回滚所以插入得一条记录会回滚，数据表中占用一个id
		session.save(new User());
		//int a = 10 / 0 ; 
		//session.save(new User());
	}
	
	@Transactional
	public void saveUsers25() {
		Session session = sessionFactory.getCurrentSession();
	}
}
