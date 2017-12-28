package dragon.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dragon.model.dao.OrdersDetailsHibernateDAO;
import net.sf.json.JSONArray;

@Service
@Transactional
public class OrdersDetailsService {
	@Autowired
	private OrdersDetailsDAO ordersDetailsDAO;

	
	//會員或管理者這以訂單編號來搜尋這筆訂單買有什麼商品和數量
	public List<OrdersDetailsBean> selectDetails(int ordersId)
	{
		return ordersDetailsDAO.select(ordersId);
	}
	
	public JSONArray selectOrderDetails(int ordersId) {
		return ordersDetailsDAO.selectOrderDetails(ordersId);
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
