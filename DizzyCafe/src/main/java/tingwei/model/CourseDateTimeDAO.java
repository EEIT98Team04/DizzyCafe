package tingwei.model;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Repository
@Transactional
public class CourseDateTimeDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public CourseDateTimeDAO(SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
	}
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
		
	
	
	public CourseDateTimeBean insert(CourseDateTimeBean bean) {
		if(bean!=null) {
			this.getSession().save(bean);
			this.getSession().flush();
			this.getSession().clear();
		}
		return null;
	}
	
	public CourseDateTimeBean select(int id) {
		return this.getSession().get(CourseDateTimeBean.class, id);
	}
	
	
	public List<CourseDateTimeBean> select(){
		Query<CourseDateTimeBean> select = this.getSession().createQuery("FROM CourseDateTimeBean",CourseDateTimeBean.class);
		return select.getResultList();
	}
	
	public JSONArray selectJoinCourse() {
		@SuppressWarnings("unchecked")
		Query<Object[]> select = this.getSession().createNativeQuery("select course.courseName, courseDateTime.courseStartTime, courseDateTime.courseEndTime "
				+ "from course join courseDateTime on course.courseId = courseDateTime.courseId");
		List<Object[]> temp = select.getResultList();

		JSONArray result = new JSONArray();
		
		for(Object[] var : temp) {
			JSONObject tt = new JSONObject();
			tt.put("title", var[0]);
			tt.put("start", var[1].toString());
			tt.put("end", var[2].toString());
			if( ((java.sql.Timestamp)var[1]).getTime() < System.currentTimeMillis()) {
				tt.put("color", "#AAAAAA");
			}
			result.add(tt);
		}

		return result;
	}
	
	public JSONArray selectPerCourse(int courseId) {
		@SuppressWarnings("unchecked")
		Query<Object[]> select = this.getSession().createNativeQuery("select course.courseName, courseDateTime.courseStartTime, courseDateTime.courseEndTime "
				+ "from course join courseDateTime on course.courseId = courseDateTime.courseId "
				+ "WHERE course.courseId = ?");
		select.setParameter(1, courseId);
		List<Object[]> temp = select.getResultList();

		JSONArray result = new JSONArray();
		
		for(Object[] var : temp) {
			JSONObject tt = new JSONObject();
			tt.put("title", var[0]);
			tt.put("start", var[1].toString());
			tt.put("end", var[2].toString());
			if( ((java.sql.Timestamp)var[1]).getTime() < System.currentTimeMillis()) {
				tt.put("color", "#AAAAAA");
			}
			result.add(tt);
		}

		return result;
	}
	
	public JSONArray selectMemberCourse(int memberId) {
		@SuppressWarnings("unchecked")
		Query<Object[]> select = this.getSession().createNativeQuery("select course.courseName, courseDateTime.courseStartTime, courseDateTime.courseEndTime "
				+ "from course join courseDateTime on course.courseId = courseDateTime.courseId "
				+ "join coursememberForm on coursememberForm.courseId = course.courseId "
				+ "WHERE memberId = ?");
		select.setParameter(1, memberId);
		List<Object[]> temp = select.getResultList();

		JSONArray result = new JSONArray();
		
		for(Object[] var : temp) {
			JSONObject tt = new JSONObject();
			tt.put("title", var[0]);
			tt.put("start", var[1].toString());
			tt.put("end", var[2].toString());
			if( ((java.sql.Timestamp)var[1]).getTime() < System.currentTimeMillis()) {
				tt.put("color", "#AAAAAA");
			}
			result.add(tt);
		}

		return result;
	}
	
	public void delete(int courseId) {
		Query delete = this.getSession().createNativeQuery("DELETE courseDateTime WHERE courseId = ?");
		delete.setParameter(1, courseId);
		delete.executeUpdate();
	}
	
	public void deleteAll() {
		Query deleteAll = this.getSession().createNativeQuery("DELETE courseDateTime");
		deleteAll.executeUpdate();
	}
}

