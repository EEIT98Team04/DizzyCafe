package dragon.model;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dragon.model.dao.ShoppingHibernateDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
@Transactional
public class ShoppingService {
	@Autowired
	private ShoppingDAO shoppingDAO;
	
	public JSONArray selectMerchandiseList(int memberId) {
		return shoppingDAO.selectMerchandiseList(memberId);
	}
	
	public List<ShoppingBean> select(int memberId) {
		return shoppingDAO.select(memberId);
	}

	public List<ShoppingBean> select() {
		return shoppingDAO.select();
	}

	public ShoppingBean selectMerchandise(int memberId, int merchandiseId) {
		return shoppingDAO.selectMerchandise(memberId, merchandiseId);
	}

	public int insert(int memberId, int merchandiseId, int buyCount ,int price) {
		return shoppingDAO.insert(memberId, merchandiseId, buyCount, price);
	}

	public ShoppingBean changeCount(ShoppingBean bean, int amount) {
		return shoppingDAO.update(bean, amount);
	}

	public ShoppingBean deletemerchandise(ShoppingBean bean) {
			return shoppingDAO.delete(bean);
	}
	
	public int deleteAll(int memberId) {
		return shoppingDAO.deleteAll(memberId);	
	}
	
	public ShoppingBean updateCart(ShoppingBean bean) {
		return shoppingDAO.updateCart(bean);
	}
	public JSONArray selectBean(int memberId) {
		List<Object[]> selectList = shoppingDAO.selectList(memberId);
		JSONArray json = new JSONArray();
		for(Object[] temp : selectList) {
			JSONObject xxx = new JSONObject();
			xxx.put("price", temp[0]);
			xxx.put("merchandiseId", temp[1]);
			xxx.put("merchandiseName", temp[2]);
			xxx.put("merchandisePicture", temp[3]);
			xxx.put("buyCount", temp[4]);
			json.add(xxx);
		}
		
		return json;
	}
}
