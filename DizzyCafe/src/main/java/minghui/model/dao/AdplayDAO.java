package minghui.model.dao;

import java.util.Collection;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import minghui.model.AdplayBean;

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
	
	public AdplayBean select_by_id(int id) {
		return this.getSession().get(AdplayBean.class, id);
	}
	
	private static final String SELECT = "select a.id, b.activityName, b.activityPicture from adPlay as a "
			+ "join ActivityList as b on a.id = b.activityNo";
	public List<Object[]> select(){
		return this.getSession().createNativeQuery(SELECT).getResultList();
	}
	
	public void delete_all() {
		Query query = this.getSession().createQuery("delete from AdplayBean");
		//System.out.println(query.executeUpdate());
		
	}
	
	public void insert(AdplayBean bean) {
		this.getSession().save(bean);
	}
}
