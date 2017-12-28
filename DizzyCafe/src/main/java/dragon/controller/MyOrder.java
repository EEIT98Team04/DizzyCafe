package dragon.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;

import dragon.model.OrdersDetailsService;
import dragon.model.OrdersService;
import minghui.model.MemberBean;
import net.sf.json.JSONArray;

@Controller
public class MyOrder {
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private OrdersDetailsService ordersDetailsService;
	
	@RequestMapping(path="/myOrder.controller", method= {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody JSONArray myOrder(HttpSession session) {
		MemberBean bean = (MemberBean) session.getAttribute("user");
//		int memberId = bean.getMemberId();
		int memberId = 101;
		JSONArray json = ordersService.selectMemberToJson(memberId);
		System.out.println(json);
		return json;
	}
	
	@RequestMapping(path="/myOrderDetails.controller", method= {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody JSONArray myOrderDetails(String OrdersId) {
		int ordersId = Integer.valueOf(OrdersId);
		JSONArray json = ordersDetailsService.selectOrderDetails(ordersId);
		return json;
	}
}
