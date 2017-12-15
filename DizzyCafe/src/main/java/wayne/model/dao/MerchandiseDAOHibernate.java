package wayne.model.dao;

import java.sql.Blob;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tingwei.model.CourseBean;
import wayne.model.MerchandiseBean;

@Repository
public class MerchandiseDAOHibernate {

	@Autowired
	private SessionFactory sessionFactory;

	public Session getsession() {
		return sessionFactory.getCurrentSession();
	}

	
	public List<MerchandiseBean> selectPageNow(int pageNow, int rows_perPage) {
		int base = 1;
		Query<MerchandiseBean> select = this.getsession().createQuery("FROM MerchandiseBean WHERE merchandiseId >="
				+ (base + (pageNow - 1) * rows_perPage) + " AND merchandiseId <" + (base + pageNow * rows_perPage),
				MerchandiseBean.class);
		return select.getResultList();
	}
	
	
	public int countTotalPage(int row_perPage) {
		Long temp = (long) this.getsession().createQuery("Select COUNT(*) FROM MerchandiseBean").uniqueResult();
		if (temp.intValue() % row_perPage == 0) {
			return temp.intValue() / row_perPage;
		}else {
			return temp.intValue() / row_perPage + 1;
		}
	}
	
	
	
	public MerchandiseBean select(int merchandiseId) {
		return this.getsession().get(MerchandiseBean.class, merchandiseId);
	}
	
	
	public List<MerchandiseBean> select() {
		Query<MerchandiseBean> query = this.getsession().createQuery("FROM MerchandiseBean", MerchandiseBean.class);
		return query.getResultList();
	}
	
	public MerchandiseBean select(String merchandiseTag) {
		return this.getsession().get(MerchandiseBean.class, merchandiseTag);
	}
	
	public MerchandiseBean insert(MerchandiseBean bean) {
		if (bean != null) {
			MerchandiseBean select = this.select(bean.getMerchandiseId());
			if (select == null) {
				this.getsession().save(bean);
				return bean;
			}
		}
		return null;
	}
	public MerchandiseBean update(String merchandiseName, String merchandiseContent, Blob merchandisePicture,
			String merchandiseTag, int merchandisePrice, int merchandiseQuantity, String merchandiseStatus,
			int merchandiseId) {
		MerchandiseBean select = this.select(merchandiseId);
		if (select != null) {
			select.setMerchandiseContent(merchandiseContent);
			select.setMerchandiseName(merchandiseName);
			select.setMerchandisePicture(merchandisePicture);
			select.setMerchandisePrice(merchandisePrice);
			select.setMerchandiseQuantity(merchandiseQuantity);
			select.setMerchandiseStatus(merchandiseStatus);
			select.setMerchandiseTag(merchandiseTag);
		}
		return null;
	}
	public boolean delete(int merchandiseId) {
		MerchandiseBean select = this.select(merchandiseId);
		if (select != null) {
			this.getsession().delete(select);
			return true;
		}
		return false;
	}
	

}
