package hongwen.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import hongwen.model.BoardService;
import net.sf.json.JSONArray;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;

	@RequestMapping(path = "/Board.hongwen", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody JSONArray postJSON(HttpSession session) {
		System.out.println("BoardController");
		JSONArray json = boardService.selectToJSON();
		System.out.println(json);
		return json;
	}
}
