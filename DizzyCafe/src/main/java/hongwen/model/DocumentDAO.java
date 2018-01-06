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

	public List<DocumentBean> select(int id) {
		String search = "from DocumentBean where boardId = '" + id + "' and Dstatus = '1'";// Dstatus(0:disable,1:able)
		Query<DocumentBean> query = this.getSession().createQuery(search, DocumentBean.class);
		List<DocumentBean> result = query.getResultList();
		return result;
	}
	
	//前台會員瀏覽私人文章
	public List<DocumentBean> select(String membername) {
		String search = "from DocumentBean where membername = '" + membername + "' and Dstatus = '1'";
		Query<DocumentBean> query = this.getSession().createQuery(search, DocumentBean.class);
		List<DocumentBean> result = query.getResultList();
//		System.out.println(result.size());
		return result;
	}
	
	public DocumentBean get(int id) {
		DocumentBean get = null;
		try {
			String search = "from DocumentBean where documentId = '" + id + "' and Dstatus = '1'";
			Query<DocumentBean> query = this.getSession().createQuery(search, DocumentBean.class);
			List<DocumentBean> result = query.getResultList();
			get = result.get(0);
		} catch (IndexOutOfBoundsException e) {
			return null;
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
	
	public boolean update(DocumentBean bean) {
		try {
			this.getSession().update(bean);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	//更新人氣
	public boolean popularity(int id) {
		DocumentBean bean = this.getSession().get(DocumentBean.class, id);
		bean.setPopularity(bean.getPopularity()+1);
		return true;
	}
}