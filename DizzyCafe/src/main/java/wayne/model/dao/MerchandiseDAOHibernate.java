package wayne.model.dao;

import java.sql.Blob;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import wayne.model.MerchandiseBean;
import wayne.model.MerchandiseDAO;

@Repository
public class MerchandiseDAOHibernate implements MerchandiseDAO {

	static String file = "C:\\DizzyCafe\\coffee1.jpg";
	@Autowired
	private SessionFactory sessionFactory;

	public Session getsession() {
		return sessionFactory.getCurrentSession();
	}

	
	@Override
	public MerchandiseBean select(int merchandiseId) {
		return this.getsession().get(MerchandiseBean.class, merchandiseId);
	}
	@Override
	public List<MerchandiseBean> select() {
		Query<MerchandiseBean> query = this.getsession().createQuery("FROM MerchandiseBean", MerchandiseBean.class);
		return query.getResultList();
	}
	@Override
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
	@Override
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
	@Override
	public boolean delete(int merchandiseId) {
		MerchandiseBean select = this.select(merchandiseId);
		if (select != null) {
			this.getsession().delete(select);
			return true;
		}
		return false;
	}

}
