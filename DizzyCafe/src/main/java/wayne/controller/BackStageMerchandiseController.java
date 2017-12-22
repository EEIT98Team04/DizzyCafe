package wayne.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import wayne.model.MerchandiseBackstageService;


@Controller
public class BackStageMerchandiseController {
	
	@Autowired
	MerchandiseBackstageService merchandisebackstageService;
	
	@RequestMapping(path="/showinbackstage.controller",
					method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody JSONArray showMerchandiseInBackstage() {
		return merchandisebackstageService.showMerchandiseInBackstage();
	}
}
