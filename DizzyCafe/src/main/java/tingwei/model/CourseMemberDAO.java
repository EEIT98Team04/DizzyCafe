package tingwei.model;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
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
				" FROM coursememberForm JOIN course" + 
				" ON coursememberForm.courseId = COURSE.courseId" + 
				" WHERE coursememberForm.memberId = "+memberId);
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
	
	//顯示所有課程現在人數(分頁)
	public int[] countNowPeople(int courseIdStart, int  courseIdEnd, int rows_perPage) {
		int[] count = new int[rows_perPage];
		for(int i = 0 ; courseIdStart<courseIdEnd ; courseIdEnd-- , i++) {
			int temp = (int)this.getSession().createNativeQuery
					("SELECT COUNT(*) FROM coursememberForm WHERE courseId = "+courseIdEnd).uniqueResult();
			count[i]=temp;
		}
		 return count;
	}
	
	
	//顯示會員課程現在人數(分頁)
	public int[] countMyNowPeople(int memberId, int row_numStart, int row_numEnd, int rows_perPage) {
			int[] count = new int[rows_perPage];
			@SuppressWarnings("unchecked")
			Query<Object[]> temp = this.getSession().createNativeQuery("select courseId from (select ROW_NUMBER() OVER(ORDER BY courseId ASC) AS row_num,\r\n" + 
				"* from courseMemberForm where memberId = "+memberId+") as newTable where row_num > "+row_numStart+" and row_num <= "+row_numEnd);
			List<Object[]> obj = temp.getResultList();
			for(int i = 0,j=obj.size()-1;i<obj.size();i++,j--) {
				count[i] = (Integer)this.getSession().createNativeQuery
					("SELECT COUNT(*) FROM coursememberForm WHERE courseId = "+ obj.get(j)).uniqueResult();
			}
			return count;
	}
	
	public List<CourseBean> select() {
		Query<CourseBean> select = this.getSession().createQuery("FROM CourseBean", CourseBean.class);
		return select.getResultList();
	}
	
	public void insert(CourseMemberBean bean) {
		this.getSession().save(bean);
	}
	
	
	//所有課程總頁數
//	public int countTotalPage(int row_perPage, int memberId) {
//		Long temp = (long) this.getSession().createQuery("Select COUNT(*) FROM CourseMemberBean").uniqueResult();
//		if (temp.intValue()>0 && temp.intValue() % row_perPage == 0)
//			return temp.intValue() / row_perPage;
//		else
//			return temp.intValue() / row_perPage + 1;
//	}
	
	
	//會員課程總頁數
	public int countTotalPageWithId(int row_perPage, int memberId) {
		Long temp = (long) this.getSession().createQuery("Select COUNT(*) FROM CourseMemberBean WHERE memberId =" + memberId).uniqueResult();
		if (temp.intValue()>0 && temp.intValue() % row_perPage == 0)
			return temp.intValue() / row_perPage;
		else
			return temp.intValue() / row_perPage + 1;
	}
	
	
	//顯示所有課程(分頁)
//	public List<CourseBean> selectPageNow(int courseIdStart, int courseIdEnd) {
//		Query<CourseBean> select = this.getSession().createNativeQuery("SELECT * FROM course WHERE "
//				+ "courseId >=?  AND courseId <? ORDER BY courseId DESC",CourseBean.class);
//		select.setParameter(1, courseIdStart);
//		select.setParameter(2, courseIdEnd);
//		return select.getResultList();
//	}
	
	
	//會員顯示自己已參加的課程(分頁)
	public JSONArray selectMyPageNow(int memberId) {
		@SuppressWarnings("unchecked")
		Query<Object[]> select = this.getSession().createNativeQuery(
				" select courseImg, courseName, courseBegin, courseEnd, courseIntro,courseLimit,course.courseId," + 
				" (select COUNT(memberId)" + 
				" from courseMemberForm" + 
				" where courseId = course.courseId) AS courseNowPeople" + 
				" from courseMemberForm" + 
				" join course ON courseMemberForm.courseId = course.courseId" + 
				" where courseMemberForm.memberId = ?" + 
				" ORDER BY courseId DESC"
				);
		select.setParameter(1, memberId);;
		List<Object[]> temp = select.getResultList();
		JSONArray result = new JSONArray();
		for(Object[] var : temp) {
			JSONObject tt = new JSONObject();
			tt.put("courseImg", var[0]);
			tt.put("courseName", var[1]);
			tt.put("courseBegin", var[2].toString());
			tt.put("courseEnd", var[3].toString());
			tt.put("courseIntro", var[4]);
			tt.put("courseLimit", var[5]);
			tt.put("courseId",var[6]);
			tt.put("courseNowPeople", var[7]);
			result.add(tt);
		}
		return result;
	}
	
	//會員退出課程
	public void quitCourse(int memberId, int courseId) {
		this.getSession().createNativeQuery(
				"DELETE FROM coursememberForm WHERE memberId = "+memberId+" AND courseId = "+courseId).executeUpdate();
	}
	
	public int getLastRowNum(int memberId) {
		 @SuppressWarnings("unchecked")
		Query<Object> select = this.getSession().createNativeQuery(
				"SELECT TOP 1 row_num FROM (select ROW_NUMBER() OVER(ORDER BY courseId ASC) AS row_num,"+ 
				" * from courseMemberForm where memberId = ?) as newTable ORDER BY courseId DESC");
		select.setParameter(1, memberId);
		
		BigInteger temp = (java.math.BigInteger)select.uniqueResult();
		int result = temp.intValue();
		return result;
	}
	
	public CourseMemberBean checkSignedUp(int memberId, int courseId) {
		Query<CourseMemberBean> select = this.getSession().createNativeQuery("SELECT * FROM coursememberForm WHERE memberId = ? AND courseId = ?",CourseMemberBean.class);
		select.setParameter(1, String.valueOf(memberId));
		select.setParameter(2, String.valueOf(courseId));
		CourseMemberBean result = select.uniqueResult();
		return result;
	}
	
	public boolean checkSignedUpTime(int courseId) {
		Query<CourseBean> select = this.getSession().createNativeQuery(
				"SELECT * FROM course WHERE courseId = ?",CourseBean.class);
		select.setParameter(1, courseId);
		CourseBean temp = select.uniqueResult();
		long begin = temp.getCourseSignupBegin().getTime();
		long end = temp.getCourseSignupEnd().getTime();
		long now = System.currentTimeMillis();
		if(now>begin && now<end) {
			return true;
		}else
			return false; 
	}
	
	public int getNowPeopleByCourseId(int courseId) {
		Query temp = this.getSession().createNativeQuery(
				"SELECT COUNT(memberId) from coursememberForm WHERE courseId = ?");
		temp.setParameter(1, courseId);
		int nowPeople = ((Integer)temp.uniqueResult()).intValue();
		return nowPeople;
	}
}
