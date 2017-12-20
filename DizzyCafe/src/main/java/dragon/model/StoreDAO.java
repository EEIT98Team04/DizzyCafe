package dragon.model;

import java.util.List;

public interface StoreDAO {

	StoreBean select(int storeId);
	
	List<StoreBean> select();
	
	int insert(StoreBean bean);
	
	int update(StoreBean bean);
	
	int delete(int storeId);
}
