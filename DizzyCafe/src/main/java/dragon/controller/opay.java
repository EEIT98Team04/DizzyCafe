package dragon.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import allPay.payment.integration.AllInOne;
import allPay.payment.integration.domain.AioCheckOutOneTime;
import allPay.payment.integration.domain.InvoiceObj;
import allPay.payment.integration.exception.AllPayException;
@Controller
public class opay {
	AllInOne all;
	
	@RequestMapping(value = "/checkoutjiijij.controller", method = RequestMethod.POST, produces="text/html;charset=UTF-8")
	public @ResponseBody String aioCheckOutDevide(AioCheckOutOneTime aio){
		all = new AllInOne("");
		System.out.println(aio.getRemark());
		InvoiceObj invoice = new InvoiceObj();
		//模擬不開發票
		invoice = null;
		//廠商系統自行產生
		aio.setMerchantTradeNo(UUID.randomUUID().toString().replaceAll("-", "").substring(0, 20));
		Date date = new Date();
		//廠商可自行決定交易時間
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		aio.setMerchantTradeDate(sdf.format(date));
		//從廠商DB撈出的商品資訊
		aio.setItemName("item1");
		aio.setTotalAmount("50");
		aio.setTradeDesc("item desc");
		//廠商可自行決定是否延遲撥款
		aio.setHoldTradeAMT("0");
		//後端設定付款完成通知回傳網址
		aio.setReturnURL("http://211.23.128.214:5000");
		try{
			String html = all.aioCheckOut(aio, invoice);
			System.out.println(html);
			return html;
		} catch(AllPayException e){
			throw new Error(e.getNewExceptionMessage());
		}
	}
}
