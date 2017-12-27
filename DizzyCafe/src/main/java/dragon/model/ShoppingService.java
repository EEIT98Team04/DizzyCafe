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

	public int insert(ShoppingBean bean) {
		return shoppingDAO.insert(bean);
	}

	public ShoppingBean changeCount(ShoppingBean bean, int amount) {
		return shoppingDAO.update(bean, amount);
	}

	public ShoppingBean deletemerchandise(ShoppingBean bean) {
			return shoppingDAO.delete(bean);
	}
}
