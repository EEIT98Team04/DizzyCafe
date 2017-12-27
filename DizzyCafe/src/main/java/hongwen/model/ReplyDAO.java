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
public class ReplyDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public List<ReplyBean> select(int documentId) {
		String search = "from ReplyBean where documentId = '"+documentId+"'";
		Query<ReplyBean> query = this.getSession().createQuery(search, ReplyBean.class);
		List<ReplyBean> result = query.getResultList();
		return result;
	}
	//前台會員瀏覽私人文章
	public List<ReplyBean> select(String membername) {
		String search = "from ReplyBean where membername = '"+membername+"'";
		Query<ReplyBean> query = this.getSession().createQuery(search, ReplyBean.class);
		List<ReplyBean> result = query.getResultList();
		return result;
	}
	
	public boolean insert(ReplyBean bean) {
		try {
			this.getSession().save(bean);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public ReplyBean get(int id) {
		ReplyBean get = null;
		try {
			get = this.getSession().get(ReplyBean.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return get;
	}
	
	public boolean update(ReplyBean bean) {
		try {
			this.getSession().update(bean);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}