package minghui.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import minghui.model.LoginService;
import minghui.model.MemberBean;

@Controller
@RequestMapping(path= {"/changePasswordController.controller"})
@SessionAttributes(names={"user"})
public class ChangePasswordController {
	@Autowired
	private LoginService service;
	
	@RequestMapping(method= {RequestMethod.POST})
	public String method(String memberName, String newPwd, Model model) {
		MemberBean bean = service.changePwd(memberName, newPwd);
		model.addAttribute("user", bean);
		return "login.success";
	}
}
