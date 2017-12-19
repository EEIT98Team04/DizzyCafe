package dragon.model;

import java.util.List;

import org.hibernate.SessionFactory;
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
	
	public static void main(String[] args) {
		ApplicationContext context=
				new ClassPathXmlApplicationContext("beans.config.xml");
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		sessionFactory.getCurrentSession().beginTransaction();
		
		ShoppingService shoppingService = (ShoppingService)context.getBean("shoppingService");
		List<ShoppingBean> select = shoppingService.select(101);
		System.out.println(select);
		//抓取購物車的MerchandiseId
		for(int i=0; i<select.size();i++)
		{
			int selectMerchandiseId = select.get(i).getMerchandiseId();
			
		}
		
	}
	public List<ShoppingBean> select(int memberId)
	{
		List<ShoppingBean> bean = shoppingDAO.select(memberId);
		return bean;
	}
	
	public ShoppingBean changeCount(ShoppingBean bean)
	{
		ShoppingBean update = shoppingDAO.selectMerchandise(bean.getMemberId(), bean.getMerchandiseId());
		if(update != null)
		{
			return shoppingDAO.update(bean);
		}
		return null;
	}
	
	public ShoppingBean deletemerchandise(ShoppingBean bean)
	{
		ShoppingBean delete = shoppingDAO.selectMerchandise(bean.getMemberId(), bean.getMerchandiseId());
		if(delete != null)
		{
			return shoppingDAO.delete(bean);
		}
		return null;
	}
}
