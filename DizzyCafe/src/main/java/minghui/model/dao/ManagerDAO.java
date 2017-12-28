package minghui.model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import minghui.model.ManagerBean;

@Repository
public class ManagerDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	private static final String SELECT_BY_ACCOUNT = "from ManagerBean where managerAccount = :managerAccount";
	public ManagerBean select(String managerAccount) {
		Query query = this.getSession().createQuery(SELECT_BY_ACCOUNT);
		query.setParameter("managerAccount", managerAccount);
		return (ManagerBean)query.uniqueResult();
	}
}
