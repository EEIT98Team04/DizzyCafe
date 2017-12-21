package tingwei.controller;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tingwei.model.CourseBean;
import tingwei.model.CourseDateTimeBean;
import tingwei.model.CourseDateTimeService;
import tingwei.model.CourseService;

@Controller
@RequestMapping("/course/courseNew.controller")
public class CourseNewController {
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private CourseDateTimeService courseDateTimeService;
	
	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST})
	public String method(Model model, CourseBean couresBean, 
			String[] whichDay,String time ,int courseLength) {

		courseService.insert(couresBean);
		
		courseDateTimeService.insertAll(couresBean, whichDay, time, courseLength);

		
		return "courseList.return";
	}

}
