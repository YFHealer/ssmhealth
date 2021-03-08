package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.FamilyDAO;
import com.model.Family;
import com.opensymphony.xwork2.ActionSupport;

public class FamilyAction extends ActionSupport {

	private Integer id; //
	private String name; // 名称
	private String guanxi; // 成员关系
	private Integer age; // 年龄
	private String work; // 工作
	private String content; //

	private String message;
	private String path;

	private Family family;

	private FamilyDAO familyDao;

	public String addFamily() throws Exception {
		family = new Family();
		family.setId(id);
		family.setName(name);
		family.setGuanxi(guanxi);
		family.setAge(age);
		family.setWork(work);
		family.setContent(content);
		familyDao.save(family);
		
		this.setMessage("操作成功");
		this.setPath("listFamily.action");
		return "succeed";
	}

	public String listFamily() throws Exception {
		List FamilyList = familyDao.findAll();
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("FamilyList", FamilyList);
		return ActionSupport.SUCCESS;
	}

	public String toEditFamily() throws Exception {
		Family entity = familyDao.findById(id);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("Family", entity);
		return ActionSupport.SUCCESS;
	}

	public String editFamily() throws Exception {
		family = familyDao.findById(id);
		family.setId(id);
		family.setName(name);
		family.setGuanxi(guanxi);
		family.setAge(age);
		family.setWork(work);
		family.setContent(content);
		familyDao.merge(family);
		
		
		this.setMessage("操作成功");
		this.setPath("listFamily.action");
		return "succeed";
	}

	public String infoFamily() throws Exception {
		Family entity = familyDao.findById(id);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("Family", entity);
		return ActionSupport.SUCCESS;
	}

	public String deleteFamily() throws Exception {
		Family entity = familyDao.findById(id);
		familyDao.delete(entity);
		
		
		this.setMessage("操作成功");
		this.setPath("listFamily.action");
		return "succeed";
	}

	public Family getFamily() {
		return family;
	}

	public void setFamily(Family family) {
		this.family = family;
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

	public String getGuanxi() {
		return guanxi;
	}

	public void setGuanxi(String guanxi) {
		this.guanxi = guanxi;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public FamilyDAO getFamilyDao() {
		return familyDao;
	}

	public void setFamilyDao(FamilyDAO familyDao) {
		this.familyDao = familyDao;
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
