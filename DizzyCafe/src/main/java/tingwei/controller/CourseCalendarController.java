package tingwei.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import tingwei.model.CourseDateTimeService;

@Controller
@RequestMapping("/courseCalendar.controller")
public class CourseCalendarController {
	
	@Autowired
	private CourseDateTimeService courseDateTimeService;
	
	@RequestMapping(method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody JSONArray method() {
		JSONArray select = courseDateTimeService.selectJoinCourse();

		return select;
	}

}
