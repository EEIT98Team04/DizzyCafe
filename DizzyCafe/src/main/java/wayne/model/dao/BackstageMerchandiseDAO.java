package wayne.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import wayne.model.MerchandiseBean;

@Repository
public class BackstageMerchandiseDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getsession() {
		return sessionFactory.getCurrentSession();
	}
	
	public List<MerchandiseBean> selectAll() {
		List<MerchandiseBean> result = null;
		Query<MerchandiseBean> query = this.getsession().createQuery("FROM MerchandiseBean", MerchandiseBean.class);
		result = query.getResultList();
		return result;
	}
}
