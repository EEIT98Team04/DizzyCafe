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
public class BoardDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public List<BoardBean> select() {
		List<BoardBean> result = null;
		Query<BoardBean> query = this.getSession().createQuery("from BoardBean", BoardBean.class);
		result = query.getResultList();
		return result;
	}

	public boolean popularity(int id) {
		BoardBean bean = this.getSession().get(BoardBean.class, id);
		bean.setPopularity(bean.getPopularity()+1);
		this.getSession().save(bean);
		return true;
	}

}