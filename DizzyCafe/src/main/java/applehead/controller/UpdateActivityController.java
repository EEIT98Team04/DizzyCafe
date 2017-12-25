package applehead.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import applehead.model.ActivityListService;

@Controller
public class UpdateActivityController {
	
	@Autowired
	ActivityListService activityListService;
	@RequestMapping(
				path="/updateEvent.controller",
				method= {RequestMethod.POST}
			)
	public void updateActivity() {
		
		
//		activityListService.updateActivity(bean);
	}
}
