package wayne.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
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

	public JSONArray selectPageNowTag(int pageNow, int rows_perPage, String tag) {
		JSONArray result = new JSONArray();
		int base = 1;
		Query<Object[]> select = this.getsession().createNativeQuery(
				"select * from (select ROW_NUMBER() OVER(ORDER BY merchandiseId ASC) AS row_num,* "
				+ "from merchandise where merchandiseTag = :merchandiseTag) as newTable where row_num >= " +
						(base + (pageNow - 1) * rows_perPage)+" and row_num < " +
						(base + pageNow * rows_perPage));
		select.setParameter("merchandiseTag", tag);
		List<Object[]> list = select.getResultList();
		
		for(Object[] var: list) {
			JSONObject jsonobject = new JSONObject();
			jsonobject.put("row_num", var[0]);
			jsonobject.put("merchandiseId", var[1]);
			jsonobject.put("merchandiseName", var[2]);
			jsonobject.put("merchandiseContent", var[3]);
			jsonobject.put("merchandisePicture", var[4]);
			jsonobject.put("merchandiseTag", var[5]);
			jsonobject.put("merchandisePrice", var[6]);
			jsonobject.put("merchandiseQuantity", var[7]);
			jsonobject.put("merchandiseStatus", var[8]);
			result.add(jsonobject);
		}
		return result;
	}

	public int countTotalPage(int row_perPage) {
		Long temp = (long) this.getsession().createQuery("Select COUNT(*) FROM MerchandiseBean").uniqueResult();
		if (temp.intValue() % row_perPage == 0) {
			return temp.intValue() / row_perPage;
		} else {
			return temp.intValue() / row_perPage + 1;
		}
	}

	public int countTotalPage(int row_perPage, String tag) {
		Long temp = (long) this.getsession()
				.createQuery("Select COUNT(*) FROM MerchandiseBean where merchandiseTag = :merchandiseTag")
				.uniqueResult();
		if (temp.intValue() % row_perPage == 0) {
			return temp.intValue() / row_perPage;
		} else {
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

	public List<MerchandiseBean> select(String merchandiseTag) {
		Query<MerchandiseBean> query = this.getsession()
				.createQuery("FROM MerchandiseBean where merchandiseTag = :merchandiseTag", MerchandiseBean.class);
		query.setParameter("merchandiseTag", merchandiseTag);

		return query.list();
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

	public MerchandiseBean update(String merchandiseName, String merchandiseContent, String merchandisePicture,
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
