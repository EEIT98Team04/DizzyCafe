package hongwen.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hongwen.model.DocumentService;
import hongwen.model.ReplyService;
import net.sf.json.JSONArray;

@Controller
public class PrivateController {

	@Autowired
	DocumentService documentService;
	@Autowired
	ReplyService replyService;

	// 前台會員中心瀏覽文章用
	@RequestMapping(path = "/Privatedocument.hongwen", method = { RequestMethod.GET })
	public @ResponseBody JSONArray privatedocument(@RequestParam Map<?, ?> param) {
		JSONArray json = documentService.selectToJSON((String) param.get("membername"));
		return json;
	}

	// 前台會員中心瀏覽文章用
	@RequestMapping(path = "/Privatereply.hongwen", method = { RequestMethod.GET })
	public @ResponseBody JSONArray privatereply(@RequestParam Map<?, ?> param) {
		JSONArray json = replyService.selectToJSON((String) param.get("membername"));
		return json;
	}

	// 修改文章用
	@RequestMapping(path = "/Privatemodify.hongwen", method = { RequestMethod.GET })
	public @ResponseBody JSONArray privatemodify(@RequestParam Map<?, ?> param) {
		JSONArray json = documentService.modify(Integer.parseInt((String)param.get("id")));
		return json;
	}
	
	// 查閱檢舉文章
	@RequestMapping(path = "/Privatereport.hongwen", method = { RequestMethod.GET })
	public @ResponseBody JSONArray privatereport(@RequestParam Map<?, ?> param) {
		JSONArray json = documentService.selectToJSON((String) param.get("membername"));
		return json;
	}
}
