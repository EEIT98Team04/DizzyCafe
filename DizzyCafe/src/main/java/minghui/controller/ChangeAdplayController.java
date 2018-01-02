package minghui.controller;

import java.util.Collection;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import minghui.model.AdplayService;

@Controller
public class ChangeAdplayController {
	@Autowired
	private AdplayService adplayService;	
	
	@RequestMapping(path= {"/changeAdplayController.controller"})
	public @ResponseBody boolean method(@RequestBody MultiValueMap<String,String> map) {
		adplayService.delete();
		System.out.println(map.toSingleValueMap());
		Map<String,String> javaMap = map.toSingleValueMap();
		Collection<String> values = javaMap.values();
		adplayService.insert(values);
		
		
		return true;
	}
}
