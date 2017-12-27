package dragon.controller;
<<<<<<< HEAD

import java.util.HashMap;
import java.util.Map;

=======

>>>>>>> branch 'master' of https://github.com/EEIT98Team04/DizzyCafe.git
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import allPay.payment.integration.AllInOne;
import allPay.payment.integration.allPayOperator.AllPayFunction;
import allPay.payment.integration.domain.AioCheckOutALL;

@Controller
@RequestMapping("/oPayment.hohoho")
public class oPayment {
	
	@RequestMapping(method= {RequestMethod.POST})
	public String oPaygogo(String MerchantID,String MerchantTradeNo,
			String MerchantTradeDate,String TotalAmount,Model model,
			String TradeDesc,String ItemName,String ReturnURL){
//		AioCheckOutALL obj = new AioCheckOutALL();
//		obj.setMerchantID(MerchantID);
//		obj.setMerchantTradeNo(MerchantTradeNo);
//		obj.setMerchantTradeDate(MerchantTradeDate);
//		obj.setTotalAmount(TotalAmount);
//		obj.setTradeDesc(TradeDesc);
//		obj.setItemName(ItemName);
//		obj.setReturnURL(ReturnURL);
		Map<String, String> temp = new HashMap<>();
		temp.put("ItemName", ItemName);
		temp.put("MerchantID", MerchantID);
		temp.put("MerchantTradeDate", MerchantTradeDate);
		temp.put("MerchantTradeNo", MerchantTradeNo);
		temp.put("ReturnURL", ReturnURL);
		temp.put("TotalAmount", TotalAmount);
		temp.put("TradeDesc", TradeDesc);
		String checkMacValue = AllPayFunction.genCheckMacValue("5294y06JbISpM5x9", "v77hoKGq4kWxNNIS" , temp);
		model.addAttribute("MerchantID", MerchantID);
		model.addAttribute("MerchantTradeNo", MerchantTradeNo);
		model.addAttribute("MerchantTradeDate", MerchantTradeDate);
		model.addAttribute("TotalAmount", TotalAmount);
		model.addAttribute("TradeDesc", TradeDesc);
		model.addAttribute("ItemName", ItemName);
		model.addAttribute("ReturnURL", ReturnURL);
		model.addAttribute("CheckMacValue", checkMacValue);
		return "test.test";
	}
}
