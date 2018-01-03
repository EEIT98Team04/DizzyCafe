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
public class CheckoutController2 {

	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST})
	public String method(String buyer, String shipPhone, String shipAddress, Model model)
	{
		/*bindingResult前面要放要驗證的欄位，才會驗證bean欄位是否正確*/
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		
		if(buyer==null && buyer.trim().length() == 0)
		{
			errors.put("buyerError", "姓名欄位格式有誤，請重新檢查!");
		}
		if(shipPhone==null && shipPhone.trim().length() == 0)
		{
			errors.put("shipPhoneError", "手機欄位格式有誤，請重新檢查!");
		}
		if(shipAddress==null && shipAddress.trim().length() == 0)
		{
			errors.put("shipAddressError", "運送地址欄位格式有誤，請重新檢查!");
		}
		
//		if(bindingResult != null && bindingResult.hasErrors())
//		{
//			if(bindingResult.getFieldError("buyer") != null)
//			{
//				errors.put("buyerError", "姓名欄位格式有誤，請重新檢查!");
//			}
//			if(bindingResult.getFieldError("shipPhone") != null)
//			{
//				errors.put("shipPhoneError", "手機欄位格式有誤，請重新檢查!");
//			}
//			if(bindingResult.getFieldError("shipAddress") != null)
//			{
//				errors.put("shipAddressError", "運送地址欄位格式有誤，請重新檢查!");
//			}
//		}
		System.out.println("3");
		if(errors != null && !errors.isEmpty())
		{
			System.out.println("4");
			return "checkout";
		}
		System.out.println("5");
		return "shopping.cart";
	}
}
