package dragon;

import java.util.List;

public interface ShipDAO {
	
	ShipBean select(String shipId);
	
	List<ShipBean> select();
	
	ShipBean insert(ShipBean bean);
	
	int update(ShipBean bean);
	
	int delete(String shipId);
}
