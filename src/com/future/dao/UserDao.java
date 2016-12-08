package com.future.dao;

import java.util.List;

import com.future.domain.User;
import com.future.service.util.PageBean;

public interface UserDao {
	public User findByname(String name);
	/**登陆验证 查询此人*/
	User findByLoginName(String loginName, String password);

	/**根据id查询用户信息*/
	User findById(Integer id);

	/**修改密码 此方法第一编写  有问题  废弃
	void updatePassword(Integer id,String oldPassword, String newPassword, String newPassword2);
	void setNewPassword(Integer id,String newPassword);
	*/
	
	
	/**修改密码*/
	void save(User user);

	/**获取所有用户列表*/
	List<User> getUserAll();

	//根据用户名查询用户信息
	User isOrNoName(String loginName);

	//删除
	void delete(Integer id);

	//分页
	PageBean getPageBean(int pageNum, int pageSize);
	//根据用户名查询用户
	public User queryUserByUserName(String userName);
	
	public boolean getSession();

}
