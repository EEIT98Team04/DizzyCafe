package wayne.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dragon.model.ShoppingBean;
import dragon.model.ShoppingService;
import minghui.model.MemberBean;
import net.sf.json.JSONArray;

@Controller
public class AddCartController {
	
	@Autowired
	ShoppingService shoppingService;
	
	@RequestMapping(path="/insertCart.controller",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody JSONArray insertCart(HttpSession session, String buyCount, String merchandiseId) {
		
//		//System.out.println(buyCount);
//		//System.out.println(merchandiseId);
		
		MemberBean bean = (MemberBean) session.getAttribute("user");
		int memberId = bean.getMemberId();
//		//System.out.println(memberId);
		
		int count = shoppingService.insert(memberId, Integer.valueOf(merchandiseId), Integer.valueOf(buyCount));
		
		if(count == 0) {
			ShoppingBean shoppingbean = shoppingService.selectMerchandise(memberId, Integer.valueOf(merchandiseId));
			shoppingbean.setBuyCount(shoppingbean.getBuyCount()+ Integer.valueOf(buyCount));
			shoppingService.updateCart(shoppingbean);
		}
		JSONArray Json = shoppingService.selectMerchandiseList(memberId);
		//System.out.println(Json);
		return Json;
	}
	
	@RequestMapping(path="/selectCart.controller",method= {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody JSONArray selectCart(HttpSession session) {
		MemberBean bean = (MemberBean) session.getAttribute("user");
		int memberId = bean.getMemberId();
		
		JSONArray Json = shoppingService.selectMerchandiseList(memberId);
//		//System.out.println(Json);
		return Json;
		
	}
	
	@RequestMapping(path="/deleteCart.controller",method= {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody JSONArray deleteCart(HttpSession session, String merchandiseId) {
		//System.out.println(merchandiseId);
		//System.out.println("1");
		MemberBean bean = (MemberBean) session.getAttribute("user");
		int memberId = bean.getMemberId();
		int merchandiseid = Integer.valueOf(merchandiseId);
		ShoppingBean selectMerchandise = shoppingService.selectMerchandise(memberId, merchandiseid);
		shoppingService.deletemerchandise(selectMerchandise);
		JSONArray Json = shoppingService.selectMerchandiseList(memberId);
		return Json;
	}
}
