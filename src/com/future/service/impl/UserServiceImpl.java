package com.future.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.UserDao;
import com.future.domain.User;
import com.future.service.UserService;
import com.future.service.util.PageBean;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao ud;
	@Override
	public User findByname(String name) {
		return ud.findByname(name);
	}
	
	
	
	
	@Autowired
	private UserDao userDao;
	
	/**验证登陆*/
	@Override
	public User findByLoginNameAndPasswor(String loginName, String password) {
		return userDao.findByLoginName(loginName,password);
	}

	/**通过id查询信息*/
	@Override
	public User findById(Integer id) {
		return userDao.findById(id);
	}

	/**修改密码 废弃
	@Override
	public void updatePassword(Integer id,String oldPassword, String newPassword, String newPassword2) {
		System.out.println("================"+id + oldPassword+newPassword+newPassword2);
		//查询旧密码。如果正确，检查新密码是否相同
		User user = userDao.findById(id);
		//String md5Digest = DigestUtils.md5Hex(password);
		String old = DigestUtils.md5Hex(oldPassword);
		String newP2 = DigestUtils.md5Hex(newPassword2);
		
		if(user.getPassword().equals(old)){
			System.out.println("相同");
			//如果新密码不同，返回
			//如果新密码相同，修改密码
			//userDao.updatePassword(id,oldPassword,newPassword,newPassword2);
		} else {
		}
	}
	*/

	@Override
	public boolean testPassword(Integer id, String oldPassword) {
		//查询旧密码。如果正确，检查新密码是否相同
		User user = userDao.findById(id);
		//String md5Digest = DigestUtils.md5Hex(password);
		String old = DigestUtils.md5Hex(oldPassword);
		
		if(user.getPassword().equals(old)){
			System.out.println("相同");
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean testNewPassword(String newPassword, String newPassword2) {
		if(newPassword.equals(newPassword2))
			return true;
		return false;
	}


	@Override
	public void testNewPassword(Integer id, String newPassword) {
		User user = userDao.findById(id);
		String md5Digest = DigestUtils.md5Hex(newPassword);
		user.setPassword(md5Digest);
		userDao.save(user);
	}

	/**获取所有用户列表*/
	@Override
	public List<User> getUserAll() {
		return userDao.getUserAll();
	}

	//添加用户前检查用户是否存在
	@Override
	public boolean isOrNoName(String loginName) {
		if(userDao.isOrNoName(loginName) == null){
			//不存在，返回false
			return false;
		}
		return true;
	}

	//添加用户和
	@Override
	public void addUser(User user) {
		String md5Digest = DigestUtils.md5Hex(user.getPassword());
		user.setPassword(md5Digest);
		userDao.save(user);
	}

	//删除
	@Override
	public void delete(Integer id) {
		userDao.delete(id);
	}

	/**修改之后保存*/
	@Override
	public void save(User user) {
		userDao.save(user);
	}

	@Override
	public PageBean getPageBean(int pageNum, int pageSize) {
		return userDao.getPageBean(pageNum,pageSize);
	}

	@Override
	public User queryUserByUserName(String userName) {
		return userDao.queryUserByUserName(userName);
	}

	@Override
	public boolean getSession() {
		return userDao.getSession();
	}

	
	

	
	

}
