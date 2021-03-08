package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.Jiangli;


public class JiangliDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(JiangliDAO.class);
	public void save(Jiangli transientInstance){
        try {
			getHibernateTemplate().save(transientInstance);
			log.debug("JiangliDaoImpl save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public void delete(Jiangli persistentInstance){
		log.debug("deleting Jiangli instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("Jiangli delete successful");
		} catch (RuntimeException re) {
			log.error("Jiangli delete failed", re);
			throw re;
		}
    }
    
	public Jiangli findById(java.lang.Integer id){
        log.debug("getting Jiangli instance with id: " + id);
		try {
			Jiangli instance = (Jiangli) getHibernateTemplate().get(
					"com.model.Jiangli", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("Jiangli get failed", re);
			throw re;
		}
	}
	public List findByExample(Jiangli instance){
		log.debug("finding Jiangli instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
	
	public List findByProperty(String propertyName, Object value){
		log.debug("finding Jiangli instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Jiangli as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List findAll(){
		log.debug("finding all Jiangli instances");
		try {
			String queryString = "from Jiangli";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	
	public List findAllByUserId(Integer userId){
		log.debug("finding all Jiangli instances");
		try {
			String queryString = "from Jiangli where stuId = " + userId;
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public Jiangli merge(Jiangli detachedInstance){
		log.debug("merging Jiangli instance");
		try {
			Jiangli result = (Jiangli) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}
	
	public void attachDirty(Jiangli instance){
		log.debug("attaching dirty Jiangli instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	
	public void attachClean(Jiangli instance){
		log.debug("attaching clean Jiangli instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	
	}
}
