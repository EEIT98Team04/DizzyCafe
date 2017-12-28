package tingwei.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.sf.json.JSONArray;
import tingwei.model.CourseMemberService;
import tingwei.model.CourseService;

@Controller
@RequestMapping("/course/course.controller")
public class CourseController {

	@Autowired
	private CourseService courseService;

	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST})
	public String method(
			Model model, int page
	) {
		int rows_perPage = 4;
		JSONArray _Course = courseService.selectPageNow();
		
		
		model.addAttribute("TotalPages" ,courseService.countTotalPages(rows_perPage,_Course));
		model.addAttribute("courseList" ,courseService.showCourseInPage(page, rows_perPage,_Course));
		model.addAttribute("rows_perPage" ,rows_perPage);
		
		
		return "courseList";
	}
	
	
}
