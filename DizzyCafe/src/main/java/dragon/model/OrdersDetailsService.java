package dragon.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dragon.model.dao.OrdersDetailsHibernateDAO;

@Service
public class OrdersDetailsService {
	@Autowired
	private OrdersDetailsDAO ordersDetailsDAO;

	
	//會員或管理者這以訂單編號來搜尋這筆訂單買有什麼商品和數量
	public List<OrdersDetailsBean> selectDetails(int ordersId)
	{
		List<OrdersDetailsBean> selectDetails = ordersDetailsDAO.select(ordersId);
		if(selectDetails != null)
		{
			return selectDetails;
		}
		return null;	
	}
	
	//管理員查詢所有訂單明細(通常不會只以訂單編號查詢...)
	public List<OrdersDetailsBean> selectDetailsAll()
	{
		List<OrdersDetailsBean> selectDetailsAll = ordersDetailsDAO.select();
		if(selectDetailsAll != null)
		{
			return selectDetailsAll;
		}
		return null;	
	}
}
