package tingwei.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import minghui.model.MemberBean;
import net.sf.json.JSONArray;
import tingwei.model.CourseMemberService;

@Controller
public class CourseOfMemberController {
	
	@Autowired
	private CourseMemberService courseMemberService; 
	
	@RequestMapping(path="/course/courseOfMemberController.controller", method= {RequestMethod.GET,RequestMethod.POST})
	public String showMemberCourse(Model model, int page, HttpSession session) {
		int row_num = 1;
		int rows_perPage = 4;
		
		int row_numStart = (row_num + (page - 1) * rows_perPage);
		int row_numEnd = (row_num + page * rows_perPage);		
		
		MemberBean user = (MemberBean) session.getAttribute("user");
		int memberId = user.getMemberId();

		model.addAttribute("TotalPages" ,courseMemberService.countTotalPagesWithId(rows_perPage,memberId));
		model.addAttribute("myCourse" ,courseMemberService.showMyCourseInPage(row_numStart, row_numEnd,memberId));
		model.addAttribute("courseNowPeople" ,courseMemberService.countMyNowPeople(memberId, row_numStart, row_numEnd,rows_perPage));
		
		return "myCourse";
	}
	
	@RequestMapping(path="/course/quitCourse.controller", method= {RequestMethod.GET,RequestMethod.POST}, produces="text/html; charset=utf-8")
	public @ResponseBody String quitCourse(int memberId, int courseId){
			courseMemberService.quitCourse(memberId,courseId);		
		return "期待下次看到你喔QAQ";
	}
}
