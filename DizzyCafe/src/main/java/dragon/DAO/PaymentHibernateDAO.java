package dragon.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import dragon.PaymentBean;
import dragon.PaymentDAO;

public class PaymentHibernateDAO implements PaymentDAO {

	private SessionFactory sessionFactory;

	public PaymentHibernateDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	public static void main(String[] args) {

		
	}

	@Override
	public PaymentBean select(String paymentId) {

		return this.getSession().get(PaymentBean.class, paymentId);
	}

	// private final String select_all = "select * from payment";

	@Override
	public List<PaymentBean> select() {
		Query<PaymentBean> query = this.getSession().createQuery("from PaymentBean", PaymentBean.class);
		return query.list();
	}

	// private static final String insert = "insert into payment(paymentId,
	// paymentStyle) values(?, ?)";

	@Override
	public int insert(PaymentBean bean) {
		if (bean != null) {
			PaymentBean select = this.select(bean.getPaymentId());
			if (select == null) {
				this.getSession().save(bean);
			}
		}
		return 0;
	}

//	private static final String update = "update payment set paymentStyle=? where paymentId=?";

	@Override
	public int update(PaymentBean bean) {
			PaymentBean update = this.select(bean.getPaymentId());
			if(update != null)
			{
				update.setPaymentStyle(bean.getPaymentStyle());
			}
		return 0;
	}

	@Override
	public int delete(String paymentId) {
		PaymentBean delete = this.select(paymentId);
		if(delete != null)
		{
			this.getSession().delete(delete);
		}
		return 0;
	}

}
