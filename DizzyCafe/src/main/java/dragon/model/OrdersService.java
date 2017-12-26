package dragon.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dragon.model.dao.OrdersHibernateDAO;
import net.sf.json.JSONArray;

@Service
@Transactional
public class OrdersService {

	@Autowired
	private OrdersDAO ordersDAO;

	public static void main(String[] args) {
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String data = simpleDateFormat.format(new Date());
		
	}
	
	
	//會員新增訂單
	public OrdersBean insertOrders(OrdersBean bean)
	{
		return ordersDAO.insert(bean);
	}
	
	//會員查看自己有的訂單，或管理者想查看某會員的訂單資料
	public List<OrdersBean> selectMemberOrders(int memberId)
	{
		return ordersDAO.selectMember(memberId);
	}
	
	public JSONArray selectMemberToJson(int memberId) {
		return ordersDAO.selectMemberToJson(memberId);
	}
	
	//管理者想以訂單編號查詢該訂單的資料
	public OrdersBean selectOrders(int autoOrderId)
	{
		return ordersDAO.select(autoOrderId);	
	}
	
	//使用者想看到所有存在的訂單資料
	public List<OrdersBean> selectOrdersAll()
	{
		return ordersDAO.select();
	}
	
	//使用者更改訂單狀態(已付款、運送中、已取消..等等)
	public OrdersBean changeStatus(int autoOrderId, String ordersStatusId)
	{
		return ordersDAO.update(autoOrderId, ordersStatusId);
	}
}
