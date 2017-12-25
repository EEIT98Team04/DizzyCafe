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
public class CouponDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public CouponBean select(int couponId) {
		CouponBean select = null;
		select = this.getSession().get(CouponBean.class, couponId);
		return select;
	}

	public List<CouponBean> select() {
		List<CouponBean> result = null;
		Query<CouponBean> query = this.getSession().createQuery("from CouponBean", CouponBean.class);
		result = query.getResultList();
		return result;
	}
	
	public List<CouponBean> selectFromMemberId(int memberId) {
		List<CouponBean> result = null;
		Query<CouponBean> query = this.getSession().createQuery("from CouponBean where memberId = " + memberId, CouponBean.class);
		result = query.getResultList();
		return result;
	}
	
	public List<Object[]> selectFromMemberIdObject(int memberId) {
		List<Object[]> result = null;
		Query<Object[]> query = this.getSession().createNativeQuery(
				"select c.eventDiscount,c.couponDeadline,c.couponStatus,m.merchandiseName "
				+ "from coupon c join merchandise m "
				+ "on c.merchandiseId = m.merchandiseId "
				+ "where c.memberId = ?");
		query.setParameter(1, memberId);
		result = query.getResultList();
		return result;
	}
	
	
	public CouponBean updateCouponStatus(int CouponStatus,int couponId) {
		CouponBean update = null;
		try {
			update = this.getSession().get(CouponBean.class,couponId);
			update.setCouponStatus(CouponStatus);
		} catch (Exception e) {
			e.printStackTrace();
			return update;
		}
		return update;
	}
	
	public boolean insert(CouponBean bean) {
		try {
			this.getSession().save(bean);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
