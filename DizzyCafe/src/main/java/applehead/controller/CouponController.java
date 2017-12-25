package applehead.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import applehead.model.CouponService;
import minghui.model.MemberBean;
import net.sf.json.JSONArray;

@Controller
public class CouponController {
	@Autowired
	CouponService couponService;
	@RequestMapping(
				path="/coupons.controller",
				method= {RequestMethod.GET,RequestMethod.POST}
			)
	public @ResponseBody JSONArray postJSON(HttpSession session) {
		//memberId
		MemberBean bean = (MemberBean) session.getAttribute("user");
		
		couponService.updateDeadline(bean.getMemberId());
		JSONArray json = couponService.selectToJSON(bean.getMemberId());
		
		return json;
	}
}
