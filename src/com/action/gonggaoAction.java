package com.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TGonggaoDAO;
import com.model.TAdmin;
import com.model.TGonggao;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class gonggaoAction extends ActionSupport {
	private int gonggaoId;
	private String gonggaoTitle;
	private String gonggaoContent;
	private String gonggaoData;
	private String gonggaoFabuzhe;

	private String gonggaoOne1;

	private String message;
	private String path;

	private TGonggaoDAO gonggaoDAO;

	public String gonggaoAdd() {
		TGonggao gonggao = new TGonggao();
		gonggao.setGonggaoTitle(gonggaoTitle);
		gonggao.setGonggaoContent(gonggaoContent);
		gonggao.setGonggaoData(new Date().toLocaleString());
		gonggao.setGonggaoOne1(gonggaoOne1);
		gonggaoDAO.save(gonggao);
		this.setMessage("添加成功");
		this.setPath("gonggaoMana.action");
		return "succeed";
	}

	public String gonggaoToUpdate() {
		TGonggao gonggao = gonggaoDAO.findById(gonggaoId);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("gonggao", gonggao);
		return ActionSupport.SUCCESS;
	}

	public String gonggaoEdit() {
		TGonggao gonggao = gonggaoDAO.findById(gonggaoId);
		gonggao.setGonggaoTitle(gonggaoTitle);
		gonggao.setGonggaoContent(gonggaoContent);
		gonggao.setGonggaoData(new Date().toLocaleString());
		gonggaoDAO.merge(gonggao);
		this.setMessage("修改成功");
		this.setPath("gonggaoMana.action");
		return "succeed";
	}

	public String gonggaoMana() {
		List gonggaoList = gonggaoDAO.findAll();
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("gonggaoList", gonggaoList);
		return ActionSupport.SUCCESS;
	}

	public String gonggaoMana1() {
		List gonggaoList = gonggaoDAO.findAll();
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("gonggaoList", gonggaoList);
		return ActionSupport.SUCCESS;
	}

	public String gonggaoDel() {
		TGonggao gonggao = gonggaoDAO.findById(gonggaoId);
		gonggaoDAO.delete(gonggao);
		this.setMessage("删除成功");
		this.setPath("gonggaoMana.action");
		return "succeed";
	}

	public String gonggaoDetail() {
		TGonggao gonggao = gonggaoDAO.findById(gonggaoId);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("gonggao", gonggao);
		return ActionSupport.SUCCESS;
	}

	public String gonggaoDetailQian() {
		TGonggao gonggao = gonggaoDAO.findById(gonggaoId);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("gonggao", gonggao);

		return ActionSupport.SUCCESS;
	}

	public String gonggaoQian5() {
		Map request = (Map) ServletActionContext.getContext().get("request");

		List gonggaoList = gonggaoDAO.findAll();
		if (gonggaoList.size() > 5) {
			gonggaoList = gonggaoList.subList(0, 5);
		}
		request.put("gonggaoList", gonggaoList);
		return ActionSupport.SUCCESS;
	}

	
	public String gonggaoAdd1() {
		TGonggao gonggao = new TGonggao();
		gonggao.setGonggaoTitle(gonggaoTitle);
		gonggao.setGonggaoContent(gonggaoContent);
		gonggao.setGonggaoData(new Date().toLocaleString());
		gonggao.setGonggaoOne1(gonggaoOne1);
		gonggaoDAO.save(gonggao);
		this.setMessage("添加成功");
		this.setPath("gonggaoMana2.action");
		return "succeed";
	}
	public String gonggaoAdd2() {
		TGonggao gonggao = new TGonggao();
		gonggao.setGonggaoTitle(gonggaoTitle);
		gonggao.setGonggaoContent(gonggaoContent);
		gonggao.setGonggaoData(new Date().toLocaleString());
		gonggao.setGonggaoOne1(gonggaoOne1);
		gonggaoDAO.save(gonggao);
		this.setMessage("操作成功");
		this.setPath("gonggaoMana4.action");
		return "succeed";
	}
	public String gonggaoToUpdate1() {
		TGonggao gonggao = gonggaoDAO.findById(gonggaoId);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("gonggao", gonggao);
		return ActionSupport.SUCCESS;
	}

	public String gonggaoEdit1() {
		TGonggao gonggao = gonggaoDAO.findById(gonggaoId);
		gonggao.setGonggaoTitle(gonggaoTitle);
		gonggao.setGonggaoContent(gonggaoContent);
		gonggao.setGonggaoData(new Date().toLocaleString());
		gonggaoDAO.merge(gonggao);
		this.setMessage("修改成功");
		this.setPath("gonggaoMana2.action");
		return "succeed";
	}
	public String gonggaoToUpdate2() {
		TGonggao gonggao = gonggaoDAO.findById(gonggaoId);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("gonggao", gonggao);
		return ActionSupport.SUCCESS;
	}

	public String gonggaoEdit2() {
		TGonggao gonggao = gonggaoDAO.findById(gonggaoId);
		gonggao.setGonggaoTitle(gonggaoTitle);
		gonggao.setGonggaoContent(gonggaoContent);
		gonggao.setGonggaoData(new Date().toLocaleString());
		gonggaoDAO.merge(gonggao);
		this.setMessage("修改成功");
		this.setPath("gonggaoMana4.action");
		return "succeed";
	}
	public String gonggaoMana2() {
		List gonggaoList = gonggaoDAO.findAll2();
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("gonggaoList", gonggaoList);
		return ActionSupport.SUCCESS;
	}
	public String gonggaoMana3() {
		List gonggaoList = gonggaoDAO.findAll2();
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("gonggaoList", gonggaoList);
		return ActionSupport.SUCCESS;
	}

	public String gonggaoMana4() {
		List gonggaoList = gonggaoDAO.findAll3();
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("gonggaoList", gonggaoList);
		return ActionSupport.SUCCESS;
	}
	public String gonggaoMana5() {
		List gonggaoList = gonggaoDAO.findAll3();
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("gonggaoList", gonggaoList);
		return ActionSupport.SUCCESS;
	}

	public String gonggaoDel1() {
		TGonggao gonggao = gonggaoDAO.findById(gonggaoId);
		gonggaoDAO.delete(gonggao);
		this.setMessage("删除成功");
		this.setPath("gonggaoMana2.action");
		return "succeed";
	}
	public String gonggaoDel2() {
		TGonggao gonggao = gonggaoDAO.findById(gonggaoId);
		gonggaoDAO.delete(gonggao);
		this.setMessage("删除成功");
		this.setPath("gonggaoMana4.action");
		return "succeed";
	}

	public String gonggaoDetail1() {
		TGonggao gonggao = gonggaoDAO.findById(gonggaoId);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("gonggao", gonggao);
		return ActionSupport.SUCCESS;
	}
	public String gonggaoDetail2() {
		TGonggao gonggao = gonggaoDAO.findById(gonggaoId);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("gonggao", gonggao);
		return ActionSupport.SUCCESS;
	}

	public String gonggaoDetailQian1() {
		TGonggao gonggao = gonggaoDAO.findById(gonggaoId);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("gonggao", gonggao);

		return ActionSupport.SUCCESS;
	}

	public String gonggaoQian51() {
		Map request = (Map) ServletActionContext.getContext().get("request");

		List gonggaoList = gonggaoDAO.findAll();
		if (gonggaoList.size() > 5) {
			gonggaoList = gonggaoList.subList(0, 5);
		}
		request.put("gonggaoList", gonggaoList);
		return ActionSupport.SUCCESS;
	}

	
	
	
	public String getGonggaoContent() {
		return gonggaoContent;
	}

	public void setGonggaoContent(String gonggaoContent) {
		this.gonggaoContent = gonggaoContent;
	}

	public TGonggaoDAO getGonggaoDAO() {
		return gonggaoDAO;
	}

	public void setGonggaoDAO(TGonggaoDAO gonggaoDAO) {
		this.gonggaoDAO = gonggaoDAO;
	}

	public String getGonggaoData() {
		return gonggaoData;
	}

	public void setGonggaoData(String gonggaoData) {
		this.gonggaoData = gonggaoData;
	}

	public String getGonggaoFabuzhe() {
		return gonggaoFabuzhe;
	}

	public void setGonggaoFabuzhe(String gonggaoFabuzhe) {
		this.gonggaoFabuzhe = gonggaoFabuzhe;
	}

	public int getGonggaoId() {
		return gonggaoId;
	}

	public void setGonggaoId(int gonggaoId) {
		this.gonggaoId = gonggaoId;
	}

	public String getGonggaoTitle() {
		return gonggaoTitle;
	}

	public void setGonggaoTitle(String gonggaoTitle) {
		this.gonggaoTitle = gonggaoTitle;
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

	public String getGonggaoOne1() {
		return gonggaoOne1;
	}

	public void setGonggaoOne1(String gonggaoOne1) {
		this.gonggaoOne1 = gonggaoOne1;
	}

}
