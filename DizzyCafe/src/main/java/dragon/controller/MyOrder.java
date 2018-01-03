package dragon.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;

import dragon.model.OrdersService;
import minghui.model.MemberBean;
import net.sf.json.JSONArray;

@Controller
public class MyOrder {
	@Autowired
	private OrdersService ordersService;
	
	@RequestMapping(path="/myOrder.controller", method= {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody JSONArray myOrder(HttpSession session) {
		MemberBean bean = (MemberBean) session.getAttribute("user");
//		int memberId = bean.getMemberId();
		int memberId = 102;
		JSONArray json = ordersService.selectMemberToJson(memberId);
		//System.out.println(json);
		return json;
	}
}
