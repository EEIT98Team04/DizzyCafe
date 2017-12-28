package dragon.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dragon.model.OrdersDetailsBean;
import dragon.model.OrdersDetailsDAO;
import dragon.model.ShoppingBean;
import dragon.model.ShoppingDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Repository
public class OrdersDetailsHibernateDAO implements OrdersDetailsDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public OrdersDetailsHibernateDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	public static void main(String[] args) {

	}
	
	@Override
	public List<OrdersDetailsBean> select(int ordersId) {
		Query<OrdersDetailsBean> select = this.getSession().createQuery("from OrdersDetailsBean where ordersId = :ordersId", OrdersDetailsBean.class);
		select.setParameter("ordersId", ordersId);
		return select.list();
	}

	@Override
	public JSONArray selectOrderDetails(int ordersId) {
		@SuppressWarnings("unchecked")
		Query<Object[]> select = this.getSession().createNativeQuery("select merchandise.merchandiseId"
				+ ", ordersDetails.merchandiseName, ordersDetails.merchandisePrice, ordersDetails.buyCount" 
				+ " from ordersDetails" 
				+ " Join merchandise" 
				+ " On ordersDetails.merchandiseName = merchandise.merchandiseName" 
				+ " where ordersDetails.ordersId=" + ordersId);
		List<Object[]> temp = select.getResultList();
		JSONArray result = new JSONArray();
		for(Object[] var:temp) {
			JSONObject orderDetails = new JSONObject();
			orderDetails.put("merchandiseId", var[0]);
			orderDetails.put("merchandiseName", var[1]);
			orderDetails.put("merchandisePrice", var[2]);
			orderDetails.put("buyCount", var[3]);
			result.add(orderDetails);
		}
		return result;
	}

	@Override
	public List<OrdersDetailsBean> select() {
		Query<OrdersDetailsBean> select = this.getSession().createQuery("from OrdersDetailsBean", OrdersDetailsBean.class);
		return select.list();
	}

	@Override
	public OrdersDetailsBean insert(OrdersDetailsBean bean) {
		if(bean != null)
		{
			Query<ShoppingBean> insert = this.getSession().createNativeQuery("from ShoppingBean where memberId=:memberId", ShoppingBean.class);
//			insert.setParameter("memberId", memberId);
		}
		return null;
	}

	@Override
	public int updateShoppingOrdersId(int ordersId, int memberId) {
			
		
//		if(select != null)
//		{
//			select.
//		}
//		updateOrdersId.setParameter("ordersId", ordersId);
//		updateOrdersId.setParameter("memberId", memberId);
		return 0;
	}

	
}
