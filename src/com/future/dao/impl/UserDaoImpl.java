package com.future.dao.impl;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.UserDao;
import com.future.domain.User;
import com.future.service.util.PageBean;

@Repository
public class UserDaoImpl extends BaseDao implements UserDao {

	@Override
	public User findByname(String name) {
		if (name!=null&&name!="") {
			String hql="FROM User u where u.name=?";
			User user=(User) getsession().createQuery(hql).setString(0, name).uniqueResult();
			return user;
		}else {
			return null;
		}
		
	}
	@Override
	public User findByLoginName(String loginName, String password) {
		String md5Digest = DigestUtils.md5Hex(password);
		//System.out.println("md5"+md5Digest);
		return (User) getsession().createQuery(
				"from User u where u.loginName=? and u.password=?")
				.setParameter(0, loginName)
				.setParameter(1, md5Digest)
				.uniqueResult();
	}

	@Override
	public User findById(Integer id) {
		return (User) getsession().createQuery(
				
				"from User u where u.id=?")
				.setParameter(0, id)
				.uniqueResult();
	}

	/**修改密码*/
	@Override
	public void save(User user) {
		getsession().save(user);
	}

	/**获取所有用户列表*/
	@Override
	public List<User> getUserAll() {
		return getsession().createQuery(
				"from User")
				.list();
	}

	//根据用户名查询用户
	@Override
	public User isOrNoName(String loginName) {
		return (User) getsession().createQuery(
				"from User u where u.loginName=?")
				.setParameter(0, loginName)
				.uniqueResult();
	}

	//删除
	@Override
	public void delete(Integer id) {
		String hql="delete from User u where u.id = ?";
		getsession().createQuery(hql).setInteger(0, id).executeUpdate();
	}

	//分页
	@Override
	public PageBean getPageBean(int pageNum, int pageSize) {
		//查询列表
		
		List list = getsession().createQuery("From User")
				.setFirstResult((pageNum - 1 ) * pageSize)
				.setMaxResults(pageSize)
				.list();
		
		Long count =  (Long) getsession().createQuery("select count (*) from User")
				.uniqueResult();
		
		return new PageBean(pageNum, pageSize, count.intValue(), list);
	}

	@Override
	public User queryUserByUserName(String userName) {
		String hql = "from User user where user.name = :name";
		User user = (User) getsession().createQuery(hql).setString("name", userName).uniqueResult();
		return user;
	}
	@Override
	public boolean getSession() {
		return false;
	}
	
	/*@Override
	public void updatePassword(Integer id,String oldPassword, String newPassword, String newPassword2) {
		//查询旧密码。如果正确，检查新密码是否相同
		System.out.println("================"+id + oldPassword+newPassword+newPassword2);
		
		//如果新密码不同，返回
		
		//如果新密码相同，修改密码
	}*/
	/*废弃
	 * @Override
	public void setNewPassword(Integer id,String newPassword) {
		String md5Digest = DigestUtils.md5Hex(newPassword);
		//System.out.println("设置密码" + id+ md5Digest);
	}*/


}
