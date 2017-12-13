package applehead.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import applehead.model.ActivityListBean;
import applehead.model.ActivityListService;

@Controller
@RequestMapping("/activities")
public class ShowActivityInfo {
	@Autowired
	ActivityListService activityListService;
	
	//value="/{activityNo}",produces={"application/xml","application/json"} 
	@RequestMapping(method=RequestMethod.GET)
	public String getActivity(int No,Model model) {
		ActivityListBean bean = null;
		bean = activityListService.getBean(No+1000);
		if(bean!=null) {
			model.addAttribute("activityBean", bean);
			return "showActivity.success";
		}
		return "showActivity.failed";
	}
}
