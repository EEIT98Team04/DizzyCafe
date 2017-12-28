package minghui.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import minghui.model.LoginService;
import minghui.model.MemberBean;

@Controller
@SessionAttributes(names={"user"})
public class LoginController {
	@Autowired
	private LoginService loginService;

	@RequestMapping(path= {"/login.controller"},method = { RequestMethod.GET, RequestMethod.POST })
	public String method(@RequestHeader(value = "referer", required = false) final String referer,
								HttpServletRequest request, String memberName, String memberPassword, Model model) {
		String[] str_array = referer.split(request.getContextPath());
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		MemberBean bean = loginService.login(memberName, memberPassword);

		// 依照執行結果挑選適當的View元件
		if (bean == null) {
			errors.put("xxx2", "帳號或密碼不正確");
			return "login.error";
		} else {
			model.addAttribute("user", bean);
			return "redirect:" + str_array[1];
		}
	}
	
	@RequestMapping(path= {"/fblogin.controller"},method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody boolean fbMethod(@RequestParam Map<?,?> param, Model model) {
		MemberBean bean = new MemberBean();
		bean.setMemberName((String)param.get("id"));
		bean.setMemberEmail((String)param.get("email"));
		bean.setMemberPhoto((String)param.get("picture[data][url]"));
		bean = loginService.login_fb(bean);
		
		if(bean == null) {
			bean = new MemberBean();
			bean.setMemberName((String)param.get("id"));
			bean.setMemberPassword((String)param.get("id"));
			bean.setMemberEmail((String)param.get("email"));
			try {
				SimpleDateFormat sf = new SimpleDateFormat("MM/dd/yyyy");
				bean.setMemberBirth(sf.parse((String)param.get("birthday")));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			bean.setMemberPhoto((String)param.get("picture[data][url]"));
			if(loginService.register(bean)) {
				model.addAttribute("user",bean);
				return true;
			}
		}
		
		
		model.addAttribute("user", bean);
		// 依照執行結果挑選適當的View元件
		return true;
	}
}
