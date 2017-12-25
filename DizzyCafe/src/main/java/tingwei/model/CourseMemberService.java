package tingwei.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.sf.json.JSONArray;

@Service
@Transactional
public class CourseMemberService {
	
	@Autowired
	private CourseMemberDAO courseMemberDAO;
	
	
	public void insert(CourseMemberBean bean) {
		courseMemberDAO.insert(bean);
	}
	
	public JSONArray selectByMemberId(int memberId) {
		return courseMemberDAO.selectByMemberId(memberId);
	}
	
	public JSONArray ShowCourceByPage(int page,int rows_perPage, JSONArray courses) {
		JSONArray result = new JSONArray();
		/* logic: rows_perPage = 4
		 * 1 : 1-4
		 * 2 : 5-8
		 */
		for (int i = rows_perPage * (page - 1); i < rows_perPage * page && i < courses.size(); i++) { 
			result.add(courses.get(i));
		}
		return result;
	}
	
	public int countTotalPagesWithId(int rows_perPage, JSONArray courses) {
		int result = 0;
		if (courses.size() % rows_perPage == 0) {
			result = courses.size() / rows_perPage;
		} else if(courses.size() % rows_perPage > 0)
		{
			result  = courses.size() / rows_perPage + 1;
		}
		return result;
	}
	
	public int[] countNowPeople(int courseIdStart, int courseIdEnd, int rows_perPage) {
		return courseMemberDAO.countNowPeople(courseIdStart, courseIdEnd,rows_perPage);
	}
	
	public int[] countMyNowPeople(int memberId, int Start, int End, int rows_perPage) {
		return courseMemberDAO.countMyNowPeople(memberId, Start, End,rows_perPage);
	}
	
	public JSONArray showMyCourseInPage(int memberId){
		return courseMemberDAO.selectMyPageNow(memberId);
	}
	
//	public List<CourseBean> showCourseInPage(int courseIdStart, int courseIdEnd){
//		return courseMemberDAO.selectPageNow(courseIdStart,courseIdEnd);
//	}
	
	public void quitCourse(int memberId, int courseId) {
		courseMemberDAO.quitCourse(memberId,courseId);
	}
	
	public int lastRowNum(int memberId) {
		return courseMemberDAO.getLastRowNum(memberId);
	}
	
	public boolean checkSignedUp(int memberId, int courseId) {
		CourseMemberBean temp = courseMemberDAO.checkSignedUp(memberId, courseId);
		if(temp!=null) {
			return true;
		}else
			return false;
	}
	
	public boolean checkSignedUpTime(int courseId) {
		return courseMemberDAO.checkSignedUpTime(courseId);
	}
}
