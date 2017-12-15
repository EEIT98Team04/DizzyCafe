package minghui.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import minghui.model.LoginService;

@Controller
@RequestMapping("/register.controller")
public class RegisterController {
	@Autowired
	private LoginService loginService;
		
	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}



	@RequestMapping(method= {RequestMethod.GET,RequestMethod.POST})
	public String method(MultipartFile file) {
		System.out.println(file.isEmpty());
		
		return "login.success";
	}
}
