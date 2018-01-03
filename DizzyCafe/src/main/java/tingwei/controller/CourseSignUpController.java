package tingwei.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import minghui.model.MemberBean;
import tingwei.model.CourseMemberBean;
import tingwei.model.CourseMemberService;

@Controller
public class CourseSignUpController {
	
	@Autowired
	private CourseMemberService courseMemberService;
	
	@RequestMapping(
			path="/course/courseSignUpController.controller",
			method= {RequestMethod.GET,RequestMethod.POST})
	public String method(HttpSession session, int courseId, String phone, String email) {
		MemberBean user = (MemberBean) session.getAttribute("user");
		int memberId = user.getMemberId();
		CourseMemberBean bean = new CourseMemberBean();
		bean.setMemberId(memberId);
		bean.setCourseId(courseId);
		bean.setMemberPhone(phone);
		bean.setMemberEmail(email);
		//System.out.println(bean);
		courseMemberService.insert(bean);
		return "courseList.return";
	}
}