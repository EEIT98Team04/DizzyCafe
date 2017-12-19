package dragon.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import dragon.model.ShipBean;
import dragon.model.ShipDAO;

public class ShipHibernateDAO implements ShipDAO {

	private SessionFactory sessionFactory;

	public ShipHibernateDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}
	
	public static void main(String[] args) {

	
	}


	@Override
	public ShipBean select(String shipId) {
		return this.getSession().get(ShipBean.class, shipId);
	}

	@Override
	public List<ShipBean> select() {
		Query<ShipBean> selectAll = this.getSession().createQuery("from ShipBean", ShipBean.class);
		return selectAll.list();
	}

	@Override
	public ShipBean insert(ShipBean bean) {
		if(bean != null)
		{
			ShipBean insert = this.select(bean.getShipId());
			if(insert == null)
			{
				this.getSession().save(bean);
			}
		}
		return null;
	}

	@Override
	public int update(ShipBean bean) {
		ShipBean update = this.select(bean.getShipId());
		if(update != null)
		{
			update.setShipStyle(bean.getShipStyle());
			update.setShipCost(bean.getShipCost());
		}
		return 0;
	}

	@Override
	public int delete(String shipId) {
		ShipBean delete = this.select(shipId);
		if(delete != null)
		{
			this.getSession().delete(delete);
		}
		return 0;
	}

}
