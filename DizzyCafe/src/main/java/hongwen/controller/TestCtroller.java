package hongwen.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hongwen.model.BoardService;
import net.sf.json.JSONArray;

@Controller
public class TestCtroller {
	@Autowired
	BoardService boardService;

//	@RequestMapping(value = urlPattern , method = RequestMethod.POST)
//	public @ResponseBody Person save(@RequestBody Person jsonString) {
//
//	   Person person=personService.savedata(jsonString);
//	   return person;
//	}
	
	@RequestMapping(path = "/test.hongwen", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody JSONArray postJSON(@RequestParam Map<?,?> json) {
		System.out.println("JSON="+json);
		System.out.println(json.get("account"));
//		JSONArray json = boardService.selectToJSON();
//
//		System.out.println(json);
//		return json;
		return null;
	}
}
