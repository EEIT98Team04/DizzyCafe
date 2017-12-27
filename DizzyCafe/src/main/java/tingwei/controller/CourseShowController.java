package tingwei.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tingwei.model.CourseBean;
import tingwei.model.CourseService;

@Controller
@RequestMapping("/course/courseShow.controller")
public class CourseShowController {
	
	@Autowired
	private CourseService courseService;
	
	
	//Show course info
	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST})
	public String method(Model model ,int course) {
		CourseBean bean = courseService.selectByCourseId(course);
		if(bean!=null) {
			model.addAttribute("course",bean);
			return "showCourseSuccess";
		}
		return "courseList.return";
	}
}
