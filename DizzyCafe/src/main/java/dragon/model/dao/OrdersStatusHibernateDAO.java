package dragon.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import dragon.model.OrdersStatusBean;
import dragon.model.OrdersStatusDAO;

public class OrdersStatusHibernateDAO implements OrdersStatusDAO {

	private SessionFactory sessionFactory;

	public OrdersStatusHibernateDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {

		
	}
	@Override
	public OrdersStatusBean select(String ordersStatusId) {
		return this.getSession().get(OrdersStatusBean.class, ordersStatusId);
	}

	@Override
	public List<OrdersStatusBean> select() {
		Query<OrdersStatusBean> selectAll = this.getSession().createQuery("from OrdersStatusBean", OrdersStatusBean.class);
		return selectAll.list();
	}

	@Override
	public int insert(OrdersStatusBean bean) {
		if(bean != null)
		{
			OrdersStatusBean insert = this.select(bean.getOrdersStatusId());
			if(insert == null)
			{
				this.getSession().save(bean);
			}
		}
		return 0;
	}

	@Override
	public int update(OrdersStatusBean bean) {
		if(bean != null)
		{
			OrdersStatusBean update = this.select(bean.getOrdersStatusId());
			{
				if(update != null)
				{
					update.setOrdersStatus(bean.getOrdersStatus());
				}
			}
		}
		return 0;
	}

	@Override
	public int delete(String ordersStatusId) {
		OrdersStatusBean delete = this.select(ordersStatusId);
		if(delete != null)
		{
			this.getSession().delete(delete);
		}
		return 0;
	}

}
