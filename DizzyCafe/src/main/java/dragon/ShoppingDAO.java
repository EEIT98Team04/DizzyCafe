package dragon;

import java.util.List;

import org.hibernate.query.Query;

public interface ShoppingDAO {
	
	List<ShoppingBean> select(int memberId);
	
	ShoppingBean selectMerchandise(int memberId, int merchandiseId);
	
	List<ShoppingBean> select();
	
	int insert(ShoppingBean bean);
	
	ShoppingBean update(ShoppingBean bean);
	
	ShoppingBean delete(ShoppingBean bean);
}
