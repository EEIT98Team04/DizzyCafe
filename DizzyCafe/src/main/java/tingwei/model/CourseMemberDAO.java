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
			System.out.println(obj.toString());
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
	public JSONArray selectMyPageNow(int row_numStart, int row_numEnd, int memberId) {
		@SuppressWarnings("unchecked")
		Query<Object[]> select = this.getSession().createNativeQuery("select  courseImg, courseName, courseBegin, courseEnd, courseLimit, course.courseId from (select ROW_NUMBER() OVER(ORDER BY courseId ASC) AS row_num," + 
				"* from courseMemberForm where memberId = ?) as newTable  JOIN course  ON newTable.courseId = course.courseId"+
				" where row_num >? and row_num <=? ORDER BY courseId DESC");
		select.setParameter(1, memberId);
		select.setParameter(2, row_numStart);
		select.setParameter(3, row_numEnd);
		List<Object[]> temp = select.getResultList();
		System.out.println("list"+temp.size());
		JSONArray result = new JSONArray();
		for(Object[] var : temp) {
			JSONObject tt = new JSONObject();
			tt.put("courseImg", var[0]);
			tt.put("courseName", var[1]);
			tt.put("courseBegin", var[2].toString());
			tt.put("courseEnd", var[3].toString());
			tt.put("courseLimit", var[4]);
			tt.put("courseId",var[5]);
			System.out.println("tt:"+tt);
			result.add(tt);
		}
		System.out.println("result:"+result);
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
		System.out.println(result);
		return result;
	}
}
