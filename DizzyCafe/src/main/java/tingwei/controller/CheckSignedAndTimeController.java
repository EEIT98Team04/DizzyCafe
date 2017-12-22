package tingwei.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tingwei.model.CourseMemberService;

@Controller
public class CheckSignedAndTimeController {
		
	@Autowired
	CourseMemberService courseMemberService;
		
	@RequestMapping(path="/course/CheckTimeController.controller",
					method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody String checkTime(int courseId) {
		boolean signUpTime = courseMemberService.checkSignedUpTime(courseId);
		if(!signUpTime) {
			return "TimeError";
		}else
			return "ok";
	}
	
	@RequestMapping(path="/course/CheckSignedController.controller",
			method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody String checkSigned(int memberId, int courseId) {
		boolean signedUp = courseMemberService.checkSignedUp(memberId, courseId);
		System.out.println("signedUp:"+signedUp);
		if(signedUp) {
			return "alreadySignedUp";
		}else
			return "ok";
	}
}

