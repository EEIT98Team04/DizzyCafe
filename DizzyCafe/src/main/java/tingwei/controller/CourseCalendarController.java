package tingwei.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import tingwei.model.CourseDateTimeService;

@Controller
public class CourseCalendarController {
	
	@Autowired
	private CourseDateTimeService courseDateTimeService;
	
	@RequestMapping(path= {"/courseCalendar.controller"} ,method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody JSONArray method() {
		JSONArray select = courseDateTimeService.selectJoinCourse();

		return select;
	}
	
	
	@RequestMapping(path= {"/courseCalendarByCourseId.controller"} ,method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody JSONArray perCourse(int courseId) {
		JSONArray select = courseDateTimeService.selectPerCourse(courseId);
		
		System.out.println("abubu:"+courseId);

		return select;
	}

}