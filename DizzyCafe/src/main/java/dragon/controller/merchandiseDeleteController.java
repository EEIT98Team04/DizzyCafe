package dragon.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dragon.model.ShoppingBean;
import dragon.model.ShoppingService;
import minghui.model.MemberBean;

@Controller
public class merchandiseDeleteController {
	@Autowired
	private ShoppingService shoppingService;
	
	@RequestMapping(path="/merchandiseDelete.controller", method= {RequestMethod.GET, RequestMethod.POST})
	public void merchandiseDelete(HttpSession session, String MerchandiseId) {
		System.out.println(MerchandiseId);
		MemberBean bean = (MemberBean) session.getAttribute("user");
		int memberId = bean.getMemberId();
		int merchandiseId = Integer.valueOf(MerchandiseId);
		ShoppingBean selectmerchandise = shoppingService.selectMerchandise(memberId, merchandiseId);
		shoppingService.deletemerchandise(selectmerchandise);
		shoppingService.select(memberId);
	}
}
