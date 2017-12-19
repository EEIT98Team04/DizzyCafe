package dragon.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dragon.model.ShoppingBean;
import dragon.model.ShoppingService;
import wayne.model.MerchandiseBean;
import wayne.model.MerchandiseService;

@Controller
@RequestMapping("/shopping/shoppingCart.controller")
public class ShoppingCartController {
	@Autowired
	private ShoppingService shoppingService;
	@Autowired
	private MerchandiseService merchandiseService;

	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST})
	public String method(Model model)
	{
		int memberId = 101;

		List<ShoppingBean> result = shoppingService.select(103);
		model.addAttribute("result", result);
//		System.out.println(result);
		
		model.addAttribute("count", result.size()-1);
//		System.out.println(result.size());
		List<String> merchandiseName = new ArrayList<>();
		List<Integer> merchandisePrice = new ArrayList<>();
		List<Integer> buyCount = new ArrayList<>();
		List<Integer> subtotal = new ArrayList<>();
		List<Object> ordersDetail = new ArrayList<>();
		List<Object> ordersDetail2 = ordersDetail;
		if (result != null) {
			for (ShoppingBean bean : result) {
				MerchandiseBean select = merchandiseService.select(bean.getMerchandiseId());
				// 商品名稱
				merchandiseName.add(select.getMerchandiseName());
//				 System.out.println(merchandiseName);
				 ordersDetail.add(0, select.getMerchandiseName());
				 
				// 商品單價
				merchandisePrice.add(select.getMerchandisePrice());
				// System.out.println(merchandisePrice);
				ordersDetail.add(1, select.getMerchandisePrice());

				//購買數量
				buyCount.add(bean.getBuyCount());
				// System.out.println(buyCount);
				ordersDetail.add(2, bean.getBuyCount());
				
				subtotal.add(select.getMerchandisePrice() * bean.getBuyCount());
//				System.out.println(select.getMerchandisePrice() * bean.getBuyCount());
				
			}
			model.addAttribute("merchandiseName", merchandiseName);
			model.addAttribute("merchandisePrice", merchandisePrice);
			model.addAttribute("buyCount", buyCount);
			model.addAttribute("subtotal", subtotal);
		}
		return "checkout";
	}
}
