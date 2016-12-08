package com.future.view.action;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.base.BaseAction;
import com.future.domain.User;
import com.future.service.util.PageBean;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@Controller
@Scope("prototype")
public class UserAction extends BaseAction implements RequestAware, ModelDriven<User>, Preparable {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("deprecation")
	public Session getsession() {
		
		return sessionFactory.getCurrentSession();
	}
	

	/** 显示登陆页面 */
	public String loginUI() {
		return "loginUI";
	}
	
	/**请求首页*/
	public String index(){
		if(ActionContext.getContext().getSession().get("User")==null || ActionContext.getContext().getSession().get("User")==""){
			return "index1";
		}
		
		return "index1";
	}

	/** 登陆 */
	public String login() {
		if(model.getLoginName().isEmpty()){
			ActionContext.getContext().put("message", "请输入用户名和密码！");
			return "loginUI";
		} else{
			User user = userService.findByLoginNameAndPasswor(model.getLoginName(),model.getPassword());
			if(user == null){
				ActionContext.getContext().put("message", "用户名或密码错误！");
				return "loginUI";
			} else{
				ActionContext.getContext().getSession().put("user", user);
				return "index";
			}
		}
		
	}
	
	/**查看个人信息*/
	public String info(){
		//User user = userService.findById(model.getId());
		//request.put("user", user);
		return "userInfo";
	}
	
	/**修改密码页面*/
	public String updatePasswordUI(){
		return "updatePasswordUI";
	}
	
	private String oldPassword;
	private String newPassword;
	private String newPassword2; 
	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getNewPassword2() {
		return newPassword2;
	}

	public void setNewPassword2(String newPassword2) {
		this.newPassword2 = newPassword2;
	}

	/**修改密码*/
	public String updatePassword(){
		//第一次写的方法有问题
		//userService.updatePassword(model.getId(),oldPassword,newPassword,newPassword2);
		
		if(userService.testPassword(model.getId(),oldPassword)){
			//查询旧密码。如果正确，检查新密码是否相同
			//比对两个新密码是否相同
			if(userService.testNewPassword(newPassword,newPassword2)){
				userService.testNewPassword(model.getId(),newPassword);
				ActionContext.getContext().getSession().remove("user");
				
			} else {
				ActionContext.getContext().put("passwordMessage", "两次输入密码不一致");
				
				ActionContext.getContext().put("oldPassword", oldPassword);
				ActionContext.getContext().put("newPassword", newPassword);
				ActionContext.getContext().put("newPassword2", newPassword2);
				return "updatePasswordUI";
			}
		} else{
			ActionContext.getContext().put("passwordMessage", "密码错误");
			ActionContext.getContext().put("oldPassword", oldPassword);
			ActionContext.getContext().put("newPassword", newPassword);
			ActionContext.getContext().put("newPassword2", newPassword2);
			
			return "updatePasswordUI";
		}
		
		//如果新密码不同，返回
		
		//如果新密码相同，修改密码
		
		return "loginUI";
	}
	
	//分页数据
	private int pageNum = 1;//当前页
	private int pageSize = 10;//每页显示多少条记录
	
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	
	/**显示用户列表*/
	public String list(){
		/**准备数据  用户列表*/
		
		//List<User> userList = userService.getUserAll();
		//ActionContext.getContext().put("userList", userList);
		
		//PageBean pageBean = productService.getPageBean(pageNum,pageSize);
		PageBean pageBean = userService.getPageBean(pageNum,pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		//String message = (String) ActionContext.getContext().get("errorMessage");
		String message = (String) ActionContext.getContext().getSession().get("errorMessage");
		ActionContext.getContext().put("errorMessage", message);
		ActionContext.getContext().getSession().remove("errorMessage");
		
		return "user_list";
	}
	
	/**添加用户 页面*/
	public String addUI(){
		return "saveUI";
	}
	
	private boolean statu = true;
	
	/**添加用户之前检测*/
	public String isornot(){
		boolean stat = userService.isOrNoName(model.getLoginName());//不存在false
		statu = stat;
		ActionContext.getContext().getValueStack().push(statu);
		
		return "isOrNot";
	}
	
	/**添加用户*/
	public String add(){
		//检查用户名是否存在
		if(userService.isOrNoName(model.getLoginName())){
			//存在
			ActionContext.getContext().getValueStack().push(model);
			addFieldError("Message", "此用户以存在");
			return "saveUI";
		} else{
			//如果不存在，添加
			userService.addUser(model);
			return "userlist";
		}
		
	}
	
	/**修改页面*/
	public String editUI(){
		User user  = userService.findById(model.getId());
		ActionContext.getContext().getValueStack().push(user);
		return "editUI";
	}
	
	/**修改*/
	public String edit(){
		User user  = userService.findById(model.getId());
		user.setName(model.getName());
		user.setPhoneNum(model.getPhoneNum());
		userService.save(user);
		return "userlist";
	}
	
	/**返回*/
	public String back(){
		return "index";
	}
	
	/**返回*/
	public String backlist(){
		return "userlist";
	}
	
	/**删除用户*/
	public String delete(){
		try {
			userService.delete(model.getId());
		} catch (Exception e) {
			//ActionContext.getContext().put("errorMessage", "您所删除的用户有维修维修记录，不能删除。");
			ActionContext.getContext().getSession().put("errorMessage", "您所删除的用户有维修维修记录，不能删除。");
			return "userlist";
		}
		
		return "userlist";
	}
	/**注销*/
	public String logout(){
		ActionContext.getContext().getSession().remove("user");
		//ActionContext.getContext().getValueStack().
		return "loginUI";
	}

	// ==================
	private Map<String, Object> request;

	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	

	public void prepare() throws Exception {
	}

	/*实现ModelDriven接口 ，需要添加getModel方法*/
	private User model;
	public User getModel() {
		return model=new User();
	}

}
