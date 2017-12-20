package tingwei.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tingwei.model.CourseMemberService;
import tingwei.model.CourseService;

@Controller
@RequestMapping("/course/course.controller")
public class CourseController {

	@Autowired
	private CourseService courseService;
	
	@Autowired
	private CourseMemberService courseMemberService;
	
	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST})
	public String method(
			Model model, int page
	) {
		int lastCourseId = courseService.lastCoruesId();
		int rows_perPage = 4;
		System.out.println(lastCourseId);
		
		int courseIdEnd = (lastCourseId - (page - 1) * rows_perPage);
		int courseIdStart = (lastCourseId - page * rows_perPage);
		
		System.out.println(courseIdStart);
		System.out.println(courseIdEnd);
		
		model.addAttribute("TotalPages" ,courseService.countTotalPages(rows_perPage));
		model.addAttribute("courseList" ,courseService.showCourseInPage(courseIdStart, courseIdEnd));
		model.addAttribute("courseNowPeople" ,courseMemberService.countNowPeople(courseIdStart, courseIdEnd,rows_perPage));
		
		return "courseList";
	}
	
	
}
