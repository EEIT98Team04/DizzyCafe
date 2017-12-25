package dragon.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import allPay.payment.integration.AllInOne;
import allPay.payment.integration.domain.AioCheckOutOneTime;

@Controller
@RequestMapping("/oPayment")
public class oPayment {
	
	
	private static AllInOne oPayment;
	
	private static void initial() {
		oPayment = new AllInOne("");

	}
	@RequestMapping(method= {RequestMethod.POST})
	public void method() {
		System.out.println("aioCheckOutOneTime: " + genAioCheckOutOneTime());
	}	
	public static String genAioCheckOutOneTime(){
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		obj.setMerchantTradeNo("testCompany0008");
		obj.setMerchantTradeDate("2017/01/01 08:05:23");
		obj.setTotalAmount("50");
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setNeedExtraPaidInfo("N");
		obj.setHoldTradeAMT("0");
		obj.setUseRedeem("N");
		obj.setRedeem("Y");
		String form = oPayment.aioCheckOut(obj, null);
		return form;
	}
}
