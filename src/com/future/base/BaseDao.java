package com.future.base;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;

public class BaseDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("deprecation")
	public Session getsession() {
		
		return sessionFactory.getCurrentSession();
	}
}
