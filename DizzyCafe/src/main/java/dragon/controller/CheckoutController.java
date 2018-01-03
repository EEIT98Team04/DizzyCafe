package dragon.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dragon.model.OrdersBean;
import dragon.model.OrdersDetailsService;
import dragon.model.OrdersService;
import dragon.model.ShoppingService;
import minghui.model.MemberBean;

@Controller
public class CheckoutController {

	@Autowired
	private OrdersService ordersService;
	@Autowired
	private OrdersDetailsService ordersDetailsService;
	@Autowired
	private ShoppingService shoppingService;

	@RequestMapping(path = { "/insertOrder.controller" }, method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String insertOrder(HttpSession session, String buyer, String shipPhone, String ShipAddress, String StoreName,
			String shipment, String ShipCost, String playment) {
		MemberBean bean = (MemberBean) session.getAttribute("user");
		int memberId = bean.getMemberId();
		String BuyerEmail = bean.getMemberEmail();
		int shipCost = Integer.valueOf(ShipCost);

		String StorAddress = "無";
		/* 要用equals */
		if ("貨到付款".equals(shipment) || "超商取貨".equals(shipment)) {
			if ("德欣門市".equals(StoreName)) {
				StorAddress = "基隆市中山區復興路328號之6號之7號1樓";
			} else if ("德復門市".equals(StoreName)) {
				StorAddress = "基隆市中山區復興路197號";
			}
		}
		OrdersBean order = new OrdersBean();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String data = simpleDateFormat.format(new Date());

		/* 新增訂單 */
		order.setMemberId(memberId);
		order.setOrdersDate(data);
		order.setBuyerEmail(BuyerEmail);
		order.setBuyer(buyer);
		order.setShipPhone(shipPhone);
		order.setShipAddress(ShipAddress);
		order.setStoreName(StoreName);
		order.setStoreAddress(StorAddress);
		order.setShipStyle(shipment);
		order.setShipCost(shipCost);
		order.setTotalPrice(10000);
		order.setPaymentStyle(playment);
		order.setOrdersStatusId("a");
		ordersService.insertOrders(order);
		//
		// /* 新增訂單明細 */
		ordersDetailsService.insertDetails(memberId);
		//
		// /* 刪除購物車資料 */
		shoppingService.deleteAll(memberId);
		
		return "success";
	}
}
