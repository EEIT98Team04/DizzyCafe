package dragon.model;

import java.util.List;

import org.hibernate.query.Query;

import net.sf.json.JSONArray;

public interface ShoppingDAO {
	
	JSONArray selectMerchandiseList(int memberId);

	List<ShoppingBean> select(int memberId);
	
	ShoppingBean selectMerchandise(int memberId, int merchandiseId);
	
	List<ShoppingBean> select();
	
	int insert(ShoppingBean bean);
	
	ShoppingBean update(ShoppingBean bean, int amount);
	
	ShoppingBean delete(ShoppingBean bean);
}
