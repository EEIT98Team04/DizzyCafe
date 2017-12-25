package minghui.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import minghui.model.LoginService;
import minghui.model.MemberBean;

@Controller
public class MemberChangePhotoController {
	@Autowired
	private LoginService loginService;

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}
	
	@RequestMapping(path= {"/member/changePhoto.controller"}, method= {RequestMethod.POST,RequestMethod.GET})
	public String method(@RequestParam(name="change_memberPhoto")MultipartFile file, HttpSession session) {
		MemberBean bean = (MemberBean)session.getAttribute("user");
		if(loginService.uploadServerFile(file, bean)) {
			return "redirect:/minghui/member/member_center.jsp";
		}else {
			return "minghui/member/member_center";
		}
		
	}
}
