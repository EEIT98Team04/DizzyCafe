package dragon;

import java.util.List;

public interface OrdersDetailsDAO {
	
	List<OrdersDetailsBean> select(int ordersId);
	
	List<OrdersDetailsBean> select();
	
	OrdersDetailsBean insert(OrdersDetailsBean bean);
	
	int updateShoppingOrdersId(int OrdersId, int memberId);
	
}   
