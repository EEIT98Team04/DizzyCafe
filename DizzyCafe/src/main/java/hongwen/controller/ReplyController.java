package hongwen.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hongwen.model.ReplyBean;
import hongwen.model.ReplyService;
import minghui.model.LoginService;
import minghui.model.MemberBean;
import net.sf.json.JSONArray;

@Controller
public class ReplyController {

	@Autowired
	ReplyService replyService;
	@Autowired
	private LoginService service;
	//搜尋用
	@RequestMapping(path = "/Reply.hongwen", method = { RequestMethod.GET })
	public @ResponseBody JSONArray getmethod(@RequestParam Map<?, ?> param) {
		JSONArray json = replyService.selectToJSON(Integer.parseInt((String) param.get("documentId")));
		return json;
	}
	//發文用
	@RequestMapping(path = "/Reply.hongwen", method = { RequestMethod.POST })
	public @ResponseBody JSONArray postmethod(HttpSession session, @RequestParam Map<?, ?> param) {
		String[] key = { "title", "textarea","modify","replyid"};
		JSONArray json = null;
		MemberBean bean = (MemberBean) session.getAttribute("user");
		if (bean == null || "".equals(String.valueOf(bean.getMemberId())) || "".equals(bean.getMemberName())) {
			String temp = "[{\"status\":\"false\"}]";// 回傳一個json陣列物件，內容為status:false，與下面insert回傳值的key相同
			json = JSONArray.fromObject(temp);
			return json;
		}
//		int replyId, String membername, int memberId, int documentId, String content, Date times
		ReplyBean replybean = new ReplyBean(Integer.parseInt((String)param.get(key[3])),
				bean.getMemberName(),bean.getMemberId(), 
				Integer.parseInt((String) param.get(key[0])),
				(String) param.get(key[1]), new java.util.Date());
		
		if("true".equals(param.get(key[2]))) {
			json = replyService.update(replybean);						
		}else{
			json = replyService.insert(replybean);			
		}
		return json;//if it's success,then return json include {"status":"success"}
	}

	//瀏覽文章顯示使用者相關資訊
	@RequestMapping(path = "/Data.hongwen", method = { RequestMethod.GET })
	public @ResponseBody JSONArray data(@RequestParam Map<?, ?> param) {
		JSONArray json = service.selectToJSON();
		return json;
	}
}
