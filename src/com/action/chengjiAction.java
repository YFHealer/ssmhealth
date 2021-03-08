package com.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.TChengjiDAO;
import com.dao.TUserDAO;
import com.model.DataModel;
import com.model.TChengji;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.StringUtils;

public class chengjiAction extends ActionSupport {

	private Integer id;
	private Integer stuId;
	private String kecheng;
	private Integer chengji;
	private String stuName ;
	
	private String shenfenzheng;
	private String zhunkaozheng;
	private String xibie;
	private String nianji;
	private String xuehao;
	private String name1;

	private String message;
	private String path;

	private TChengjiDAO chengjiDao;

	private TUserDAO userDao;

	public TUserDAO getUserDao() {
		return userDao;
	}

	public void setUserDao(TUserDAO userDao) {
		this.userDao = userDao;
	}

	public TChengjiDAO getChengjiDao() {
		return chengjiDao;
	}

	public void setChengjiDao(TChengjiDAO chengjiDao) {
		this.chengjiDao = chengjiDao;
	}

	
	
	public String data_zhutu()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		List chengjiList = chengjiDao.findAllByUserId(stuId);
		//数据列表
		List<DataModel> dataList = new ArrayList<DataModel>();
		Map<Integer,Integer> zmap = new HashMap<Integer,Integer>();
		for (Object obj : chengjiList) {
			TChengji chengjiObj = (TChengji) obj;
			if("xueya".equals(chengjiObj.getKecheng())){
				if(chengjiObj.getChengji() <= 90){
					if(zmap.get(90) == null || zmap.get(90) == 0){
						zmap.put(90, 1);
					}else{
						zmap.put(90, zmap.get(90) + 1);
					}
				}
				if(chengjiObj.getChengji() > 90 && chengjiObj.getChengji() <= 130){
					if(zmap.get(130) == null || zmap.get(130) == 0){
						zmap.put(130, 1);
					}else{
						zmap.put(130, zmap.get(130) + 1);
					}
				}
				if(chengjiObj.getChengji() > 130){
					if(zmap.get(131) == null || zmap.get(131) == 0){
						zmap.put(131, 1);
					}else{
						zmap.put(131, zmap.get(131) + 1);
					}
				}				
			}
		}
		
			DataModel da1 = new DataModel();
			da1.setCount(zmap.get(90));
			da1.setNeirong("低血压");
			
			DataModel da2 = new DataModel();
			da2.setCount(zmap.get(130));
			da2.setNeirong("正常血压");
			
