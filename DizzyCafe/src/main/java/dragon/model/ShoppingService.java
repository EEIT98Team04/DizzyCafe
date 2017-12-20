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

@Service
@Transactional
public class ShoppingService {
	@Autowired
	private ShoppingDAO shoppingDAO;

	public List<ShoppingBean> select(int memberId) {
		List<ShoppingBean> bean = shoppingDAO.select(memberId);
		return bean;
	}

	public List<ShoppingBean> select() {
		List<ShoppingBean> bean = shoppingDAO.select();
		return bean;
	}

	public ShoppingBean selectMerchandise(int memberId, int merchandiseId) {
		ShoppingBean bean = shoppingDAO.selectMerchandise(memberId, merchandiseId);
		if (bean != null) {
			return bean;
		}
		return null;
	}

	public int insert(ShoppingBean bean) {

		int i = shoppingDAO.insert(bean);
		return i;
	}

	public ShoppingBean changeCount(ShoppingBean bean) {
		ShoppingBean update = shoppingDAO.selectMerchandise(bean.getMemberId(), bean.getMerchandiseId());
		if (update != null) {
			return shoppingDAO.update(bean);
		}
		return null;
	}

	public ShoppingBean deletemerchandise(ShoppingBean bean) {
		ShoppingBean delete = shoppingDAO.selectMerchandise(bean.getMemberId(), bean.getMerchandiseId());
		if (delete != null) {
			return shoppingDAO.delete(bean);
		}
		return null;
	}
}
