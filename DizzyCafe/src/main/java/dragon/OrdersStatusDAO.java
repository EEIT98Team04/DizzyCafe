package dragon;

import java.util.List;

public interface OrdersStatusDAO {
	
	OrdersStatusBean select(String ordersStatusId);
	
	List<OrdersStatusBean> select();
	//如果寫int 新增完成要重新整理並搜尋才會看到新增到的資料，如果是要馬上看到並搜尋，型態要設OrdersStatusBean
	int insert(OrdersStatusBean bean);
	
	int update(OrdersStatusBean bean);
	
	int delete(String ordersStatusId);
}
