package hongwen.model.dao;

import java.util.List;

import hongwen.model.bean.*;

public interface BoardDAO {

	ProductBean select(int id);

	List<ProductBean> select();

	ProductBean insert(ProductBean bean);

	ProductBean update(String name, double price, java.util.Date make, int expire, int id);

	boolean delete(int id);

}