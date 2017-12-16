package hongwen.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class DocumentDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	// public BoardBean select(int boardId) {
	// BoardBean bean = this.getSession().get(BoardBean.class, boardId);
	// return bean;
	// }

	public List<DocumentBean> select(int boardId) {
		String search = "from DocumentBean";
		Query<DocumentBean> query = this.getSession().createQuery("from DocumentBean", DocumentBean.class);
		System.out.println("---");
		List<DocumentBean> result = query.getResultList();
		System.out.println(result);
		return result;
	}

	// public List<BoardBean> selectFromMemberId(int memberId) {
	// List<BoardBean> result = null;
	// Query<BoardBean> query = this.getSession().createQuery("from BoardBean where
	// memberId = " + memberId, BoardBean.class);
	// result = query.getResultList();
	// return result;
	// }

	// public BoardBean updateCouponStatus(int CouponStatus,int couponId) {
	// BoardBean update = null;
	// try {
	// update = this.getSession().get(BoardBean.class,couponId);
	// update.setCouponStatus(CouponStatus);
	// } catch (Exception e) {
	// e.printStackTrace();
	// return update;
	// }
	// return update;
	// }

	// public boolean insert(BoardBean bean) {
	// try {
	// this.getSession().save(bean);
	// return true;
	// } catch (Exception e) {
	// e.printStackTrace();
	// return false;
	// }
	// }
}