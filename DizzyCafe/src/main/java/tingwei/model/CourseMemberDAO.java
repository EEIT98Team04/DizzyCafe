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
public class CourseMemberDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public CourseMemberDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public JSONArray selectByMemberId(int memberId) {
		@SuppressWarnings("unchecked")
		Query<Object[]> select = this.getSession().createNativeQuery("SELECT courseImg ,courseName, courseBegin, courseEnd" + 
				"FROM coursememberForm join course" + 
				"ON coursememberForm.courseId = COURSE.courseId" + 
				"WHERE coursememberForm.memberId = "+memberId);
		List<Object[]> temp = select.getResultList();
		
		JSONArray result = new JSONArray();
		
		for(Object[] var : temp) {
			JSONObject tt = new JSONObject();
			tt.put("courseImg", var[0]);
			tt.put("courseName", var[1]);
			tt.put("courseBegin", var[2].toString());
			tt.put("courseEnd", var[3].toString());
			result.add(tt);
		}
		
		return result;
	}

	public int[] countNowPeople(int courseIdStart, int  courseIdEnd, int rows_perPage) {
		int[] count = new int[rows_perPage];
		for(int i = 0 ; courseIdStart<courseIdEnd ; courseIdStart++ , i++) {
			int temp = (int)this.getSession().createNativeQuery
					("SELECT COUNT(*) FROM coursememberForm WHERE courseId = "+courseIdStart).uniqueResult();
			count[i]=temp;
		}
		 return count;
	}
	
	public List<CourseBean> select() {
		Query<CourseBean> select = this.getSession().createQuery("FROM CourseBean", CourseBean.class);
		return select.getResultList();
	}
	
}
