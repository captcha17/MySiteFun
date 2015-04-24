package by.rakushev.dal;

import java.io.Serializable;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.context.spi.CurrentSessionContext;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import by.rakushev.exception.DalException;


@Repository
@Transactional
public class CrudDaoBean implements CrudDao {
	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * Default constructor
	 */
	public CrudDaoBean() {
	}

	@SuppressWarnings("unchecked")
	public <T> T merge(T t) throws DalException {
		try {
			return (T) currentSession().merge(t);
		} catch (HibernateException e) {
			throw new DalException(e);
		}

	}
	
	@SuppressWarnings("unchecked")
	public <T> void saveOrUpdate(T t) throws DalException {
		try {
			 currentSession().saveOrUpdate(t);
		} catch (HibernateException e) {
			throw new DalException(e);
		}

	}

	@SuppressWarnings("unchecked")
	public <T, PK extends Serializable> T find(Class<T> type, PK id)
			throws DalException {
		try {			
			return (T) currentSession().get(type, id);
		} catch (HibernateException e) {
			throw new DalException(e);
		}
	}

	public <T, PK extends Serializable> void delete(Class<T> type, PK id)
			throws DalException {
		try {
			Session currentSession = currentSession();
			Object object = currentSession.get(type, id);
			currentSession.delete(object);
		} catch (HibernateException e) {
			throw new DalException(e);
		}

	}

	@SuppressWarnings({ "unchecked" })
	public <T> List<T> list(Class<T> type) throws DalException {
		try {
			return currentSession().createCriteria(type).list();			
		} catch (HibernateException e) {
			throw new DalException(e);
		}
	}
	
	@SuppressWarnings({ "unchecked" })
	public <T> List<T> list(Class<T> type, String str) throws DalException {
		try {
			return currentSession().createCriteria(type).add(Restrictions.disjunction()
					.add(Restrictions.like("name", "%"+str+"%").ignoreCase())
					.add(Restrictions.like("brief", "%"+str+"%").ignoreCase())
					.add(Restrictions.like("description", "%"+str+"%").ignoreCase())).list();			
		} catch (HibernateException e) {
			throw new DalException(e);
		}
	}
	
	@SuppressWarnings({ "unchecked" })
	public <T> List<T> getGroup(Class<T> type, String prop) throws DalException {
		try {
			return currentSession().createCriteria(type).add(Restrictions.eq("category", prop)).list();			
		} catch (HibernateException e) {
			throw new DalException(e);
		}
	}
	
	@SuppressWarnings({ "unchecked" })
	public <T> List<T> getGroup(Class<T> type, Long prop) throws DalException {
		try {
			return currentSession().createCriteria(type).add(Restrictions.eq("news", prop)).list();			
		} catch (HibernateException e) {
			throw new DalException(e);
		}
	}
	
	@SuppressWarnings({ "unchecked" })
	public <T> T getProfile(Class<T> type, String prop) throws DalException {
		try {
			return (T) currentSession().createCriteria(type).add(Restrictions.eq("login", prop)).uniqueResult();			
		} catch (HibernateException e) {
			throw new DalException(e);
		}
	}
	
	@SuppressWarnings({ "unchecked" })
	public <T> T check(Class<T> type, Long id) throws DalException {
		try {
			
			return (T) currentSession().createCriteria(type).add(Restrictions.idEq(id)).uniqueResult();			
		} catch (HibernateException e) {
			throw new DalException(e);
		}
	}

	private Session currentSession() {
		Session currentSession = sessionFactory.getCurrentSession();		
		//Session currentSession = sessionFactory.openSession();
		return currentSession;
	}
}