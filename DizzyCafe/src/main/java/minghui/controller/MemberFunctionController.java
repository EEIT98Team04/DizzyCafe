package minghui.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/logout.controller")
public class MemberFunctionController {
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET })
	public String method(String option, HttpSession session) {
		if("logout".equals(option)) {
			session.invalidate();
			return "login.success";
		}
		
		return "login.success";
	}
}
