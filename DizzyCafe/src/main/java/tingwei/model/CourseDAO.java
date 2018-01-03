package tingwei.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Repository

public class CourseDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public CourseDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public CourseBean select(int id) {
		return this.getSession().get(CourseBean.class, id);
	}

	public List<CourseBean> select() {
		Query<CourseBean> select = this.getSession().createQuery("FROM CourseBean", CourseBean.class);
		return select.getResultList();
	}

	public JSONArray selectPageNow() {
		@SuppressWarnings("unchecked")
		Query<Object[]> select = this.getSession().createNativeQuery
				(" select *," + 
				" (select COUNT(memberId)" + 
				" from courseMemberForm" + 
				" where courseId = course.courseId) AS courseNowPeople" + 
				" from course ORDER BY courseid DESC");
		List<Object[]> temp = select.getResultList();
		JSONArray result = new JSONArray();
		for(Object[] var : temp) {
			JSONObject tt = new JSONObject();
			tt.put("courseId", var[0]);
			tt.put("courseName", var[1]);
			tt.put("courseImg", var[2]);
			tt.put("courseIntro", var[3]);
			tt.put("courseContent", var[4]);
			tt.put("courseCost", var[5]);
			tt.put("courseTeacher", var[6]);
			tt.put("courseBegin", var[7].toString());
			tt.put("courseEnd", var[8].toString());
			tt.put("courseSignupBegin", var[9].toString());
			tt.put("courseSignupEnd", var[10].toString());
			tt.put("courseLimit", var[11]);
			tt.put("courseNowPeople", var[15]);
			result.add(tt);
		}
		return result;
	}

	public boolean insert(CourseBean bean) {
		if (bean != null) {
			try {
				this.getSession().save(bean);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}

		}
		return false;
	}

	public List<CourseBean> selectByName(String name) {
		Query<CourseBean> query = this.getSession().createNativeQuery("SELECT * FROM course WHERE courseName=?",
				CourseBean.class);
		query.setParameter(1, name);
		return query.getResultList();
	}

	public CourseBean update(CourseBean bean) {
		CourseBean select = this.select(bean.getCourseId());
		if (select != null) {
			select.setCourseName(bean.getCourseName());
			select.setCourseImg(bean.getCourseImg());
			select.setCourseIntro(bean.getCourseIntro());
			select.setCourseContent(bean.getCourseContent());
			select.setCourseCost(bean.getCourseCost());
			select.setCourseTeacher(bean.getCourseTeacher());
			select.setCourseBegin(bean.getCourseBegin());
			select.setCourseEnd(bean.getCourseEnd());
			select.setCourseSignupBegin(bean.getCourseSignupBegin());
			select.setCourseSignupEnd(bean.getCourseSignupEnd());
			select.setCourseLimit(bean.getCourseLimit());
			select.setCourseTime(bean.getCourseTime());
			select.setCourseLength(bean.getCourseLength());
			select.setCourseWeek(bean.getCourseWeek());
		}
		return select;
	}

	public int lastCoruesId() {
		int result = (int) this.getSession()
				.createNativeQuery("SELECT TOP 1 courseId FROM course ORDER BY courseId DESC").uniqueResult();
		return result;
	}

	public JSONArray showCoruseInBackstage() {
		@SuppressWarnings("unchecked")
		Query<Object[]> select = this.getSession().createNativeQuery(
				"  SELECT *,(" + 
				"  SELECT COUNT(*) " + 
				"  FROM coursememberForm " + 
				"  WHERE course.courseId = coursememberForm.courseId) as courseNowPeople " + 
				"  FROM course");
		List<Object[]> temp = select.getResultList();

		JSONArray result = new JSONArray();

		for (Object[] var : temp) {
			JSONObject tt = new JSONObject();
			tt.put("courseId", var[0]);
			tt.put("courseName", var[1]);
			tt.put("courseImg", var[2]);
			tt.put("courseIntro", var[3]);
			tt.put("courseContent", var[4]);
			tt.put("courseCost", var[5]);
			tt.put("courseTeacher", var[6]);
			tt.put("courseBegin", var[7].toString());
			tt.put("courseEnd", var[8].toString());
			tt.put("courseSignupBegin", var[9].toString());
			tt.put("courseSignupEnd", var[10].toString());
			tt.put("courseLimit", var[11]);
			tt.put("courseNowPeople", var[15]);
			result.add(tt);
		}
		return result;
	}
	
	public int getIdFromName(String courseName) {
		Query temp = this.getSession().createNativeQuery(" SELECT courseId FROM course WHERE courseName = ?");
		temp.setParameter(1, courseName);
		int courseId = ((Integer)temp.uniqueResult()).intValue();
		return courseId;
	}
}
