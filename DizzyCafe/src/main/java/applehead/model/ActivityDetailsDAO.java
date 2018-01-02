package applehead.model;

import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class ActivityDetailsDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public ActivityDetailsBean selectById(int id) {
		return this.getSession().get(ActivityDetailsBean.class, id);
	}
	public int update(ActivityDetailsBean bean) {
		int update = 0;
//		try {
//			update = this.getSession().get(ActivityDetailsBean.class, bean.getAdNumber());
//			update.setActivityDiscount(bean.getActivityDiscount());
//			update.setMerchandiseTag(bean.getMerchandiseTag());
//		} catch (Exception e) {
//			e.printStackTrace();
//			return update;
//		}
		Query query = this.getSession().createQuery("update ActivityDetailsBean set merchandiseTag= :merchandiseTag,"
				+ "activityDiscount= :activityDiscount,"
				+ "activityNo= :activityNo where ADnumber= :ADnumber");
		query.setParameter("merchandiseTag", bean.getMerchandiseTag());
		query.setParameter("activityDiscount", bean.getActivityDiscount());
		query.setParameter("activityNo", bean.getActivityNo());
		query.setParameter("ADnumber", bean.getAdNumber());
		update = query.executeUpdate();
		return update;
	}
	public ActivityDetailsBean insert(ActivityDetailsBean bean) {
		 Serializable pk = this.getSession().save(bean);
		return this.getSession().get(ActivityDetailsBean.class, pk);
	}
}
