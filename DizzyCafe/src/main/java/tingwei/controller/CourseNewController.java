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
		
		CourseDateTimeBean courseDateTimeBean = new CourseDateTimeBean();
		
		courseService.insert(couresBean);
		
		for(String var : whichDay) {
			System.out.println(var);
		}
		CourseBean temp = courseService.selectByName(couresBean.getCourseName()).get(0);
		courseDateTimeBean.setCourseId(temp.getCourseId());
		
		Calendar cal1 = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		cal1.setTime(temp.getCourseBegin());
		cal2.setTime(temp.getCourseEnd());
		
		
		//時間在範圍內的話
		for(;cal1.getTimeInMillis()<cal2.getTimeInMillis();cal1.add(Calendar.DATE, 1)) {
			//day_in_week等於選擇的上課時間的話
			for(String var : whichDay) {
				if(cal1.get(Calendar.DAY_OF_WEEK)==Integer.valueOf(var)) {
					courseDateTimeBean.setCourseStartTime(new java.sql.Timestamp(cal1.getTimeInMillis()
							+Integer.valueOf(time)*3600000));
					courseDateTimeBean.setCourseEndTime(new java.sql.Timestamp(cal1.getTimeInMillis()
							+(Integer.valueOf(time)+courseLength)*3600000));
					System.out.println(courseDateTimeBean);
					courseDateTimeService.insert(courseDateTimeBean);
				}
			}
		}
		
		return "courseList";
	}

}
