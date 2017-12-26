package wayne.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import applehead.model.ActivityListBean;
import wayne.model.MerchandiseBean;

@Repository
public class BackstageMerchandiseDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getsession() {
		return sessionFactory.getCurrentSession();
	}
	
	public List<MerchandiseBean> selectAll() {
		List<MerchandiseBean> result = null;
		Query<MerchandiseBean> query = this.getsession().createQuery("FROM MerchandiseBean", MerchandiseBean.class);
		result = query.getResultList();
		return result;
	}
	
	public MerchandiseBean selectById(int merchandiseId) {
		return this.getsession().get(MerchandiseBean.class, merchandiseId);
	}
	
	public MerchandiseBean update(MerchandiseBean bean) {
		MerchandiseBean update = null;
		update = this.getsession().get(MerchandiseBean.class, bean.getMerchandiseId());
		update.setMerchandiseName(bean.getMerchandiseName());
		update.setMerchandisePicture(bean.getMerchandisePicture());
		update.setMerchandisePrice(bean.getMerchandisePrice());
		update.setMerchandiseQuantity(bean.getMerchandiseQuantity());
		update.setMerchandiseStatus(bean.getMerchandiseStatus());
		update.setMerchandiseTag(bean.getMerchandiseTag());
		update.setMerchandiseContent(bean.getMerchandiseContent());
		return update;
	}
}
