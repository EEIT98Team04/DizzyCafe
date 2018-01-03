package dragon.model.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dragon.model.ShoppingBean;
import dragon.model.ShoppingDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


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
	public JSONArray selectMerchandiseList(int memberId) {
		/*@SuppressWarnings忽略掉警訊(黃線), @SuppressWarnings("unchecked")就是忽略掉 unchecked 的警訊*/
		@SuppressWarnings("unchecked")
		Query<Object[]> select = this.getSession().createNativeQuery("select shopping.merchandiseId, merchandiseName, merchandisePrice, merchandisePicture, buyCount" + 
				" from shopping Join merchandise" +
				" on shopping.merchandiseId = merchandise.merchandiseId" +
				" where shopping.memberId = " + memberId);
		List<Object[]> temp = select.getResultList();
		JSONArray result = new JSONArray();
		for(Object[] var:temp) {
			JSONObject table = new JSONObject();
			table.put("merchandiseId", var[0]);
			table.put("merchandiseName", var[1]);
			table.put("merchandisePrice", var[2]);
			table.put("merchandisePicture", var[3]);
			table.put("buyCount", var[4]);
			result.add(table);
		}
		return result;
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
	public int insert(int memberId, int merchandiseId, int buyCount) {
			ShoppingBean insert = this.selectMerchandise(memberId, merchandiseId);
			if(insert == null)
			{
				ShoppingBean bean = new ShoppingBean();
				bean.setMemberId(memberId);
				bean.setMerchandiseId(merchandiseId);
				bean.setBuyCount(buyCount);
				this.getSession().save(bean);
				return 1;
			}else {
				return 0;
			}
	}
	

	private static final String update = "update shopping set buyCount=? where memberId =? and merchandiseId=?";

	@Override
	public ShoppingBean update(ShoppingBean bean, int amount) {
		if(bean != null)
		{
			ShoppingBean update = this.selectMerchandise(bean.getMemberId(), bean.getMerchandiseId());
			if(update != null)
			{
				update.setBuyCount(amount);
			}
			return update;
		}
		return null;
	}
	
	public ShoppingBean updateCart(ShoppingBean bean) {
		
		
		return (ShoppingBean) this.getSession().merge(bean);
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

	@Override
	public int deleteAll(int memberId) {
		List<ShoppingBean> deletes = this.select(memberId);
		if(deletes != null) {
			for(ShoppingBean delete : deletes) {
				
				this.getSession().delete(delete);
			}
			
		}
		return 0;
	}
	
	
}
