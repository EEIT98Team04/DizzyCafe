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
		MemberBean user = (MemberBean) session.getAttribute("user");
		int memberId = user.getMemberId(); //取課程資料
		int rows_perPage = 6;
		JSONArray _Course = courseMemberService.showMyCourseInPage(memberId);
		JSONArray myCourse = courseMemberService.ShowCourceByPage(page,rows_perPage,_Course);

		model.addAttribute("myCourse" ,myCourse); //本頁顯示課程
		model.addAttribute("rows" ,myCourse.size()); //本頁顯示課程	
		model.addAttribute("TotalPages" ,courseMemberService.countTotalPagesWithId(rows_perPage,_Course)); //計算總頁數
		model.addAttribute("rows_perPage" ,rows_perPage); //一頁幾筆資料
		
		//model.addAttribute("courseNowPeople" ,courseMemberService.countMyNowPeople(memberId, row_numStart, row_numEnd,rows_perPage));
		
		return "myCourse";
	}
	
	@RequestMapping(path="/course/quitCourse.controller", method= {RequestMethod.GET,RequestMethod.POST}, produces="text/html; charset=utf-8")
	public @ResponseBody String quitCourse(int memberId, int courseId){
			courseMemberService.quitCourse(memberId,courseId);		
		return "期待下次看到你喔QAQ";
	}
}

