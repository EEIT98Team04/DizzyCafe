package tingwei.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tingwei.model.CourseMemberService;
import tingwei.model.CourseService;

@Controller
public class CheckSignedAndTimeController {
		
	@Autowired
	CourseMemberService courseMemberService;
	@Autowired
	CourseService courseService;
		
	@RequestMapping(path="/course/CheckTimeAndLimitController.controller",
					method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody String checkTime(int courseId) {
		boolean signUpTime = courseMemberService.checkSignedUpTime(courseId);
		int limit = courseService.getLimitByCourseId(courseId);
		int nowPeople = courseMemberService.getNowPeopleByCourseId(courseId);
		//System.out.println("limit"+limit);
		//System.out.println("nowPeople"+nowPeople);
		if(!signUpTime) {
			return "TimeError";
		}else if(nowPeople>=limit){
			return "limited";
		}else
			return "ok";
	}
	
	@RequestMapping(path="/course/CheckSignedController.controller",
			method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody String checkSigned(int memberId, int courseId) {
		boolean signedUp = courseMemberService.checkSignedUp(memberId, courseId);
		//System.out.println("signedUp:"+signedUp);
		if(signedUp) {
			return "alreadySignedUp";
		}else
			return "ok";
	}
}

