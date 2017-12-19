package applehead.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import applehead.model.CouponBean;
import applehead.model.CouponService;
import applehead.model.DailyEventService;
import minghui.model.LoginService;
import minghui.model.MemberBean;
import net.sf.json.JSONArray;

@Controller
public class DailyEventController {
	
	@Autowired
	DailyEventService dailyEventService;
	@Autowired
	CouponService couponService;
	@Autowired
	LoginService memberService;
	@RequestMapping(path="/getItem.controller",method= {RequestMethod.GET})
	public @ResponseBody JSONArray gogoArray() {
		JSONArray result = null;
		result = dailyEventService.selectJSON();
		return result;
	}
	@RequestMapping(path="/dailyEvent.controller",method= {RequestMethod.POST})
	public @ResponseBody void selectEventItems(String prize,String discount,HttpSession session) {
		MemberBean bean = (MemberBean)session.getAttribute("user");
		MemberBean temp = null;
		if(!"87".equals(prize)) {	
			if(bean!=null) {
				CouponBean insert = new CouponBean();
				insert.setMemberId(bean.getMemberId());
				insert.setCouponStatus(0);
				insert.setEventDiscount(Double.parseDouble(discount));
				insert.setMerchandiseId(Integer.valueOf(prize));
				insert.setCouponDeadline(new java.sql.Date(System.currentTimeMillis()+86400000*30));
				couponService.insertCoupon(insert);
				temp = memberService.updateDailyEvent(bean);
				session.setAttribute("user", temp);				
			}
		}else {
			if(bean!=null) {
			temp = memberService.updateDailyEvent(bean);
			session.setAttribute("user", temp);
			}
		}
	}
}
