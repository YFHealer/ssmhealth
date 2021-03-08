package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.JiangliDAO;
import com.model.Jiangli;
import com.opensymphony.xwork2.ActionSupport;

public class JiangliAction extends ActionSupport {

	private Integer id; //
	private String name; // 病史名称
	private String content; // 病史详情
	private Integer stuId; // 用户id
	private String shijian; // 时间

	private String message;
	private String path;

	private Jiangli jiangli;

	private JiangliDAO jiangliDao;

	public String addJiangli() throws Exception {
		jiangli = new Jiangli();
		jiangli.setId(id);
		jiangli.setName(name);
		jiangli.setContent(content);
		jiangli.setStuId(stuId);
		jiangli.setShijian(shijian);
		jiangliDao.save(jiangli);
		
		this.setMessage("操作成功");
		this.setPath("listJiangli1.action?stuId=" + stuId);
		return "succeed";
	}
	public String addJiangli1() throws Exception {
		jiangli = new Jiangli();
		jiangli.setId(id);
		jiangli.setName(name);
		jiangli.setContent(content);
		jiangli.setStuId(stuId);
		jiangli.setShijian(shijian);
		jiangliDao.save(jiangli);
		
		this.setMessage("操作成功");
		this.setPath("listJiangli.action");
		return "succeed";
	}

	public String listJiangli() throws Exception {
		List JiangliList = jiangliDao.findAll();
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("JiangliList", JiangliList);
		return ActionSupport.SUCCESS;
	}
	
	public String listJiangli1() throws Exception {
		List JiangliList = jiangliDao.findAllByUserId(stuId);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("JiangliList", JiangliList);
		return ActionSupport.SUCCESS;
	}

	public String toEditJiangli() throws Exception {
		Jiangli entity = jiangliDao.findById(id);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("Jiangli", entity);
		return ActionSupport.SUCCESS;
	}
	public String toEditJiangli1() throws Exception {
		Jiangli entity = jiangliDao.findById(id);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("Jiangli", entity);
		return ActionSupport.SUCCESS;
	}
	
	
	public String editJiangli() throws Exception {
		jiangli = jiangliDao.findById(id);
		jiangli.setId(id);
		jiangli.setName(name);
		jiangli.setContent(content);
		jiangli.setStuId(stuId);
		jiangli.setShijian(shijian);
		jiangliDao.merge(jiangli);
		
		this.setMessage("修改成功");
		this.setPath("listJiangli1.action?stuId=" + stuId);
		return "succeed";
	}
	public String editJiangli1() throws Exception {
		jiangli = jiangliDao.findById(id);
		jiangli.setId(id);
		jiangli.setName(name);
		jiangli.setContent(content);
		jiangli.setStuId(stuId);
		jiangli.setShijian(shijian);
		jiangliDao.merge(jiangli);
		
		this.setMessage("修改成功");
		this.setPath("listJiangli.action");
		return "succeed";
	}
	public String infoJiangli() throws Exception {
		Jiangli entity = jiangliDao.findById(id);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("Jiangli", entity);
		return ActionSupport.SUCCESS;
	}

	public String deleteJiangli() throws Exception {
		Jiangli entity = jiangliDao.findById(id);
		jiangliDao.delete(entity);
		
		this.setMessage("删除成功");
		this.setPath("listJiangli.action");
		return "succeed";
	}
	
	public String deleteJiangli1() throws Exception {
		Jiangli entity = jiangliDao.findById(id);
		stuId = entity.getStuId() ;
		jiangliDao.delete(entity);
		
		this.setMessage("删除成功");
		this.setPath("listJiangli1.action?stuId=" + stuId);
		return "succeed";
	}

	public Jiangli getJiangli() {
		return jiangli;
	}

	public void setJiangli(Jiangli jiangli) {
		this.jiangli = jiangli;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public String getShijian() {
		return shijian;
	}

	public void setShijian(String shijian) {
		this.shijian = shijian;
	}

	public JiangliDAO getJiangliDao() {
		return jiangliDao;
	}

	public void setJiangliDao(JiangliDAO jiangliDao) {
		this.jiangliDao = jiangliDao;
	}

	public String getMessage() {
		return message;
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
}
