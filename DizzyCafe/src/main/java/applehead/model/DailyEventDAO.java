package applehead.model;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class DailyEventDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public List<DailyEventBean> selectList(){
		List<DailyEventBean> result = null;
		try {
			Query<DailyEventBean> query = this.getSession().createQuery("from DailyEventBean",DailyEventBean.class);
			result = query.getResultList();
		} catch (Exception e) {
			return result;
		}
		return result;
	}
	
//	@Transactional(propagation=Propagation.REQUIRES_NEW)
	public int update(DailyEventBean bean) {
//		DailyEventBean update = null;
		int result = 0;
		try {
//			Serializable temp = bean.getEventId();
//			update = this.getSession().get(DailyEventBean.class, temp);
//			if(update!=null) {
//				update.setProbability(bean.getProbability());
//				update.setMerchandiseId(bean.getMerchandiseId());
//				update.setDiscount(bean.getDiscount());
//				this.getSession().flush();
//				this.getSession().clear();
//				return true;			
//			}
			Query query = this.getSession().createQuery("update DailyEventBean set merchandiseId= :merchandiseId "
					+ ",discount= :discount where eventId= :eventId");
			query.setParameter("merchandiseId", bean.getMerchandiseId());
			query.setParameter("discount", bean.getDiscount());
			query.setParameter("eventId", bean.getEventId());
			result = query.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
	}
	public List<Object[]> selectJoinMerchandise(){
		List<Object[]> result = null;
		try {
			Query<Object[]> query = this.getSession().createNativeQuery(
					"  select de.probability,de.discount,m.merchandiseName,m.merchandisePicture,de.merchandiseId" + 
					"  from dailyevent de join merchandise m" + 
					"  on de.merchandiseId=m.merchandiseId");
			result = query.getResultList();
		} catch (Exception e) {
			return result;
		}
		return result;
	}
}
