package dragon;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dragon.DAO.OrdersHibernateDAO;

@Service
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
		OrdersBean insert = ordersDAO.insert(bean);
		System.out.println(insert);
		if(insert != null)
		{
			return insert;
		}
		return null;
	}
	
	//會員查看自己有的訂單，或管理者想查看某會員的訂單資料
	public List<OrdersBean> selectMemberOrders(int memberId)
	{
		//以會員Id尋找該會訂單資料
		List<OrdersBean> selectMemberOrders = ordersDAO.selectMember(memberId);
		//如果不為空，就將找到的所有訂單資料回傳
		if(selectMemberOrders != null)
		{
			return selectMemberOrders;
		}
		return null;
	}
	
	//管理者想以訂單編號查詢該訂單的資料
	public OrdersBean selectOrders(int autoOrderId)
	{
		OrdersBean selectOrders = ordersDAO.select(autoOrderId);
		if(selectOrders != null)
		{
			return selectOrders;
		}
		return null;	
	}
	
	//使用者想看到所有存在的訂單資料
	public List<OrdersBean> selectOrdersAll()
	{
		List<OrdersBean> selectOrdersAll = ordersDAO.select();
		if(selectOrdersAll != null)
		{
			return selectOrdersAll;
		}
		return null;
	}
	
	//使用者更改訂單狀態(已付款、運送中、已取消..等等)
	public OrdersBean changeStatus(int autoOrderId, String ordersStatusId)
	{
		OrdersBean changeStatus = ordersDAO.update(autoOrderId, ordersStatusId);
		if(changeStatus != null)
		{
			return changeStatus;
		}
		return null;
	}
}
