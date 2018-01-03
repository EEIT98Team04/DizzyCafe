package minghui.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import minghui.model.LoginService;
import minghui.model.MemberBean;

/**
 * Handles requests for the application file upload requests
 */
@Controller
public class RegisterController {
	@Autowired
	private LoginService loginService;

	@RequestMapping(path = "/register.controller", method = { RequestMethod.POST, RequestMethod.GET })
	public String uploadFileHandler(String memberName, String memberPassword1, String memberPhone,
			String memberEmail, String memberAddress, String memberBirth,MultipartFile memberPhoto, Model model) {

		MemberBean bean = new MemberBean();
		bean.setMemberName(memberName);
		bean.setMemberPassword(memberPassword1);
		bean.setMemberPhone(memberPhone);
		bean.setMemberEmail(memberEmail);
		bean.setMemberAddress(memberAddress);
		
		try {
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			bean.setMemberBirth(sf.parse(memberBirth));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//System.out.println(memberPhoto);
		if(loginService.register(bean)) {
			loginService.uploadServerFile(memberPhoto, bean);
			return "login.success";
		}else {
			model.addAttribute("error_register", "註冊失敗");
			return "login.error";
		}
	}

}
