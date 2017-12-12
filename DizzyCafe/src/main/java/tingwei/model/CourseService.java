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
	
	
	private int rows_perPage = 2;


	

//	public List<CourseBean> showCourse() {
//		return courseDAO.select();
//	}
	
	public CourseBean select(int courseId) {
		return courseDAO.select(courseId);
	}
	
	public List<CourseBean> selectByName(String coruseName) {
		return courseDAO.selectByName(coruseName);
	}
	
	public List<CourseBean> showCourseInPage(int nowPage){
		return courseDAO.selectPageNow(nowPage,rows_perPage);
	}
	
	public int countTotalPages() {
		return courseDAO.countTotalPage(this.getRows_perPage());
	}

	public CourseBean insert(CourseBean bean) {
		boolean temp = courseDAO.insert(bean);
		if(temp!=true)
			return null;
		else
			return bean;
	}
	
	
	
	public int getRows_perPage() {
		return rows_perPage;
	}

	public void setRows_perPage(int rows_perPage) {
		this.rows_perPage = rows_perPage;
	}
	
}
