package dragon.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import minghui.model.MemberBean;

@Controller
public class CheckoutController {

	@RequestMapping(path= {"/insertOrder.controller"}, method= {RequestMethod.GET, RequestMethod.POST})
	public void insertOrder(HttpSession session, String buyer, String shipPhone, String shipAddress
			, String storeName, String storAddress, String shipment, String ShipCost, String playment) {
		MemberBean bean = (MemberBean) session.getAttribute("user");
		int memberId = bean.getMemberId();
		int shipCost = Integer.valueOf(ShipCost);
	
		System.out.println("1");
	}
}
