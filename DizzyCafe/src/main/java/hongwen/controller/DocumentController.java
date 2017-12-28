package hongwen.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hongwen.model.DocumentBean;
import hongwen.model.DocumentService;
import minghui.model.MemberBean;
import net.sf.json.JSONArray;

@Controller
public class DocumentController {
	
	@Autowired
	DocumentService documentService;

	@RequestMapping(path = "/Document.hongwen", method = { RequestMethod.GET})
	public @ResponseBody JSONArray getJSON(@RequestParam Map<?,?> param) {		
		JSONArray json = documentService.selectToJSON(Integer.parseInt((String)param.get("boardId")));
		return json;
	}
	
	@RequestMapping(path = "/Document.hongwen", method = {RequestMethod.POST })
	public @ResponseBody JSONArray postJSON(HttpSession session,@RequestParam Map<?,?> param) {
//		直接抓Session全部內容	
//		@SuppressWarnings("rawtypes")
//		Enumeration e = session.getAttributeNames();
//		String tmp;
//		Object o;
//		while(e.hasMoreElements()) {
//			 tmp = (String)e.nextElement();
//	         System.out.println("Value is: "+tmp);
//			 o = session.getAttribute(tmp);
//			 System.out.println(tmp+":"+o);
//	    }

//不知道Key，取得全部的值
//		for (Object key : param.keySet()) {
//			System.out.println(key + " : " + param.get(key));
//		}
		String[] key = {"title","grid","textarea","modify","documentid"};
		JSONArray json = null;
		MemberBean bean = (MemberBean) session.getAttribute("user");
		int tmp = 0;
		String x = (String)param.get(key[4]);
				
		if(!"".equals(x)) {
			tmp = Integer.parseInt((String)param.get(key[4]));
		}
		
		if(bean == null || "".equals(String.valueOf(bean.getMemberId())) || "".equals(bean.getMemberName())) {
			String temp = "[{\"status\":\"false\"}]";//回傳一個json陣列物件，內容為status:false，與下面insert回傳值的key相同
			json = JSONArray.fromObject(temp);
			return json;
		}
		DocumentBean documentbean = new DocumentBean(tmp,(String)param.get(key[0]),
				new java.util.Date(),bean.getMemberName(),1,bean.getMemberId(),
				Integer.parseInt((String)param.get(key[1])),true,(String)param.get(key[2]));
		if("true".equals(param.get(key[3]))) {
			json = documentService.update(documentbean);						
		}else{
			json = documentService.insert(documentbean);			
		}		
		return json;
	}
}
