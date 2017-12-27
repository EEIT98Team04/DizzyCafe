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
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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
	public JSONArray selectMemberToJson(int memberId) {
		@SuppressWarnings("unchecked")
		Query<Object[]> select = this.getSession().createNativeQuery("select orders.ordersDate, orders.autoOrderId"
				+ ", orders.shipStyle, orders.paymentStyle, orders.totalPrice, orders.ordersStatusId, merchandise.merchandiseId"
				+ ", ordersDetails.merchandiseName, ordersDetails.merchandisePrice, ordersDetails.buyCount" 
				+ " from orders Join ordersDetails" 
				+ " On orders.autoOrderId = ordersDetails.ordersId" 
				+ " Join merchandise" 
				+ " On ordersDetails.merchandiseName = merchandise.merchandiseName" 
				+ " where orders.memberId = " + memberId);
		List<Object[]> temp = select.getResultList();
		JSONArray result = new JSONArray();
		for(Object[] var:temp) {
			JSONObject orders = new JSONObject();
			orders.put("ordersDate", var[0]);
			orders.put("autoOrderId", var[1]);
			orders.put("shipStyle", var[2]);
			orders.put("paymentStyle", var[3]);
			orders.put("totalPrice", var[4]);
			orders.put("ordersStatusId", var[5]);
			orders.put("merchandiseId", var[6]);
			orders.put("merchandiseName", var[7]);
			orders.put("merchandisePrice", var[8]);
			orders.put("buyCount", var[9]);
			result.add(orders);
		}
		return result;
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
