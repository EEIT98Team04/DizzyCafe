package minghui.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import minghui.model.ManagerBean;
import minghui.model.ManagerLoginService;

@Controller
@SessionAttributes(names = { "manager" })
public class ManageLoginController {
	@Autowired
	private ManagerLoginService managerLoginService;

	@RequestMapping(path = { "/backstage/login.controller" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String method(String account, String pwd, Model model) {
		ManagerBean bean = managerLoginService.login(account, pwd);
		if (bean != null) {
			model.addAttribute("manager", bean);
			return "backstage.login.success";
		}
		model.addAttribute("error", "account or password is wrong");
		return "backstage.login.error";
	}
}
