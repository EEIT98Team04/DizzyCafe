package dragon.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dragon.ShoppingBean;
import dragon.ShoppingDAO;


@Repository
public class ShoppingHibernateDAO implements ShoppingDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public ShoppingHibernateDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public static void main(String[] args) {


	}


	@Override
	public List<ShoppingBean> select(int memberId) {
		Query<ShoppingBean> select = this.getSession().createQuery("from ShoppingBean where memberId=:memberId", ShoppingBean.class);
		select.setParameter("memberId", memberId);
		if(select != null)
		{
			return select.list();
		}
		return null;
	}
	
	@Override
	public ShoppingBean selectMerchandise(int memberId, int merchandiseId) {
		Query<ShoppingBean> selectMerchandise = this.getSession().createQuery("from ShoppingBean where memberId=:memberId and merchandiseId=:merchandiseId", ShoppingBean.class);
		selectMerchandise.setParameter("memberId", memberId);
		selectMerchandise.setParameter("merchandiseId", merchandiseId);
		return selectMerchandise.uniqueResult();
	}

	@Override
	public List<ShoppingBean> select() {
		Query<ShoppingBean> selectAll = this.getSession().createQuery("from ShoppingBean", ShoppingBean.class);
		return selectAll.list();
	}

	private static final String insert = "insert into shopping values(?, ?, ?)";

	@Override
	public int insert(ShoppingBean bean) {
		if(bean != null)
		{
			ShoppingBean insert = this.selectMerchandise(bean.getMemberId(), bean.getMerchandiseId());
			if(insert == null)
			{
				this.getSession().save(bean);
			}
			return 1;
		}
		return 0;
	}

	private static final String update = "update shopping set buyCount=? where memberId =? and merchandiseId=?";

	@Override
	public ShoppingBean update(ShoppingBean bean) {
		if(bean != null)
		{
			ShoppingBean update = this.selectMerchandise(bean.getMemberId(), bean.getMerchandiseId());
			if(update != null)
			{
				update.setBuyCount(bean.getBuyCount());
			}
			return update;
		}
		return null;
	}

	private static final String delete = "delete from shopping where memberId=? and merchandiseId=?";

	@Override
	public ShoppingBean delete(ShoppingBean bean) {
		if(bean != null)
		{
			ShoppingBean delete = this.selectMerchandise(bean.getMemberId(), bean.getMerchandiseId());
			if(delete != null)
			{
				this.getSession().delete(delete);
			}
			return delete;
		}
		return null;
	}

}
