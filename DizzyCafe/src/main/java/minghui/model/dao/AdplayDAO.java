package minghui.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdplayDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	private static final String SELECT = "select a.id, b.activityName, a.name, b.activityPicture from adPlay as a "
			+ "join ActivityList as b on a.id = b.activityNo";
	public List<Object[]> select(){
		return this.getSession().createNativeQuery(SELECT).getResultList();
	}
}
