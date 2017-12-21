package applehead.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import applehead.model.ActivityListService;
import net.sf.json.JSONArray;

@Controller
public class BackStageShowActivities {
	@Autowired
	ActivityListService activityListService;
	
	@RequestMapping(
				path="/showyou.controller",
				method= {RequestMethod.GET,RequestMethod.POST}
			)
	public @ResponseBody JSONArray haha(Model model,String page) {
		return activityListService.showActivityInBackstage();
	}
}