			DataModel da3 = new DataModel();
			da3.setCount(zmap.get(131));
			da3.setNeirong("高血压");
			dataList.add(da1);
			dataList.add(da2);
			dataList.add(da3);
		request.setAttribute("dataList", dataList);
		request.setAttribute("zhutuname", "个人血压柱状图");
		return ActionSupport.SUCCESS;
	}
	
	public String data_zhutu1()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		List chengjiList = chengjiDao.findAll();
		//数据列表
		List<DataModel> dataList = new ArrayList<DataModel>();
		Map<Integer,Integer> zmap = new HashMap<Integer,Integer>();
		for (Object obj : chengjiList) {
			TChengji chengjiObj = (TChengji) obj;
			if("xueya".equals(chengjiObj.getKecheng())){
				if(chengjiObj.getChengji() <= 90){
					if(zmap.get(90) == null || zmap.get(90) == 0){
						zmap.put(90, 1);
					}else{
						zmap.put(90, zmap.get(90) + 1);
					}
				}
				if(chengjiObj.getChengji() > 90 && chengjiObj.getChengji() <= 130){
					if(zmap.get(130) == null || zmap.get(130) == 0){
						zmap.put(130, 1);
					}else{
						zmap.put(130, zmap.get(130) + 1);
					}
				}
				if(chengjiObj.getChengji() > 130){
					if(zmap.get(131) == null || zmap.get(131) == 0){
						zmap.put(131, 1);
					}else{
						zmap.put(131, zmap.get(131) + 1);
					}
				}				
			}
		}
		
			DataModel da1 = new DataModel();
			da1.setCount(zmap.get(90));
			da1.setNeirong("低血压");
			
			DataModel da2 = new DataModel();
			da2.setCount(zmap.get(130));
			da2.setNeirong("正常血压");
			
			DataModel da3 = new DataModel();
			da3.setCount(zmap.get(131));
			da3.setNeirong("高血压");
			dataList.add(da1);
			dataList.add(da2);
			dataList.add(da3);
		request.setAttribute("dataList", dataList);
		request.setAttribute("zhutuname", "区域血压柱状图");
		return ActionSupport.SUCCESS;
	}
	
	public String data_zhutu_xuetang()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		List chengjiList = chengjiDao.findAllByUserId(stuId);
		//数据列表
		List<DataModel> dataList = new ArrayList<DataModel>();
		Map<Integer,Integer> zmap = new HashMap<Integer,Integer>();
		for (Object obj : chengjiList) {
			TChengji chengjiObj = (TChengji) obj;
			if("xuetang".equals(chengjiObj.getKecheng())){
				if(chengjiObj.getChengji() <= 4){
					if(zmap.get(4) == null || zmap.get(4) == 0){
						zmap.put(4, 1);
					}else{
						zmap.put(4, zmap.get(4) + 1);
					}
				}
				if(chengjiObj.getChengji() > 4 && chengjiObj.getChengji() <= 6){
					if(zmap.get(6) == null || zmap.get(6) == 0){
						zmap.put(6, 1);
					}else{
						zmap.put(6, zmap.get(6) + 1);
					}
				}
				if(chengjiObj.getChengji() > 6){
					if(zmap.get(7) == null || zmap.get(7) == 0){
						zmap.put(7, 1);
					}else{
						zmap.put(7, zmap.get(7) + 1);
					}
				}				
			}
		}
		
			DataModel da1 = new DataModel();
			da1.setCount(zmap.get(4));
			da1.setNeirong("低血糖");
			
			DataModel da2 = new DataModel();
			da2.setCount(zmap.get(6));
			da2.setNeirong("正常血糖");
			
			DataModel da3 = new DataModel();
			da3.setCount(zmap.get(7));
			da3.setNeirong("高血糖");
			dataList.add(da1);
			dataList.add(da2);
			dataList.add(da3);
		request.setAttribute("zhutuname", "个人血糖柱状图");
		request.setAttribute("dataList", dataList);
		return ActionSupport.SUCCESS;
	}
	
	public String data_zhutu_xuetang1()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		List chengjiList = chengjiDao.findAll();
		//数据列表
		List<DataModel> dataList = new ArrayList<DataModel>();
		Map<Integer,Integer> zmap = new HashMap<Integer,Integer>();
		for (Object obj : chengjiList) {
			TChengji chengjiObj = (TChengji) obj;
			if("xuetang".equals(chengjiObj.getKecheng())){
				if(chengjiObj.getChengji() <= 4){
					if(zmap.get(4) == null || zmap.get(4) == 0){
						zmap.put(4, 1);
					}else{
						zmap.put(4, zmap.get(4) + 1);
					}
				}
				if(chengjiObj.getChengji() > 4 && chengjiObj.getChengji() <= 6){
					if(zmap.get(6) == null || zmap.get(6) == 0){
						zmap.put(6, 1);
					}else{
						zmap.put(6, zmap.get(6) + 1);
					}
				}
				if(chengjiObj.getChengji() > 6){
					if(zmap.get(7) == null || zmap.get(7) == 0){
						zmap.put(7, 1);
					}else{
						zmap.put(7, zmap.get(7) + 1);
					}
				}				
			}
		}
		
			DataModel da1 = new DataModel();
			da1.setCount(zmap.get(4));
			da1.setNeirong("低血糖");
			
			DataModel da2 = new DataModel();
			da2.setCount(zmap.get(6));
			da2.setNeirong("正常血糖");
			
			DataModel da3 = new DataModel();
			da3.setCount(zmap.get(7));
			da3.setNeirong("高血糖");
			dataList.add(da1);
			dataList.add(da2);
			dataList.add(da3);
		request.setAttribute("zhutuname", "区域血糖柱状图");
		request.setAttribute("dataList", dataList);
		return ActionSupport.SUCCESS;
	}
	
	public String chengjiAdd() {
		TChengji chengjiObj = new TChengji();
		chengjiObj.setStuId(stuId);
		chengjiObj.setKecheng(kecheng);
		chengjiObj.setChengji(chengji);
		chengjiObj.setStuName(stuName);
		chengjiObj.setDel("no");

		chengjiDao.save(chengjiObj);
		this.setMessage("添加成功");
		this.setPath("chengjiMana.action");
		return "succeed";
		
		
	}

