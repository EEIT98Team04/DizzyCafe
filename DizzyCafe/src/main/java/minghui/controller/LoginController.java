package minghui.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import minghui.model.LoginService;
import minghui.model.MemberBean;

@Controller
@RequestMapping("/login.controller")
@SessionAttributes(names={"user"})
public class LoginController {
	@Autowired
	private LoginService service;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String method(String memberName, String memberPassword, Model model) {
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		MemberBean bean = service.login(memberName, memberPassword);

		// 依照執行結果挑選適當的View元件
		if (bean == null) {
			errors.put("xxx2", "帳號或密碼不正確");
			return "login.error";
		} else {
			model.addAttribute("user", bean);
			return "login.success";
		}
	}

}
