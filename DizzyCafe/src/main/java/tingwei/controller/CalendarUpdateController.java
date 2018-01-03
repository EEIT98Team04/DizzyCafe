package tingwei.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tingwei.model.CalendarJSON;
import tingwei.model.CourseDateTimeService;

@Controller
public class CalendarUpdateController {
		
	@Autowired
	CourseDateTimeService courseDateTimeService;
		
	@RequestMapping(path="/backstage/CalendarUpdate.controller",
					method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody void CalendarUpdate(@RequestBody List<CalendarJSON> moment) {
		//System.out.println("moment"+moment.get(0).getColor());

		courseDateTimeService.deleteAll();
		courseDateTimeService.insertAll(moment);
		
	}
}