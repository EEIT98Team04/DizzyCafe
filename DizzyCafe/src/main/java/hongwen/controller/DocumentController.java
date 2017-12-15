package hongwen.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hongwen.model.DocumentService;
import net.sf.json.JSONArray;

@Controller
public class DocumentController {
	
	@Autowired
	DocumentService documentService;

	@RequestMapping(path = "/Documentget.hongwen", method = { RequestMethod.GET})
	public @ResponseBody JSONArray getJSON(@RequestParam Map<?,?> param) {
		System.out.println("Documentpost:"+param);
		JSONArray json = documentService.selectToJSON(Integer.parseInt((String)param.get("boardId")));
		System.out.println(json);
		return json;
	}
	
	@RequestMapping(path = "/Documentpost.hongwen", method = {RequestMethod.POST })
	public @ResponseBody JSONArray postJSON(@RequestParam Map<?,?> param) {
		System.out.println("Documentpost:"+param);
		for(Object s : param.values())
            System.out.println(s);
		return null;
	}
}
