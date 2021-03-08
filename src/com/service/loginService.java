package com.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;


import com.dao.TAdminDAO;
import com.dao.TUserDAO;
import com.model.TAdmin;
import com.model.TUser;

public class loginService {

	private TAdminDAO adminDao;

	private TUserDAO userDao;

	public TAdminDAO getAdminDao() {
		return adminDao;
	}

	public void setAdminDao(TAdminDAO adminDao) {
		this.adminDao = adminDao;
	}

	public TUserDAO getUserDao() {
		return userDao;
	}

	public void setUserDao(TUserDAO userDao) {
		this.userDao = userDao;
	}

	public String login(String userName, String userPw, int userType) {

		String result = "no";

		if (userType == 0)// 管理员登录
		{
			String sql = "from TAdmin where userName=? and userPw=?";
	//	 Session session= HibernateSessionFactory.getSession();
//			Query query = session.createQuery(sql);
//			List liuyanList=query.list();
//			HibernateSessionFactory.closeSession();
//			
			Object[] con = { userName, userPw };
			List adminList = adminDao.getHibernateTemplate().find(sql, con);

			if (adminList.size() == 0) {
				result = "no";
			} else {
				WebContext ctx = WebContextFactory.get();
				HttpSession session = ctx.getSession();
				TAdmin admin = (TAdmin) adminList.get(0);
				session.setAttribute("userType", 0);
				session.setAttribute("admin", admin);
				result = "yes";
			}
		}
		if (userType == 1)// 用户
		{
			String sql = "from TUser where loginname=? and loginpw=?";
			Object[] con = { userName, userPw };
			List userList = userDao.getHibernateTemplate().find(sql, con);
			if (userList.size() == 0) {
				result = "no";
			} else {
				WebContext ctx = WebContextFactory.get();
				HttpSession session = ctx.getSession();
				TUser user = (TUser) userList.get(0);
				session.setAttribute("userType", 1);
				session.setAttribute("user", user);
				result = "yes";
			}
		}
		return result;
	}
   //修改密码
	public String adminPwEdit(String userPwNew) {
		try {
			Thread.sleep(700);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get();
		HttpSession session = ctx.getSession();
		//HibernateSessionFactory.closeSession();
		TAdmin admin = (TAdmin) session.getAttribute("admin");
		admin.setUserPw(userPwNew);
		adminDao.merge(admin);
		session.setAttribute("admin", admin);

		return "yes";
	}

}
