package com.future.service;

import com.future.domain.User;
import java.util.List;

import com.future.domain.User;
import com.future.service.util.PageBean;

public interface UserService {
	public User findByname(String name);
	

	/**查询数据库中此*/
	User findByLoginNameAndPasswor(String loginName, String password);

	/**g根据id查询用户信息*/
	User findById(Integer id);

	/**修改密码  废弃
	void updatePassword(Integer id,String oldPassword, String newPassword, String newPassword2);
	 */
	
	/**查询输入密码和数据库密码是否一致*/
	boolean testPassword(Integer id, String oldPassword);

	/**查询输入两次密码是否一致*/
	boolean testNewPassword(String newPassword, String newPassword2);

	/**修改密码*/
	void testNewPassword(Integer id, String newPassword);

	/**获取所有用户*/
	List<User> getUserAll();

	boolean isOrNoName(String loginName);
	
	//添加用户
	void addUser(User user);

	//删除
	void delete(Integer id);

	/**修改之后保存*/
	void save(User user);

	//分页
	PageBean getPageBean(int pageNum, int pageSize);
	
	
	//根据用户名查询用户
	public User queryUserByUserName(String userName);


	public boolean getSession();

	
	
}
