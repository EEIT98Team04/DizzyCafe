package applehead.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
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
	public boolean update(DailyEventBean bean) {
		DailyEventBean update = null;
		try {
			update = this.getSession().get(DailyEventBean.class, bean.getEventId());
			if(update!=null) {
				update.setProbability(bean.getProbability());
				update.setMerchandiseId(bean.getMerchandiseId());
				update.setDiscount(bean.getDiscount());
				return true;			
			}
		} catch (Exception e) {
			return false;
		}
		return false;
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
