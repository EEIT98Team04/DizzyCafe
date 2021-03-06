package applehead.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import applehead.model.ActivityListBean;
import applehead.model.ActivityListService;

@Controller
public class ActivityController {
	@Autowired
	ActivityListService activityListService;
	
	@RequestMapping(
				path="/activity.controller",
				method= {RequestMethod.GET,RequestMethod.POST}
			)
	public String haha(Model model,String page) {
		if(page==null || page.equals("")) {
			return "showActivity.failed";
		}
		List<ActivityListBean> result = activityListService.showPageItems(Integer.valueOf(page)-1);
		System.out.println(result);
		model.addAttribute("items", result);
		model.addAttribute("totalPage", activityListService.calculateTotalPage());

		return "activity.hihi";
	}
	
}
