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

	public List<DocumentBean> selectboardId(int id) {
		String search = "from DocumentBean where boardId = '" + id + "' and Dstatus = '1'";// Dstatus(0:disable,1:able)
		Query<DocumentBean> query = this.getSession().createQuery(search, DocumentBean.class);
		List<DocumentBean> result = query.getResultList();
		return result;
	}

	public List<DocumentBean> selectdocumentId(int id) {
		String search = "from DocumentBean where documentId = '" + id + "'";// Dstatus(0:disable,1:able)
		Query<DocumentBean> query = this.getSession().createQuery(search, DocumentBean.class);
		List<DocumentBean> result = query.getResultList();
		return result;
	}

	public DocumentBean get(int id) {
		DocumentBean get = null;
		try {
			get = this.getSession().get(DocumentBean.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return get;
	}

	public boolean insert(DocumentBean bean) {
		try {
			this.getSession().save(bean);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

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