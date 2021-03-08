package com.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TAdminDAO;
import com.model.TAdmin;
import com.model.TGonggao;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;

public class adminAction extends ActionSupport {
	private int userId;
	private String userName;
	private String userPw;
	private int userType;

	private TAdminDAO adminDAO;

	private String message;
	private String path;

	private int index = 1;

	public String adminAdd() {
		TAdmin admin = new TAdmin();
		admin.setUserName(userName);
		admin.setUserPw(userPw);
		admin.setUserType(userType);
		
		adminDAO.save(admin) ;
		this.setMessage("添加成功！");
		this.setPath("adminManage.action");
		return "succeed";
	}

	public String adminManage() {
		List adminList = adminDAO.findAll();
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("adminList", adminList);
		return ActionSupport.SUCCESS;
	}

	public String adminDel() {
		TAdmin admin = adminDAO.findById(userId);
		adminDAO.delete(admin) ;
		this.setMessage("删除成功！");
		this.setPath("adminManage.action");
		return "succeed";
	}

	public String adminToUpdate1() {
		TAdmin admin = adminDAO.findById(userId);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("admin", admin);
		return ActionSupport.SUCCESS;
	}

	public String adminEdit1() {
		TAdmin admin = adminDAO.findById(userId);
		admin.setUserName(userName);
		admin.setUserPw(userPw);
		admin.setUserType(userType);
		
		adminDAO.merge(admin);
		this.setMessage("修改成功");
		this.setPath("adminMana3.action");
		return "succeed";
	}
	public String adminMana3() {
	//	List gonggaoList = gonggaoDAO.findAll2();
		List adminList = adminDAO.findAll2();
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("adminList", adminList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String getMessage() {
		return message;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public TAdminDAO getAdminDAO() {
		return adminDAO;
	}

	public void setAdminDAO(TAdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

}
