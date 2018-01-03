package wayne.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import net.sf.json.JSONArray;
import wayne.model.MerchandiseService;


@Controller
@RequestMapping(path= {"/merchandisetag.controller"})
@SessionAttributes(value= {"beansTag"})
public class MerchandiseTagController {
	
    @Autowired
	MerchandiseService merchandiseService;
	
    @RequestMapping(method= {RequestMethod.POST, RequestMethod.GET})
	public String method(Model model, int page, String tag) {
    	//System.out.println("MerchandiseTagController");
    	int rows_perPage = 6;
    	
    	JSONArray _merchandiseTag = merchandiseService.showMerchandiseInPageTag(tag);
    	
    	model.addAttribute("beansTag", merchandiseService.ShowMerchandiseByPage(page, rows_perPage, _merchandiseTag));
    	model.addAttribute("totalPagesTag", merchandiseService.countTotalPages(rows_perPage, _merchandiseTag));
    	

		return "merchandiseTag";
		
	}
}
