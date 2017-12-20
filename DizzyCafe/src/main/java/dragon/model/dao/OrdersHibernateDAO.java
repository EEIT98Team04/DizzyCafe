package dragon.model.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dragon.model.OrdersBean;
import dragon.model.OrdersDAO;

@Repository
public class OrdersHibernateDAO implements OrdersDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public OrdersHibernateDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public static void main(String[] args) {

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String data = simpleDateFormat.format(new Date());

	}

	@Override
	public OrdersBean select(int autoOrderId) {
		return this.getSession().get(OrdersBean.class, autoOrderId);
	}

	@Override
	public List<OrdersBean> selectMember(int memberId) {
		Query<OrdersBean> selectMember = this.getSession().createQuery("from OrdersBean where memberId= :memberId",
				OrdersBean.class);
		selectMember.setParameter("memberId", memberId);
		return selectMember.list();
	}

	@Override
	public List<OrdersBean> select() {
		Query<OrdersBean> selectAll = this.getSession().createQuery("from OrdersBean", OrdersBean.class);
		return selectAll.list();
	}

	@Override
	public OrdersBean insert(OrdersBean bean) {
		if (bean != null) {
			this.getSession().save(bean);
			return bean;
		}
		return null;
	}


	@Override
	public OrdersBean update(int autoOrderId, String ordersStatusId) {
		OrdersBean update = this.select(autoOrderId);
		if (update != null) {
			update.setOrdersStatusId(ordersStatusId);
			return update;
		}
		return null;
	}

}
