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
	
	public int countTotalPages(int rows_perPage, int memberId) {
		return courseMemberDAO.countTotalPage(rows_perPage,memberId);
	}
	
	public int countTotalPagesWithId(int rows_perPage, int memberId) {
		return courseMemberDAO.countTotalPageWithId(rows_perPage,memberId);
	}
	
	public int[] countNowPeople(int courseIdStart, int courseIdEnd, int rows_perPage) {
		return courseMemberDAO.countNowPeople(courseIdStart, courseIdEnd,rows_perPage);
	}
	
	public int[] countMyNowPeople(int memberId, int Start, int End, int rows_perPage) {
		return courseMemberDAO.countMyNowPeople(memberId, Start, End,rows_perPage);
	}
	
	public JSONArray showMyCourseInPage(int courseIdStart, int courseIdEnd, int memberId){
		return courseMemberDAO.selectMyPageNow(courseIdStart,courseIdEnd,memberId);
	}
	
	public List<CourseBean> showCourseInPage(int courseIdStart, int courseIdEnd){
		return courseMemberDAO.selectPageNow(courseIdStart,courseIdEnd);
	}
}
