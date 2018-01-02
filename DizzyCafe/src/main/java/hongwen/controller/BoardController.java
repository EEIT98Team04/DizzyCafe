package hongwen.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hongwen.model.BoardService;
import net.sf.json.JSONArray;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;

	@RequestMapping(path = "/Board.hongwen", method = { RequestMethod.GET })
	public @ResponseBody JSONArray postJSON(HttpSession session) {
		JSONArray json = boardService.selectToJSON();
		return json;
	}

	@RequestMapping(path = "/Forum.hongwen", method = { RequestMethod.POST })
	public @ResponseBody JSONArray selectBoard(@RequestParam Map<?,?> param) {
		JSONArray json = boardService.updateName(
				Integer.parseInt((String)param.get("boardId")),
				(String)param.get("announcement"));
		return json;
	}
}
