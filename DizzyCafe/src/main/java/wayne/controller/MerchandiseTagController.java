package wayne.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import wayne.model.MerchandiseService;


@Controller
@RequestMapping(path= {"/merchandisetag.controller"})
public class MerchandiseTagController {
	
    @Autowired
	MerchandiseService merchandiseService;
	
    @RequestMapping(method= {RequestMethod.POST, RequestMethod.GET})
	public String method(Model model, int page, String tag) {
    	
    	model.addAttribute("beansTag", merchandiseService.showMerchandiseInPageTag(page, tag));
    	model.addAttribute("totalPagesTag", merchandiseService.countTotalPagesTag(tag));
    	

		return "merchandiseTag";
		
	}
}
