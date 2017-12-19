package dragon.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import dragon.StoreBean;
import dragon.StoreDAO;

public class StoreHibernateDAO implements StoreDAO {

	private SessionFactory sessionFactory;

	public StoreHibernateDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}
	
	public static void main(String[] args) {

	}

	@Override
	public StoreBean select(int storeId) {
		return this.getSession().get(StoreBean.class, storeId);
	}

	@Override
	public List<StoreBean> select() {
		Query<StoreBean> selectAll = this.getSession().createQuery("from StoreBean", StoreBean.class);
		return selectAll.list();
	}

	@Override
	public int insert(StoreBean bean) {
		if(bean != null)
		{
			StoreBean insert = this.select(bean.getStroeId());
			if(insert == null)
			{
				this.getSession().save(bean);
			}
		}
		return 0;
	}

	@Override
	public int update(StoreBean bean) {
		if(bean != null)
		{
			StoreBean update = this.select(bean.getStroeId());
			if(update != null)
			{
				update.setStoreName(bean.getStoreName());
				update.setStoreAddress(bean.getStoreAddress());
			}
		}
		return 0;
	}

	@Override
	public int delete(int storeId) {
		StoreBean delete = this.select(storeId);
		if(delete != null)
		{
			this.getSession().delete(delete);
		}
		return 0;
	}

}
