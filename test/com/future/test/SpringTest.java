package com.future.test;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class SpringTest {
	//scope  配置作用于 多例
	private ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
	
	/**
	 * 第一个测试，先测试是否能从sping中得到strut独享，如果成功到达就说明struts成功，
	 * 整合struts 与spring 如果在applicationContext配置得bean class属性不是全类名也能成功，就代表
	 * 这个类是由spring生成的。代表struts2与spring整合成功
	 * 
	 * @throws Exception
	 */
	@Test
	public void testBean() throws Exception {
		TestAction testAction = (TestAction) ac.getBean("testAction");
		System.out.println(testAction);
	}
	
	//测试sessionFactory
	/**
	 * 
	 * 在applicationContext中配置sessionfactorybean，如果能通过这种方式得到，
	 * 可以说明hibernate与spring整合成功
	 */
	@Test
	public void testSessionFactory(){
		SessionFactory sessionFactory = (SessionFactory) ac.getBean("sessionFactory");
		System.out.println(sessionFactory);
	}
	
	//测试事事务
	/**、
	 * 
	 * 在TestService中自动注入sessionfactory然后保存两个用户（用户有类和配置文件生成），
	 * 具体可以看TestService。java、
	 */
	@Test
	public void testTransaction(){
		TestService testService = (TestService)ac.getBean("testService");
		testService.saveTwoUser();
	}
	
}
