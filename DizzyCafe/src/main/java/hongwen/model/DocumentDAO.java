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

	public List<DocumentBean> selectboardId(int boardId) {
		String search = "from DocumentBean where boardId = '" + boardId + "' and Dstatus = '1'";// Dstatus(0:disable,1:able)
		Query<DocumentBean> query = this.getSession().createQuery(search, DocumentBean.class);
		List<DocumentBean> result = query.getResultList();
		return result;
	}

	public List<DocumentBean> selectdocumentId(int documentId) {
		String search = "from DocumentBean where documentId = '" + documentId + "'";// Dstatus(0:disable,1:able)
		Query<DocumentBean> query = this.getSession().createQuery(search, DocumentBean.class);
		List<DocumentBean> result = query.getResultList();
		return result;
	}

	// public List<BoardBean> selectFromMemberId(int memberId) {
	// List<BoardBean> result = null;
	// Query<BoardBean> query = this.getSession().createQuery("from BoardBean where
	// memberId = " + memberId, BoardBean.class);
	// result = query.getResultList();
	// return result;
	// }

	public DocumentBean get(int documentId) {
		DocumentBean get = null;
		try {
			get = this.getSession().get(DocumentBean.class, documentId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return get;
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