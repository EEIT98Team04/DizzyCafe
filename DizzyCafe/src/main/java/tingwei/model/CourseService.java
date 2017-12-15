package tingwei.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CourseService {
	@Autowired
	private CourseDAO courseDAO;


	

//	public List<CourseBean> showCourse() {
//		return courseDAO.select();
//	}
	
	public CourseBean select(int courseId) {
		return courseDAO.select(courseId);
	}
	
	public List<CourseBean> selectByName(String coruseName) {
		return courseDAO.selectByName(coruseName);
	}
	
	public List<CourseBean> showCourseInPage(int courseIdStart, int courseIdEnd){
		return courseDAO.selectPageNow(courseIdStart,courseIdEnd);
	}
	
	public int countTotalPages(int rows_perPage) {
		return courseDAO.countTotalPage(rows_perPage);
	}

	public CourseBean insert(CourseBean bean) {
		boolean temp = courseDAO.insert(bean);
		if(temp!=true)
			return null;
		else
			return bean;
	}
}
