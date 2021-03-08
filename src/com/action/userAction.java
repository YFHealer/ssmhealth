package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TUserDAO;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;

public class userAction extends ActionSupport {
	private int id;
	private String xuehao;
	private String name1;
	private String sex;
	private String age;
	private String ruxueshijian;
	private String loginname;
	private String loginpw;
	private int tea_id;

	private String shenfenzheng;

	private String zhunkaozheng;

	private String xibie;

	private String nianji;

	private TUserDAO userDao;

	private String message;
	private String path;

	public String userReg() {
		TUser user = new TUser();
		user.setXuehao(xuehao);
		user.setName1(name1);
		user.setSex(sex);
		user.setAge(age);
		user.setRuxueshijian(ruxueshijian);
		user.setLoginname(loginname);
		user.setLoginpw(loginpw);
		user.setTea_id(tea_id);
		user.setDel("no");
		user.setShenfenzheng(shenfenzheng);
		user.setZhunkaozheng(zhunkaozheng);
		user.setXibie(xibie);
		user.setNianji(nianji);
		userDao.save(user);
		return "successAdd";
	}

	public String userReg1() {
		TUser user = new TUser();
		user.setXuehao(xuehao);
		user.setName1(name1);
		user.setSex(sex);
		user.setAge(age);
		user.setAge(nianji);
		user.setAge(xibie);
		user.setAge(shenfenzheng);
		user.setAge(zhunkaozheng);
		user.setRuxueshijian(ruxueshijian);
		user.setLoginname(loginname);
		user.setLoginpw(loginpw);
		user.setTea_id(tea_id);
		user.setDel("no");

		userDao.save(user);
		this.setMessage("添加成功");
		this.setPath("userMana.action");
		return "succeed";
	}
	
   // 显示用户档案信息
	public String userMana() {
		String sql = "from TUser as user where user.del='no'";
		List userList = userDao.getHibernateTemplate().find(sql);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}

	public String userAll() {

		List userList = userDao.findAll();
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}

	public String userDel() {
		TUser user = userDao.findById(id);
		userDao.delete(user);

		this.setMessage("删除成功");
		this.setPath("userMana.action");
		return "succeed";
	}

	public String userEdit() {
		TUser user = userDao.findById(id);
		user.setXuehao(xuehao);
		user.setName1(name1);
		user.setSex(sex);
		user.setAge(age);
		user.setRuxueshijian(ruxueshijian);
		user.setLoginname(loginname);
		user.setLoginpw(loginpw);
		user.setTea_id(tea_id);
		user.setDel("no");
		user.setShenfenzheng(shenfenzheng);
		user.setZhunkaozheng(zhunkaozheng);
		user.setXibie(xibie);
		user.setNianji(nianji);
		userDao.merge(user);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("msg", "修改成功");
		return "msg";
	}

	public String userToEdit() {
		TUser user = userDao.findById(id);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("user", user);
		return ActionSupport.SUCCESS;
	} 

	public String Search() {		  
		List userList = userDao.findByName();
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}

	public String SearchMana() {
		String sql = "from TUser where name1 like '%杨%' or sex like '男' or xuehao like '2015%'";
		List userList = userDao.getHibernateTemplate().find(sql);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}
	
	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTea_id() {
		return tea_id;
	}

	public void setTea_id(int tea_id) {
		this.tea_id = tea_id;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getLoginpw() {
		return loginpw;
	}

	public void setLoginpw(String loginpw) {
		this.loginpw = loginpw;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getName1() {
		return name1;
	}

	public void setName1(String name1) {
		this.name1 = name1;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getRuxueshijian() {
		return ruxueshijian;
	}

	public void setRuxueshijian(String ruxueshijian) {
		this.ruxueshijian = ruxueshijian;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getXuehao() {
		return xuehao;
	}

	public void setXuehao(String xuehao) {
		this.xuehao = xuehao;
	}

	public String getShenfenzheng() {
		return shenfenzheng;
	}

	public void setShenfenzheng(String shenfenzheng) {
		this.shenfenzheng = shenfenzheng;
	}

	public String getZhunkaozheng() {
		return zhunkaozheng;
	}

	public void setZhunkaozheng(String zhunkaozheng) {
		this.zhunkaozheng = zhunkaozheng;
	}

	public String getXibie() {
		return xibie;
	}

	public void setXibie(String xibie) {
		this.xibie = xibie;
	}

	public String getNianji() {
		return nianji;
	}

	public void setNianji(String nianji) {
		this.nianji = nianji;
	}

	public TUserDAO getUserDao() {
		return userDao;
	}

	public void setUserDao(TUserDAO userDao) {
		this.userDao = userDao;
	}

}
