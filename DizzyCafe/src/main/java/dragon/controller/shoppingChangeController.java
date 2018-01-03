package dragon.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import dragon.model.ShoppingBean;
import dragon.model.ShoppingService;
import minghui.model.MemberBean;
import net.sf.json.JSONArray;
import wayne.model.MerchandiseBean;
import wayne.model.MerchandiseService;

class shoppinglist{
	public String merchandiseName;
	public int merchandisePrice;
	public int buyCount;
}
@Controller
public class shoppingChangeController {
	@Autowired
	private ShoppingService shoppingService;
	@Autowired
	private MerchandiseService merchandiseService;

	@RequestMapping(path = "/selectShopping.controller", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody JSONArray selectShopping(HttpSession session) {
		MemberBean bean = (MemberBean) session.getAttribute("user");
		int memberId = bean.getMemberId();
		JSONArray json = shoppingService.selectMerchandiseList(memberId);
		return json;
		
	}
	@RequestMapping(path = "/merchandiseDelete.controller", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody JSONArray merchandiseDelete(HttpSession session, String MerchandiseId) {
		/*要使用@ResponseBody，因為只是要回傳值並不是回傳view，只是要回傳一部分不需要全部回傳，所以要使用@ResponseBody註解*/
		// //System.out.println(MerchandiseId);
		/* 抓取當前會員Id */
		MemberBean bean = (MemberBean) session.getAttribute("user");
		/* 轉成正確型態 */
		int memberId = bean.getMemberId();
		int merchandiseId = Integer.valueOf(MerchandiseId);
		/* 搜尋此會員點選自己購物車的此項商品 */
		ShoppingBean selectmerchandise = shoppingService.selectMerchandise(memberId, merchandiseId);
		/* 將此商品從資料庫刪掉 */
		shoppingService.deletemerchandise(selectmerchandise);

		/*利用Service使用DAO方法拿取JSON型態的回傳值，包覆著商品名稱、商品價格和購買數量*/
		JSONArray json = shoppingService.selectMerchandiseList(memberId);
		/*測試是否有拿到*/
//		//System.out.println(json);	
		return json;

	}

	@RequestMapping(path = "/amountChange.controller", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody void amountChange(HttpSession session, String MerchandiseId, String Amount) {
		// //System.out.println("1");
		MemberBean bean = (MemberBean) session.getAttribute("user");
		int memberId = bean.getMemberId();
		int merchandiseId = Integer.parseInt(MerchandiseId);
		int amount = Integer.parseInt(Amount);
		ShoppingBean selectmerchandise = shoppingService.selectMerchandise(memberId, merchandiseId);
		shoppingService.changeCount(selectmerchandise, amount);
		// //System.out.println("end");
	}
}
