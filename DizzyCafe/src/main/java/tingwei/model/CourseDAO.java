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

	public List<CourseBean> selectPageNow(int courseIdStart, int courseIdEnd) {
		Query<CourseBean> select = this.getSession().createQuery("FROM CourseBean WHERE courseId >" + courseIdStart
				+ " AND courseId <=" + courseIdEnd + " ORDER BY courseId DESC", CourseBean.class);
		return select.getResultList();
	}

	public boolean insert(CourseBean bean) {
		if (bean != null) {
			try {
				this.getSession().save(bean);
				// Query query = this.getSession().createNativeQuery("INSERT INTO course"
				// +
				// "(courseName,courseImg,courseIntro,courseContent,courseCost,courseTeacher,courseBegin,courseEnd,courseSignupBegin,courseSignupEnd)"
				// +"VALUES (?,?,?,?,?,?,?,?,?,?)");
				// query.setParameter(1, bean.getCourseName());
				// query.setParameter(2, bean.getCourseImg());
				// query.setParameter(3, bean.getCourseIntro());
				// query.setParameter(4, bean.getCourseContent());
				// query.setParameter(5, bean.getCourseCost());
				// query.setParameter(6, bean.getCourseTeacher());
				// query.setParameter(7, bean.getCourseBegin());
				// query.setParameter(8, bean.getCourseEnd());
				// query.setParameter(9, bean.getCourseSignupBegin());
				// query.setParameter(10, bean.getCourseSignupEnd());
				// query.executeUpdate();
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

	public int countTotalPage(int row_perPage) {
		Long temp = (long) this.getSession().createQuery("Select COUNT(*) FROM CourseBean").uniqueResult();
		if (temp.intValue() > 0 && temp.intValue() % row_perPage == 0)
			return temp.intValue() / row_perPage;
		else
			return temp.intValue() / row_perPage + 1;
	}

	public CourseBean update(int courseId, String courseName, String courseImg, String courseIntro,
			String courseContent, int courseCost, String courseTeacher, java.sql.Date courseBegin,
			java.sql.Date courseEnd, java.sql.Date courseSignupBegin, java.sql.Date courseSignupEnd, int courseLimit) {
		CourseBean select = this.select(courseId);
		if (select != null) {
			select.setCourseName(courseName);
			select.setCourseImg(courseImg);
			select.setCourseIntro(courseIntro);
			select.setCourseContent(courseContent);
			select.setCourseCost(courseCost);
			select.setCourseTeacher(courseTeacher);
			select.setCourseBegin(courseBegin);
			select.setCourseEnd(courseEnd);
			select.setCourseSignupBegin(courseSignupBegin);
			select.setCourseSignupEnd(courseSignupEnd);
			select.setCourseLimit(courseLimit);
		}
		return null;
	}

	public int lastCoruesId() {
		int result = (int) this.getSession()
				.createNativeQuery("SELECT TOP 1 courseId FROM course ORDER BY courseId DESC").uniqueResult();
		return result;
	}

	public JSONArray showCoruseInBackstage() {
		@SuppressWarnings("unchecked")
		Query<Object[]> select = this.getSession().createNativeQuery(
				"SELECT * FROM course");
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
			result.add(tt);
		}

		return result;

	}
}
