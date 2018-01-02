package dragon.model;

import java.util.List;

import net.sf.json.JSONArray;

public interface OrdersDAO {
	
	OrdersBean select(int autoOrderId);
	
	List<OrdersBean> selectMember(int memberId);
	
	JSONArray selectMemberToJson(int memberId);
	
	JSONArray selectAllOrder();
	
	JSONArray selectUnpaidOrder();
	
	JSONArray selectWaitshipmentOrder();
	
	JSONArray selectShipOrder();
	
	JSONArray selectFinishOrder();
	
	JSONArray selectCancelOrder();

	List<OrdersBean> select();
	
	OrdersBean insert(OrdersBean bean);
	
	OrdersBean update(int autoOrderId, String ordersStatusId);
}
