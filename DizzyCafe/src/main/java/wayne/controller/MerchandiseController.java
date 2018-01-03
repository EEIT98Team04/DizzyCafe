package wayne.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import net.sf.json.JSONArray;
import wayne.model.MerchandiseBean;
import wayne.model.MerchandiseService;

@Controller
@RequestMapping(path= {"/merchandise.controller"})
@SessionAttributes(value= {"beans"})
public class MerchandiseController{
	
	@Autowired
	private MerchandiseService merchandiseService;
	
	@RequestMapping(method= {RequestMethod.POST,RequestMethod.GET})
	public String method(MerchandiseBean bean, Model model, BindingResult bindingresult ,int page, String tag) {
		//System.out.println("MerchandiseController");
		int rows_perPage = 6;
		JSONArray _merchnadise = merchandiseService.showMerchandiseInPage();
		
		model.addAttribute("beans" ,merchandiseService.ShowMerchandiseByPage(page, rows_perPage, _merchnadise));
		model.addAttribute("totalPages", merchandiseService.countTotalPages(rows_perPage, _merchnadise));
//		model.addAttribute("totalPages" ,merchandiseService.countTotalPages());	
//		model.addAttribute("beans" ,merchandiseService.showMerchandiseInPage(page));
		
		
		
		return "merchandise";
	}
	
		
	
	
	
}
