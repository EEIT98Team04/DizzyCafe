package dragon.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dragon.model.OrdersBean;

@Controller
@RequestMapping("/Checkout/Checkout.controller")
public class CheckoutController {

	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST})
	public String method(OrdersBean orders, BindingResult bindingResult, Model model)
	{
		/*bindingResult前面要放要驗證的欄位，才會驗證bean欄位是否正確*/
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		if(bindingResult != null && bindingResult.hasErrors())
		{
			if(bindingResult.getFieldError("buyer") != null)
			{
				errors.put("buyer.error", "姓名欄位格式有誤，請重新檢查!");
			}
			if(bindingResult.getFieldError("shipPhone") != null)
			{
				errors.put("shipPhone.error", "手機欄位格式有誤，請重新檢查!");
			}
			if(bindingResult.getFieldError("email") != null)
			{
				errors.put("email.error", "信箱欄位格式有誤，請重新檢查!");
			}
			if(bindingResult.getFieldError("shipAddress") != null)
			{
				errors.put("shipAddress.error", "運送地址欄位格式有誤，請重新檢查!");
			}
		}
		if(errors != null && !errors.isEmpty())
		{
			return "";
		}
		return null;
	}
}
