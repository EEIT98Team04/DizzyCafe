package tingwei.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.sf.json.JSONArray;

@Service
@Transactional
public class CourseService {
	@Autowired
	private CourseDAO courseDAO;

	

//	public List<CourseBean> showCourse() {
//		return courseDAO.select();
//	}
	
	public CourseBean selectByCourseId(int courseId) {
		return courseDAO.select(courseId);
	}
	
	public List<CourseBean> selectByName(String coruseName) {
		return courseDAO.selectByName(coruseName);
	}
	
	public JSONArray showCourseInPage(int page, int rows_perPage, JSONArray courses){
		JSONArray result = new JSONArray();
		/* logic: rows_perPage = 4
		 * 1 : 1-4
		 * 2 : 5-8
		 */
		for (int i = rows_perPage * (page - 1); i < rows_perPage * page && i < courses.size() ; i++) { 
			result.add(courses.get(i));
		}
		return result;
	}
	
	public int countTotalPages(int rows_perPage, JSONArray courses) {
		int result = 0;
		if (courses.size() % rows_perPage == 0) {
			result = courses.size() / rows_perPage;
		} else if(courses.size() % rows_perPage > 0)
		{
			result  = courses.size() / rows_perPage + 1;
		}
		return result;
	}

	public CourseBean insert(CourseBean bean) {
		boolean temp = courseDAO.insert(bean);
		if(temp!=true)
			return null;
		else
			return bean;
	}
	
	public JSONArray selectPageNow() {
		return courseDAO.selectPageNow();
	}
	
	public JSONArray showCoruseInBackstage() {
		return courseDAO.showCoruseInBackstage();
	}
	
	public CourseBean courseUpdateChangePage(int couresId) {
		return courseDAO.select(couresId);
	}
	
	public CourseBean update(CourseBean bean) {
		return courseDAO.update(bean);
	}
	
	public int getLimitByCourseId(int courseId) {
		CourseBean bean = this.selectByCourseId(courseId);
		int limit = bean.getCourseLimit();
		return limit;
	}
}
