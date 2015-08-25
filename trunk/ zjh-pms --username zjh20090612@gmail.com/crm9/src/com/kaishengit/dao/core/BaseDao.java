package com.kaishengit.dao.core;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * DAO�̳���
 * @author Kay
 *
 * @param <T> ʵ����
 * @param <PK> ��������
 */
@SuppressWarnings("unchecked")
public class BaseDao<T,PK extends Serializable> {

	
	private SessionFactory sessionfactory;
	private Class<?> clazz;
	
	
	public BaseDao() {
		//���ݷ����ȡT��Class����
		Class<?> c = this.getClass();
		ParameterizedType pt = (ParameterizedType) c.getGenericSuperclass();
		Type[] types = pt.getActualTypeArguments();
		clazz = (Class<?>) types[0];
	}
	
	
	
	/**
	 * Springע��SessionFactory����
	 * @param sessionfactory
	 */
	@Autowired
	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}
	
	/**
	 * ��ȡHibernate�е�Session����
	 * @return
	 */
	public Session getSession() {
		return sessionfactory.getCurrentSession();
	}
	
	/**
	 * ��ӻ��޸Ķ���
	 * @param t
	 */
	public void save(T t) {
		getSession().saveOrUpdate(t);
	}
	
	/**
	 * ����������ȡ����
	 * @param id
	 * @return
	 */
	public T get(PK id) {
		return (T) getSession().get(clazz, id);
	}
	
	/**
	 * ��ȡȫ������
	 * @return
	 */
	public List<T> findAll() {
		Criteria c = getSession().createCriteria(clazz);
		return c.list();
	}
	
	/**
	 * ���ݷ�ҳ������ȡ����
	 * @param start ��ʼ����
	 * @param rows ÿҳ��ʾ������
	 * @return
	 */
	public List<T> findByPage(Integer start,Integer rows) {
		Criteria c = getSession().createCriteria(clazz);
		c.setFirstResult(start);
		c.setMaxResults(rows);
		return c.list();
	}
	
	
	/**
	 * ������������ֵ��ȡΨһ�Ķ���
	 * @param propertyName
	 * @param value
	 * @return
	 */
	public T findByUnique(String propertyName,String value) {
		Criteria c = getSession().createCriteria(clazz);
		c.add(Restrictions.eq(propertyName, value));
		return (T) c.uniqueResult();
	}
	
	/**
	 * ������������ֵ��ȡ���󼯺�
	 * @param propertyName
	 * @param value
	 * @return
	 */
	public List<T> findBy(String propertyName,String value) {
		Criteria c = getSession().createCriteria(clazz);
		c.add(Restrictions.eq(propertyName, value));
		return c.list();
	}
	
	/**
	 * ����HQL��ȡ���󼯺�
	 * @param hql
	 * @param args
	 * @return
	 */
	public List<T> find(String hql,Object...args) {
		return createQuery(hql, args).list();
	}
	
	/**
	 * ����HQL��ȡ���󼯺� HQLʹ�õ�������ռλ��
	 * @param hql
	 * @param map
	 * @return
	 */
	public List<T> find(String hql,Map<String,Object> map) {
		return createQuery(hql, map).list();
	}
	
	/**
	 * ����HQL��ȡΨһ����
	 * @param hql
	 * @param args
	 * @return
	 */
	public T findUnique(String hql,Object...args) {
		return (T) createQuery(hql, args).uniqueResult();
	}
	
	/**
	 * ����HQL��ȡΨһ���� HQLʹ�õ�������ռλ��
	 * @param hql
	 * @param map
	 * @return
	 */
	public T findUnique(String hql,Map<String,Object> map) {
		return (T) createQuery(hql, map).uniqueResult();
	}
	
	/**
	 * ����Criterion�б��ȡ���϶���
	 * @param criterions
	 * @return
	 */
	public List<T> find(Criterion... criterions) {
		return createCriteria(criterions).list();
	}
	
	/**
	 * ����Criterion�б��ȡΨһ����
	 * @param criterions
	 * @return
	 */
	public T findUnique(Criterion... criterions) {
		return (T) createCriteria(criterions).uniqueResult();
	}
	
	/**
	 * ����Where���ϻ�ȡ���󼯺�
	 * @param wheres
	 * @return
	 */
	public List<T> find(List<Where> wheres){
		return builderCriteriaByWhereList(wheres).list();
	}
	
	/**
	 * ����Where���ϻ�ȡΨһ����
	 * @param wheres
	 * @return
	 */
	public T findUnique(List<Where> wheres) {
		return (T) builderCriteriaByWhereList(wheres).uniqueResult();
	}
	
	/**
	 * ����Wheres���Ϲ���Criteria����(���߷���)
	 * @param wheres
	 * @return
	 */
	private Criteria builderCriteriaByWhereList(List<Where> wheres) {
		Criteria c = getSession().createCriteria(clazz);
		for(Where where : wheres) {
			//����������֮��ʹ��or�����в�ѯ д�����磺username_OR_loginname_OR_firstname
			if(where.getProperty().contains("_OR_")) {
				Criterion criterion = builderORCriterionByWhere(where);
				c.add(criterion);
			} else {
				Criterion criterion = builderCriterionByWhere(where);
				if(criterion != null) {
					c.add(criterion);
				}
			}
		}
		return c;
	}

	/**
	 * ����OR��ϵ����Criterion����(���߷���)
	 * @param where
	 * @return
	 */
	private Criterion builderORCriterionByWhere(Where where) {
		String[] propertyNames = where.getProperty().split("_OR_");
		
		//Disjunction������Խ����Criterion����ʹ��or��ϵ��������
		Disjunction disjunction = Restrictions.disjunction();
		for(String property : propertyNames) {
			Criterion criterion = builderCriterionByWhere(where.getMatchType(), property, where.getValue());
			disjunction.add(criterion);
		}
		return disjunction;
	}



	/**
	 * ����Where���󹹽�Criterion����(���߷���)
	 * @param where
	 * @return
	 */
	private Criterion builderCriterionByWhere(Where where) {
		if(where != null) {
			String matchType = where.getMatchType();
			String property = where.getProperty();
			String value = where.getValue();
			return builderCriterionByWhere(matchType, property, value);
		}
		return null;
	}


	/**
	 * ���ݱȽ����͡���������ֵ����Criterion����(���߷���)
	 * @param matchType �Ƚ����� ���Դ�MatchType�ӿ��л�ȡ
	 * @param property
	 * @param value
	 * @return
	 */
	public Criterion builderCriterionByWhere(String matchType, String property, String value) {
		if(MatchType.EQ.equalsIgnoreCase(matchType)) {
			return Restrictions.eq(property, value);
		} else if(MatchType.GE.equalsIgnoreCase(matchType)) {
			return Restrictions.ge(property, value);
		} else if(MatchType.GT.equalsIgnoreCase(matchType)) {
			return Restrictions.gt(property, value);
		} else if(MatchType.LE.equalsIgnoreCase(matchType)) {
			return Restrictions.le(property, value);
		} else if(MatchType.LT.equalsIgnoreCase(matchType)) {
			return Restrictions.lt(property, value);
		} else if(MatchType.LIKE.equalsIgnoreCase(matchType)) {
			return Restrictions.like(property, value, MatchMode.ANYWHERE);
		}
		return null;
	}



	/**
	 * ����Criterion�б���Criteria����(���߷���)
	 * @param criterions
	 * @return
	 */
	public Criteria createCriteria(Criterion... criterions) {
		Criteria c = getSession().createCriteria(clazz);
		for(Criterion cri : criterions) {
			c.add(cri);
		}
		return c;
	}
	
	/**
	 * ����HQL����������Query����(���߷���)
	 * @param hql
	 * @param args
	 * @return
	 */
	public Query createQuery(String hql,Object...args) {
		Query query = getSession().createQuery(hql);
		for (int i = 0; i < args.length; i++) {
			query.setParameter(i, args[i]);
		}
		return query;
	}
	
	/**
	 * ����HQL����������Query����(���߷���)
	 * @param hql
	 * @param map
	 * @return
	 */
	public Query createQuery(String hql,Map<String,Object> map) {
		Query query = getSession().createQuery(hql);
		query.setProperties(map);
		return query;
	}
	
	
	
}
