package hongwen.model;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class ProductDAOHibernate implements ProductDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	@Override
	public ProductBean select(int id) {
		return this.getSession().get(ProductBean.class, id);
	}
	@Override
	public List<ProductBean> select() {
		Query<ProductBean> query = this.getSession().createQuery("FROM ProductBean", ProductBean.class);
		return query.getResultList();
	}
	@Override
	public ProductBean insert(ProductBean bean) {
		if(bean!=null) {
			ProductBean select = this.select(bean.getId());
			if(select==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}
	@Override
	public ProductBean update(String name, double price, Date make, int expire, int id) {
		ProductBean select = this.select(id);
		if(select!=null) {
			select.setName(name);
			select.setPrice(price);
			select.setMake(make);
			select.setExpire(expire);
		}
		return null;
	}
	@Override
	public boolean delete(int id) {
		ProductBean select = this.select(id);
		if(select!=null) {
			this.getSession().delete(select);
			return true;
		}
		return false;
	}
}
