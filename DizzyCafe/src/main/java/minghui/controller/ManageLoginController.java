package minghui.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
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
	public String method(@RequestHeader(value = "referer", required = false) final String referer,
			HttpServletRequest request,String account, String pwd, Model model) {
		String[] str_array = referer.split(request.getContextPath());
		ManagerBean bean = managerLoginService.login(account, pwd);
		if (bean != null) {
			model.addAttribute("manager", bean);
			return "redirect:" + str_array[1];
		}
		model.addAttribute("error", "account or password is wrong");
		return "backstage.login.error";
	}
}
