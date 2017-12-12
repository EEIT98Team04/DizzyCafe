//package applehead.controller;
//
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import applehead.model.CouponBean;
//import applehead.model.CouponService;
//
//@Controller
//@RequestMapping(path="/coupons.controller")
//public class ShowCouponInfo {
//	@Autowired
//	CouponService couponservice;
//	
//	@RequestMapping(method=RequestMethod.GET)
//	public String couponInfo(HttpSession session) {
//		//還沒更新memberId
//		session.getAttribute("user");
//		List<CouponBean> temp = couponservice.updateDeadline(102);
//		System.out.println(temp);
//		return "showCoupon.success";
//	}
//}
