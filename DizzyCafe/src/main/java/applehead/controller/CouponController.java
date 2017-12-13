package applehead.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import applehead.model.CouponService;
import net.sf.json.JSONArray;

@Controller
public class CouponController {
	@Autowired
	CouponService couponService;
	@RequestMapping(
				path="/coupons",
				method= {RequestMethod.GET,RequestMethod.POST}
			)
	public @ResponseBody JSONArray postJSON(HttpSession session) {
		//memberId
		session.getAttribute("user");
		
		couponService.updateDeadline(102);
		JSONArray json = couponService.selectToJSON(102);
		
		System.out.println(json);
		return json;
	}
}
