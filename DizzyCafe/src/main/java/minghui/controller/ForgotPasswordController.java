package minghui.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import minghui.model.LoginService;
import minghui.model.MemberBean;

@Controller
@RequestMapping(path= {"/forgotPassword.controller"})
@SessionAttributes(names={"user"})
public class ForgotPasswordController {
	@Autowired
	private LoginService loginService;
			
	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}

	@RequestMapping(method= {RequestMethod.POST}, produces= {"text/html;charset=utf-8"})
	public @ResponseBody String sendEmail(String memberEmail) {
		if(loginService.forgot_password_send_email(memberEmail)) {
			return "信件已寄出";
		} else {
			return "信件寄出失敗";
		}
			
	}
	
	@RequestMapping(method= {RequestMethod.GET})
	public String verify(String vc, Model model) {
		MemberBean bean = loginService.verify_password(vc);
		if(bean != null) {
			model.addAttribute("user",bean);
			return "change.password";
		}
		return "index";			
	}
}
