package wayne.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import wayne.model.MerchandiseService;

@Controller
@RequestMapping(path= {"/merchandisedetails.controller"})
@SessionAttributes(value= {"bean"})
public class MerchandiseDetailsController {
		
	
	@Autowired
	MerchandiseService merchandiseService;
	
	
	@RequestMapping(method= {RequestMethod.GET,RequestMethod.POST})
	public String method(Model model, int merchandiseId) {
//		System.out.println(merchandiseId);
		
		model.addAttribute("bean", merchandiseService.select(merchandiseId));
		
		return "merchandiseDetails";
	}
}
