package dragon.model.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.JsonObject;

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
		Query<Object[]> select = this.getSession().createNativeQuery("select orders.ordersDate, orders.autoOrderId, orders.shipStyle"
				+ ", orders.paymentStyle, orders.totalPrice, ordersStatus.ordersStatus"
				+ " from orders"
				+ " Join ordersStatus" 
				+ " On orders.ordersStatusId = ordersStatus.ordersStatusId" 
				+ " where memberId=" + memberId
				+ " order by autoOrderId DESC" );
		List<Object[]> temp = select.getResultList();
		JSONArray result = new JSONArray();
		for(Object[] var:temp) {
			JSONObject orders = new JSONObject();
			orders.put("ordersDate", var[0]);
			orders.put("autoOrderId", var[1]);
			orders.put("shipStyle", var[2]);
			orders.put("paymentStyle", var[3]);
			orders.put("totalPrice", var[4]);
			orders.put("ordersStatus", var[5]);
			result.add(orders);
		}
		return result;
	}
	
	
	@Override
	public JSONArray selectAllOrder() {
		@SuppressWarnings("unchecked")
		Query<Object[]> select = this.getSession().createNativeQuery("select ordersDate, autoOrderId, memberId"
				+ ", buyer, shipPhone, shipAddress, storeName, shipStyle, paymentStyle, totalPrice, ordersStatus" 
				+ " from orders" 
				+ " Join ordersStatus" 
				+ " On orders.ordersStatusId = ordersStatus.ordersStatusId");
		List<Object[]> temp = select.getResultList();
		JSONArray result = new JSONArray();
		for(Object[] var:temp) {
			JSONObject selectAllOrder = new JSONObject();
			selectAllOrder.put("ordersDate", var[0].toString().substring(0,10).replace("-", "/"));
			selectAllOrder.put("autoOrderId", var[1]);
			selectAllOrder.put("memberId", var[2]);
			selectAllOrder.put("buyer", var[3]);
			selectAllOrder.put("shipPhone", var[4]);
			selectAllOrder.put("shipAddress", var[5]);
			selectAllOrder.put("storeName", var[6]);
			selectAllOrder.put("shipStyle", var[7]);
			selectAllOrder.put("paymentStyle", var[8]);
			selectAllOrder.put("totalPrice", var[9]);
			selectAllOrder.put("ordersStatus", var[10]);
			result.add(selectAllOrder);
		}
		return result;
	}

	@Override
	public JSONArray selectUnpaidOrder() {
		@SuppressWarnings("unchecked")
		Query<Object[]> select = this.getSession().createNativeQuery("select ordersDate, autoOrderId, memberId"
				+ ", buyer, shipPhone, shipAddress, storeName, shipStyle, paymentStyle, totalPrice, ordersStatus" 
				+ " from orders" 
				+ " Join ordersStatus" 
				+ " On orders.ordersStatusId = ordersStatus.ordersStatusId"
				+ " where ordersStatus='未付款' ");
		List<Object[]> temp = select.getResultList();
		JSONArray result = new JSONArray();
		for(Object[] var:temp) {
			JSONObject selectUnpaidOrder = new JSONObject();
			selectUnpaidOrder.put("ordersDate", var[0]);
			selectUnpaidOrder.put("autoOrderId", var[1]);
			selectUnpaidOrder.put("memberId", var[2]);
			selectUnpaidOrder.put("buyer", var[3]);
			selectUnpaidOrder.put("shipPhone", var[4]);
			selectUnpaidOrder.put("shipAddress", var[5]);
			selectUnpaidOrder.put("storeName", var[6]);
			selectUnpaidOrder.put("shipStyle", var[7]);
			selectUnpaidOrder.put("paymentStyle", var[8]);
			selectUnpaidOrder.put("totalPrice", var[9]);
			selectUnpaidOrder.put("ordersStatus", var[10]);
			result.add(selectUnpaidOrder);
		}
		return result;
	}

	@Override
	public JSONArray selectWaitshipmentOrder() {
		@SuppressWarnings("unchecked")
		Query<Object[]> select = this.getSession().createNativeQuery("select ordersDate, autoOrderId, memberId"
				+ ", buyer, shipPhone, shipAddress, storeName, shipStyle, paymentStyle, totalPrice, ordersStatus" 
				+ " from orders" 
				+ " Join ordersStatus" 
				+ " On orders.ordersStatusId = ordersStatus.ordersStatusId"
				+ " where ordersStatus='待出貨' ");
		List<Object[]> temp = select.getResultList();
		JSONArray result = new JSONArray();
		for(Object[] var:temp) {
			JSONObject selectWaitshipmentOrder = new JSONObject();
			selectWaitshipmentOrder.put("ordersDate", var[0]);
			selectWaitshipmentOrder.put("autoOrderId", var[1]);
			selectWaitshipmentOrder.put("memberId", var[2]);
			selectWaitshipmentOrder.put("buyer", var[3]);
			selectWaitshipmentOrder.put("shipPhone", var[4]);
			selectWaitshipmentOrder.put("shipAddress", var[5]);
			selectWaitshipmentOrder.put("storeName", var[6]);
			selectWaitshipmentOrder.put("shipStyle", var[7]);
			selectWaitshipmentOrder.put("paymentStyle", var[8]);
			selectWaitshipmentOrder.put("totalPrice", var[9]);
			selectWaitshipmentOrder.put("ordersStatus", var[10]);
			result.add(selectWaitshipmentOrder);
		}
		return result;
	}

	@Override
	public JSONArray selectShipOrder() {
		@SuppressWarnings("unchecked")
		Query<Object[]> select = this.getSession().createNativeQuery("select ordersDate, autoOrderId, memberId"
				+ ", buyer, shipPhone, shipAddress, storeName, shipStyle, paymentStyle, totalPrice, ordersStatus" 
				+ " from orders" 
				+ " Join ordersStatus" 
				+ " On orders.ordersStatusId = ordersStatus.ordersStatusId"
				+ " where ordersStatus='運送中' ");
		List<Object[]> temp = select.getResultList();
		JSONArray result = new JSONArray();
		for(Object[] var:temp) {
			JSONObject selectShipOrder = new JSONObject();
			selectShipOrder.put("ordersDate", var[0]);
			selectShipOrder.put("autoOrderId", var[1]);
			selectShipOrder.put("memberId", var[2]);
			selectShipOrder.put("buyer", var[3]);
			selectShipOrder.put("shipPhone", var[4]);
			selectShipOrder.put("shipAddress", var[5]);
			selectShipOrder.put("storeName", var[6]);
			selectShipOrder.put("shipStyle", var[7]);
			selectShipOrder.put("paymentStyle", var[8]);
			selectShipOrder.put("totalPrice", var[9]);
			selectShipOrder.put("ordersStatus", var[10]);
			result.add(selectShipOrder);
		}
		return result;
	}

	@Override
	public JSONArray selectFinishOrder() {
		@SuppressWarnings("unchecked")
		Query<Object[]> select = this.getSession().createNativeQuery("select ordersDate, autoOrderId, memberId"
				+ ", buyer, shipPhone, shipAddress, storeName, shipStyle, paymentStyle, totalPrice, ordersStatus" 
				+ " from orders" 
				+ " Join ordersStatus" 
				+ " On orders.ordersStatusId = ordersStatus.ordersStatusId"
				+ " where ordersStatus='完成' ");
		List<Object[]> temp = select.getResultList();
		JSONArray result = new JSONArray();
		for(Object[] var:temp) {
			JSONObject selectFinishOrder = new JSONObject();
			selectFinishOrder.put("ordersDate", var[0]);
			selectFinishOrder.put("autoOrderId", var[1]);
			selectFinishOrder.put("memberId", var[2]);
			selectFinishOrder.put("buyer", var[3]);
			selectFinishOrder.put("shipPhone", var[4]);
			selectFinishOrder.put("shipAddress", var[5]);
			selectFinishOrder.put("storeName", var[6]);
			selectFinishOrder.put("shipStyle", var[7]);
			selectFinishOrder.put("paymentStyle", var[8]);
			selectFinishOrder.put("totalPrice", var[9]);
			selectFinishOrder.put("ordersStatus", var[10]);
			result.add(selectFinishOrder);
		}
		return result;
	}

	@Override
	public JSONArray selectCancelOrder() {
		@SuppressWarnings("unchecked")
		Query<Object[]> select = this.getSession().createNativeQuery("select ordersDate, autoOrderId, memberId"
				+ ", buyer, shipPhone, shipAddress, storeName, shipStyle, paymentStyle, totalPrice, ordersStatus" 
				+ " from orders" 
				+ " Join ordersStatus" 
				+ " On orders.ordersStatusId = ordersStatus.ordersStatusId"
				+ " where ordersStatus='已取消' ");
		List<Object[]> temp = select.getResultList();
		JSONArray result = new JSONArray();
		for(Object[] var:temp) {
			JSONObject selectCancelOrder = new JSONObject();
			selectCancelOrder.put("ordersDate", var[0]);
			selectCancelOrder.put("autoOrderId", var[1]);
			selectCancelOrder.put("memberId", var[2]);
			selectCancelOrder.put("buyer", var[3]);
			selectCancelOrder.put("shipPhone", var[4]);
			selectCancelOrder.put("shipAddress", var[5]);
			selectCancelOrder.put("storeName", var[6]);
			selectCancelOrder.put("shipStyle", var[7]);
			selectCancelOrder.put("paymentStyle", var[8]);
			selectCancelOrder.put("totalPrice", var[9]);
			selectCancelOrder.put("ordersStatus", var[10]);
			result.add(selectCancelOrder);
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
