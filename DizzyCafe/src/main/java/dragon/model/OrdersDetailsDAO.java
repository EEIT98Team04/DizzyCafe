package dragon.model;

import java.util.List;

import net.sf.json.JSONArray;

public interface OrdersDetailsDAO {
	
	List<OrdersDetailsBean> select(int ordersId);
	
	JSONArray selectOrderDetails(int ordersId);
	
	List<OrdersDetailsBean> select();
	
	OrdersDetailsBean insert(OrdersDetailsBean bean);
	
	int updateShoppingOrdersId(int OrdersId, int memberId);
	
}   
