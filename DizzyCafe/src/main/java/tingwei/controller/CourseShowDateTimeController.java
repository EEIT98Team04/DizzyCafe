//package tingwei.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import tingwei.model.CourseDateTimeBean;
//import tingwei.model.CourseDateTimeService;
//
//@Controller
//@RequestMapping("/course/courseShowDateTime.controller")
//public class CourseShowDateTimeController {
//	
//	@Autowired
//	private CourseDateTimeService courseDateTimeService;
//	
//	//Show 課程時間
//	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST})
//	public String method(Model model) {
//		List<CourseDateTimeBean> beans = courseDateTimeService.select();
//
//		System.out.println("CourseShowDateTimeController beans:"+beans);
//		
//		if(beans!=null) {
//			model.addAttribute("courseDateTime",beans);
//			return "showCourseDateTimeSuccess";
//		}
//		return "courseList.return";
//	}
//}
