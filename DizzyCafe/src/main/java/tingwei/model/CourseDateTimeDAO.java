package tingwei.model;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class CourseDateTimeDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public CourseDateTimeDAO(SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
	}
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
		
	
	
	public CourseDateTimeBean insert(CourseDateTimeBean bean) {
		if(bean!=null) {
			this.getSession().save(bean);
		}
		return null;
	}
	
	public CourseDateTimeBean select(int id) {
		return this.getSession().get(CourseDateTimeBean.class, id);
	}
	
	
	public List<CourseDateTimeBean> select(){
		Query<CourseDateTimeBean> select = this.getSession().createQuery("FROM CourseDateTimeBean",CourseDateTimeBean.class);
		return select.getResultList();
	}
	
}
