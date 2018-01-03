package dragon.model;

import java.util.List;

import org.hibernate.query.Query;

import net.sf.json.JSONArray;

public interface ShoppingDAO {
	
	JSONArray selectMerchandiseList(int memberId);

	List<ShoppingBean> select(int memberId);
	
	ShoppingBean selectMerchandise(int memberId, int merchandiseId);
	
	List<ShoppingBean> select();
	
	int insert(int memberId, int merchandiseId, int buyCount, int price);
	
	ShoppingBean update(ShoppingBean bean, int amount);
	
	ShoppingBean delete(ShoppingBean bean);
	
	ShoppingBean updateCart(ShoppingBean bean);
	
	List<Object[]> selectBean(int memberId);
	
	List<Object[]> selectList(int memberId);
}
