package minghui.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import minghui.model.LoginService;
import minghui.model.MemberBean;

@Controller
public class MemberChangeInfoController {
	@Autowired
	private LoginService loginService;
			
	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}


	@RequestMapping(path= {"/member/changeInfo.controller"}, method= {RequestMethod.POST})
	public @ResponseBody boolean method(HttpSession session,String member_telphone, String member_email, String member_address) {
		MemberBean user = (MemberBean)session.getAttribute("user");
		//System.out.println("user : " + user);
		user.setMemberPhone(member_telphone);
		user.setMemberEmail(member_email);
		user.setMemberAddress(member_address);
		loginService.update_member_info(user);
		return true;
	}
}
