package applehead.model;

import java.io.Serializable;
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
public class ActivityListDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public ActivityListBean select(int activityNo) {
		ActivityListBean select = null;
		select = this.getSession().get(ActivityListBean.class, activityNo);
		return select;
	}

	public List<ActivityListBean> selectList() {
		List<ActivityListBean> result = null;
		Query<ActivityListBean> query = this.getSession().createQuery("from ActivityListBean order by activityNo desc", ActivityListBean.class);
		result = query.getResultList();
		return result;
	}
	public List<Object[]> selectJoin(){
		List<Object[]> result = null;
		Query<Object[]> query = this.getSession().createNativeQuery("  select al.activityNo,al.activityName,al.activityStart,al.activityEnd,al.activityContent,"
				+ "al.activityPicture,ad.ADnumber,ad.merchandiseTag,ad.activityDiscount from ActivityList al join ActivityDetails ad "
				+ "on al.activityNo = ad.activityNo");
		result = query.getResultList();	
		return result;
	}
	public Query<ActivityListBean> selectQuery() {
		Query<ActivityListBean> query = null;
		query = this.getSession().createQuery("from ActivityListBean", ActivityListBean.class);
		return query;
	}

	public int update(ActivityListBean bean) {
		int update = 0;
//		try {
//			update = this.getSession().get(ActivityListBean.class, bean.getActivityNo());
//			update.setActivityName(bean.getActivityName());
//			update.setActivityStart(bean.getActivityStart());
//			update.setActivityEnd(bean.getActivityEnd());
//			update.setActivityContent(bean.getActivityContent());
//			update.setActivityPicture(bean.getActivityPicture());
//		} catch (Exception e) {
//			e.printStackTrace();
//			return update;
//		}
		Query query = this.getSession().createQuery("update ActivityListBean set activityName= :activityName,"
				+ "activityStart= :activityStart,activityEnd= :activityEnd,activityContent= :activityContent,"
				+ "activityPicture= :activityPicture where activityNo= :activityNo");
		query.setParameter("activityName", bean.getActivityName());
		query.setParameter("activityStart", bean.getActivityStart());
		query.setParameter("activityEnd", bean.getActivityEnd());
		query.setParameter("activityContent", bean.getActivityContent());
		query.setParameter("activityPicture", bean.getActivityPicture());
		query.setParameter("activityNo", bean.getActivityNo());
		update = query.executeUpdate();
		return update;
	}

	public ActivityListBean insert(ActivityListBean bean) {
		ActivityListBean insert = null;
		try {
			Serializable pk = this.getSession().save(bean);
			insert = this.getSession().get(ActivityListBean.class, pk);
		} catch (Exception e) {
			e.printStackTrace();
			return insert;
		}
		return insert;
	}
	
	public int itemsCount() {
		int count = 0;
		Query<Long> query = this.getSession().createQuery("select count(*) from ActivityListBean",java.lang.Long.class);
		count = query.getResultList().get(0).intValue();
		return count;
	}
	
	public List<Object[]> selectWithTime(java.sql.Date date){
		List<Object[]> result = null;
		Query<Object[]> query = this.getSession().createNativeQuery("select ad.activityDiscount,ad.merchandiseTag from ActivityList al join "
				+ "ActivityDetails ad on al.activityNo = ad.activityNo "
				+ "where :hoho > al.activityStart and :hihi < al.activityEnd");
		query.setParameter("hoho", date);
		query.setParameter("hihi", date);
		result = query.getResultList();
		return result;
	}
	
}
