package dragon.model;

import java.util.List;

public interface OrdersDAO {
	
	OrdersBean select(int autoOrderId);
	
	List<OrdersBean> selectMember(int memberId);
	
	List<OrdersBean> select();
	
	OrdersBean insert(OrdersBean bean);
	
	OrdersBean update(int autoOrderId, String ordersStatusId);
}
