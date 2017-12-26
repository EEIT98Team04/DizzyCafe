package dragon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import allPay.payment.integration.AllInOne;
import allPay.payment.integration.domain.AioCheckOutOneTime;

@Controller
@RequestMapping("/oPayment.controller")
public class oPayment {
	
	@RequestMapping(method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody String genAioCheckOutOneTime(){
		AllInOne oPayment = new AllInOne("");
//		String result = aioCheckOutOneTime(oPayment);
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		obj.setMerchantID("2000132");
		obj.setMerchantTradeNo("allPay1234");
		obj.setMerchantTradeDate("2017/01/01 08:05:23");
		obj.setTotalAmount("5000");
		obj.setTradeDesc("allPay 商城購物");
		obj.setItemName("手機 20 元 X2#隨身碟\r\n" + 
				"60 元 X1\r\n" + 
				"");
		obj.setReturnURL("/DizzyCafe/dragon/test2.jsp");
		obj.setNeedExtraPaidInfo("N");
		obj.setHoldTradeAMT("0");
		obj.setUseRedeem("N");
		obj.setRedeem("Y");
		String form = oPayment.aioCheckOut(obj, null);
		return form;
//		return result;
	}
	
	public String aioCheckOutOneTime(AllInOne oPayment) {
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		obj.setMerchantID("2000132");
		obj.setMerchantTradeNo("allPay1234");
		obj.setMerchantTradeDate("2017/01/01 08:05:23");
		obj.setTotalAmount("5000");
		obj.setTradeDesc("allPay 商城購物");
		obj.setItemName("手機 20 元 X2#隨身碟\r\n" + 
				"60 元 X1\r\n" + 
				"");
		obj.setReturnURL("/DizzyCafe/dragon/test2.jsp");
		obj.setNeedExtraPaidInfo("N");
		obj.setHoldTradeAMT("0");
		obj.setUseRedeem("N");
		obj.setRedeem("Y");
		String form = oPayment.aioCheckOut(obj, null);
		return form;
	}
}
