package tingwei.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/sameAsMemberDataController.controller")

public class SameAsMemberDataController {
	
	
	@RequestMapping(method= {RequestMethod.GET,RequestMethod.POST})
	public String method() {
		
		return null;
	}
	
}
