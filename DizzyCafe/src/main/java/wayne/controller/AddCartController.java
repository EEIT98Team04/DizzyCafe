package wayne.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/addcart.controller")
public class AddCartController {
	
	@RequestMapping(method= {RequestMethod.GET,RequestMethod.POST})
	public String method(int merchandiseId, String merchandiseName, String merchandiseContent, 
						String merchandisePicture, String merchandiseTag, int merchandisePrice, 
						int merchandiseQuantity, String merchandiseStatus) {
		
		System.out.println(merchandiseId);
		System.out.println(merchandiseName);
		System.out.println(merchandisePicture);
		System.out.println(merchandiseTag);
		System.out.println(merchandisePrice);
		System.out.println(merchandiseQuantity);
		System.out.println(merchandiseStatus);
		
		
		return "";
	}
}