/*public String chengjiMana() {
		List chengjiList = chengjiDao.findAll();
		float allStuCount = chengjiList.size();
		float bujige = 0.0f;
		float baifenlv = 0.0f;
		for (Object obj : chengjiList) {
			TChengji chengjiObj = (TChengji) obj;
			chengjiObj.setStuName(userDao.findById(chengjiObj.getStuId())
					.getName1());
			if (chengjiObj.getChengji() < 60) {
				bujige++;
			}
		}
		if (bujige != 0 && allStuCount != 0) {
			baifenlv = 1 - (bujige / allStuCount);
		}
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("chengjiList", chengjiList);
		request.put("baifenlv", baifenlv);
		return ActionSupport.SUCCESS;
	}
*/
	public String chengjiMana() {
		List chengjiList = chengjiDao.findAll();
		
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("chengjiList", chengjiList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String chengjiMana1() {
		List chengjiList = chengjiDao.findAllByUserId(stuId);
		for (Object obj : chengjiList) {
			TChengji chengjiObj = (TChengji) obj;
			chengjiObj.setStuName(userDao.findById(chengjiObj.getStuId())
					.getName1());
		}
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("chengjiList", chengjiList);
		return ActionSupport.SUCCESS;
	}
	
	public String chengjiSearch() {

		String sql2 = "from TStu where del='no' ";
		if (!StringUtils.isEmpty(shenfenzheng)) {
			sql2 += " and shenfenzheng = '" + shenfenzheng + "'";
		}
		if (!StringUtils.isEmpty(zhunkaozheng)) {
			sql2 += " and zhunkaozheng = '" + zhunkaozheng + "'";
		}
		if (!StringUtils.isEmpty(xibie)) {
			sql2 += " and xibie = '" + xibie + "'";
		}
		if (!StringUtils.isEmpty(nianji)) {
			sql2 += " and nianji = '" + nianji + "'";
		}
		if (!StringUtils.isEmpty(xuehao)) {
			sql2 += " and xuehao = '" + xuehao + "'";
		}
		if (!StringUtils.isEmpty(name1)) {
			sql2 += " and name1 = '" + name1 + "'";
		}

		List stuList = chengjiDao.getHibernateTemplate().find(sql2);
		String ids = "";
		for (Object obj : stuList) {
			TUser stuObj = (TUser) obj;
			ids += stuObj.getId() + ",";
		}
		ids = StringUtils.trimString(ids);

		String sql = "from TChengji where del='no' and stuId in (" + ids + ")";
		List chengjiList = chengjiDao.getHibernateTemplate().find(sql);

		float allStuCount = chengjiList.size();
		float bujige = 0.0f;
		float baifenlv = 0.0f;
		for (Object obj : chengjiList) {
			TChengji chengjiObj = (TChengji) obj;
			chengjiObj.setStuName(userDao.findById(chengjiObj.getStuId())
					.getName1());
			if (chengjiObj.getChengji() < 60) {
				bujige++;
			}
		}
		if (bujige != 0 && allStuCount != 0) {
			baifenlv = 1 - (bujige / allStuCount);
		}
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("chengjiList", chengjiList);
		request.put("baifenlv", baifenlv);
		return ActionSupport.SUCCESS;
	}

	public String chengjiDel() {
		TChengji chengji = chengjiDao.findById(id);
		chengjiDao.delete(chengji);

		this.setMessage("删除成功");	
		this.setPath("chengjiMana.action");
		return "succeed";
	}

	public String chengjiEdit() {

		TChengji chengjiObj = chengjiDao.findById(id);

		chengjiObj.setStuId(stuId);
		chengjiObj.setKecheng(kecheng);
		chengjiObj.setChengji(chengji);
		chengjiObj.setStuName(stuName);
		chengjiObj.setDel("no");

		chengjiDao.merge(chengjiObj);

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("msg", "修改成功");
		return "msg";
	
		//this.setMessage("修改成功");
		//this.setPath("chengjiMana1.action?stuId=" + stuId);
		//return "succeed";

	}
	
	public String chengjiToEdit() {
		TChengji chengjiObj = chengjiDao.findById(id);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("chengji", chengjiObj);
		return ActionSupport.SUCCESS;
	}

	public Integer getId() {
		return id;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public String getKecheng() {
		return kecheng;
	}

	public void setKecheng(String kecheng) {
		this.kecheng = kecheng;
	}

	public Integer getChengji() {
		return chengji;
	}

	public void setChengji(Integer chengji) {
		this.chengji = chengji;
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

	public String getXuehao() {
		return xuehao;
	}

	public void setXuehao(String xuehao) {
		this.xuehao = xuehao;
	}

	public String getName1() {
		return name1;
	}

	public void setName1(String name1) {
		this.name1 = name1;
	}

}
