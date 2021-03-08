package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.Family;


public class FamilyDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(FamilyDAO.class);
	public void save(Family transientInstance){
        try {
			getHibernateTemplate().save(transientInstance);
			log.debug("FamilyDaoImpl save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public void delete(Family persistentInstance){
		log.debug("deleting Family instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("Family delete successful");
		} catch (RuntimeException re) {
			log.error("Family delete failed", re);
			throw re;
		}
    }
    
	public Family findById(java.lang.Integer id){
        log.debug("getting Family instance with id: " + id);
		try {
			Family instance = (Family) getHibernateTemplate().get(
					"com.model.Family", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("Family get failed", re);
			throw re;
		}
	}
	public List findByExample(Family instance){
		log.debug("finding Family instance by example");
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
		log.debug("finding Family instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Family as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List findAll(){
		log.debug("finding all Family instances");
		try {
			String queryString = "from Family";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public Family merge(Family detachedInstance){
		log.debug("merging Family instance");
		try {
			Family result = (Family) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}
	
	public void attachDirty(Family instance){
		log.debug("attaching dirty Family instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	
	public void attachClean(Family instance){
		log.debug("attaching clean Family instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	
	}
}
