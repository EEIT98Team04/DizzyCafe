package tingwei.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import minghui.model.MemberBean;
import net.sf.json.JSONArray;
import tingwei.model.CourseMemberService;

@Controller
@RequestMapping("/course/courseOfMemberController.controller")

public class CourseOfMemberController {
	
	@Autowired
	private CourseMemberService courseMemberService; 
	
	@RequestMapping(method= {RequestMethod.GET,RequestMethod.POST})
	public String method(Model model, int page, HttpSession session) {
		int row_num = 1;
		int rows_perPage = 4;
		
		int row_numStart = (row_num + (page - 1) * rows_perPage);
		int row_numEnd = (row_num + page * rows_perPage);
//		System.out.println("------------------------------");
//		System.out.println(page);
//		System.out.println(row_numStart);
//		System.out.println(row_numEnd);
//		System.out.println("------------------------------");
		
		
		MemberBean user = (MemberBean) session.getAttribute("user");
		System.out.println(user);
		int memberId = user.getMemberId();
		
//		JSONArray jsonArray = courseMemberService.selectByMemberId(memberId);
//		model.addAttribute("myCourse",jsonArray);
//		System.out.println(jsonArray);
		
		System.out.println("TotalPages:"+courseMemberService.countTotalPagesWithId(rows_perPage,memberId));
		System.out.println("courseList:"+courseMemberService.showMyCourseInPage(row_numStart, row_numEnd,memberId));
		System.out.println("courseNowPeople:"+courseMemberService.countMyNowPeople(memberId, row_numStart, row_numEnd,rows_perPage));
		
		model.addAttribute("TotalPages" ,courseMemberService.countTotalPagesWithId(rows_perPage,memberId));
		model.addAttribute("myCourse" ,courseMemberService.showMyCourseInPage(row_numStart, row_numEnd,memberId));
		model.addAttribute("courseNowPeople" ,courseMemberService.countMyNowPeople(memberId, row_numStart, row_numEnd,rows_perPage));
		
		return "myCourse";
	}
}
