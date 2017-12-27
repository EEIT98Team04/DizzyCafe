package minghui.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManagerLogoutController {
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET },path= {"/backstage/logout.controller"})
	public String method(HttpSession session) {
		session.invalidate();		
		return "backstage.logout";
	}
}
