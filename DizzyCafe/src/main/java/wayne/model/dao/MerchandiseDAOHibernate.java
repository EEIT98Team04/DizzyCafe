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
	
	//分頁展示商品 merchandise.controller做
//	public List<MerchandiseBean> selectPageNow(int pageNow, int rows_perPage) {
//		int base = 1;
//		Query<MerchandiseBean> select = this.getsession().createQuery("FROM MerchandiseBean WHERE merchandiseId >="
//				+ (base + (pageNow - 1) * rows_perPage) + " AND merchandiseId <" + (base + pageNow * rows_perPage) ,
//				MerchandiseBean.class);
//		return select.getResultList();
//	}
	//分頁展示商品 merchandise.controller做
	public JSONArray selectPageNow() {
		Query<Object[]> select = this.getsession().createNativeQuery("SELECT * FROM merchandise WHERE merchandiseStatus = 'launch' ORDER BY merchandiseId DESC");
		List<Object[]> temp = select.getResultList();
		JSONArray result = new JSONArray();
		for(Object[] var: temp) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("merchandiseId", var[0]);
			jsonObject.put("merchandiseName", var[1]);
			jsonObject.put("merchandiseContent", var[2]);
			jsonObject.put("merchandisePicture", var[3]);
			jsonObject.put("merchandiseTag", var[4]);
			jsonObject.put("merchandisePrice", var[5]);
			jsonObject.put("merchandiseQuantity", var[6]);
			jsonObject.put("merchandiseStatus", var[7]);
			result.add(jsonObject);
		}
		return result; 
	}
	
	//分頁展示商品 merchandisetag.controller做
	public JSONArray selectPageNowTag(String tag) {
		JSONArray result = new JSONArray();
	
		Query<Object[]> select = this.getsession().createNativeQuery(
				"SELECT * FROM merchandise where merchandiseTag = ? and merchandiseStatus = 'launch' ORDER BY merchandiseId DESC" );
		select.setParameter(1, tag);
		List<Object[]> list = select.getResultList();
		
		for(Object[] var: list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("merchandiseId", var[0]);
			jsonObject.put("merchandiseName", var[1]);
			jsonObject.put("merchandiseContent", var[2]);
			jsonObject.put("merchandisePicture", var[3]);
			jsonObject.put("merchandiseTag", var[4]);
			jsonObject.put("merchandisePrice", var[5]);
			jsonObject.put("merchandiseQuantity", var[6]);
			jsonObject.put("merchandiseStatus", var[7]);
			result.add(jsonObject);
		}
		return result;
	}
	
	
//	//計算總共分頁頁數 merchandise.controller做
//	public int countTotalPage(int row_perPage) {
//		Long temp = (long) this.getsession().createQuery("Select COUNT(*) FROM MerchandiseBean ").uniqueResult();
//		if (temp.intValue() % row_perPage == 0) {
//			return temp.intValue() / row_perPage;
//		} else {
//			return temp.intValue() / row_perPage + 1;
//		}
//	}
//	//計算總共分頁頁數 merchandisetag.controller做
//	public int countTotalPageTag(int row_perPage, String tag) {
//		Long temp = (long) this.getsession()
//				.createQuery("Select COUNT(*) FROM MerchandiseBean where merchandiseTag = '" + tag +"'")
//				.uniqueResult();
//		if (temp.intValue() % row_perPage == 0) {
//			return temp.intValue() / row_perPage;
//		} else {
//			return temp.intValue() / row_perPage + 1;
//		}
//	}
	
	public MerchandiseBean selectById(int merchandiseId) {
		return this.getsession().get(MerchandiseBean.class, merchandiseId);
	}
	
	public List<MerchandiseBean> select() {
		List<MerchandiseBean> result = null;
		Query<MerchandiseBean> query = this.getsession().createQuery("FROM MerchandiseBean", MerchandiseBean.class);
		result = query.getResultList();
		return result;
	}

	public List<MerchandiseBean> select(String merchandiseTag) {
		Query<MerchandiseBean> query = this.getsession()
				.createQuery("FROM MerchandiseBean where merchandiseTag = :merchandiseTag", MerchandiseBean.class);
		query.setParameter("merchandiseTag", merchandiseTag);

		return query.list();
	}

	public MerchandiseBean insert(MerchandiseBean bean) {
		if (bean != null) {
			MerchandiseBean select = this.selectById(bean.getMerchandiseId());
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
		MerchandiseBean select = this.selectById(merchandiseId);
		if (select != null) {
			select.setMerchandiseName(merchandiseName);
			select.setMerchandisePrice(merchandisePrice);
			select.setMerchandiseQuantity(merchandiseQuantity);
			select.setMerchandiseStatus(merchandiseStatus);
			select.setMerchandiseTag(merchandiseTag);
			select.setMerchandiseContent(merchandiseContent);
			select.setMerchandisePicture(merchandisePicture);
		}
		return null;
	}

	public boolean delete(int merchandiseId) {
		MerchandiseBean select = this.selectById(merchandiseId);
		if (select != null) {
			this.getsession().delete(select);
			return true;
		}
		return false;
	}

}
