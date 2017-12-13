package tingwei.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		model.addAttribute("TotalPages" ,courseService.countTotalPages());
		model.addAttribute("courseList" ,courseService.showCourseInPage(page));
		
		return "courseList";
	}
	
	
}
