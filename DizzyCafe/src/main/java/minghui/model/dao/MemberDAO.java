package minghui.model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import minghui.model.MemberBean;

@Repository
public class MemberDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public void closeSessionFactory() {
		sessionFactory.close();
	}

	private static final String SELECT_BY_MEMBERNAME = "from MemberBean where memberName = :memberName";

	public MemberBean select(String memberName) {
		Query query = this.getSession().createQuery(SELECT_BY_MEMBERNAME);
		query.setParameter("memberName", memberName);
		return (MemberBean) query.uniqueResult();

	}

	private static final String SELECT_BY_MEMBEREMAIL = "from MemberBean where memberEmail = :memberEmail";

	public MemberBean select_by_email(String memberEmail) {
		Query query = this.getSession().createQuery(SELECT_BY_MEMBEREMAIL);
		query.setParameter("memberEmail", memberEmail);
		return (MemberBean) query.uniqueResult();
	}

	private static final String SELECT_BY_MEMBERTEMPPASSWORD = "from MemberBean where memberTempPassword = :memberTempPassword";
	public MemberBean select_by_TempPassword(String memberTempPassword) {
		if (memberTempPassword != null && !memberTempPassword.trim().isEmpty()) {
			Query query = this.getSession().createQuery(SELECT_BY_MEMBERTEMPPASSWORD);
			query.setParameter("memberTempPassword", memberTempPassword);
			return (MemberBean) query.uniqueResult();
		}
		return null;
	}

	public MemberBean insert(MemberBean bean) {
		if (bean != null && bean.getMemberId() == 0) {
			if (this.select(bean.getMemberName()) == null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	public MemberBean update(MemberBean bean) {
		if (bean != null) {
			MemberBean result = this.select(bean.getMemberName());
			if (result != null) {
				return (MemberBean) this.getSession().merge(bean);
			}
		}
		return null;
	}
}
