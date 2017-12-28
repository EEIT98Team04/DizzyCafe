package minghui.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import minghui.model.AdplayService;
import net.sf.json.JSONArray;

@Controller
public class CarouselController {
	@Autowired
	private AdplayService adplayService;

	public void setAdplayService(AdplayService adplayService) {
		this.adplayService = adplayService;
	}
	
	@RequestMapping(path= {"/getCarousel.controller"}, method= {RequestMethod.GET})
	public @ResponseBody JSONArray method() {
		return adplayService.select();
	}
}
