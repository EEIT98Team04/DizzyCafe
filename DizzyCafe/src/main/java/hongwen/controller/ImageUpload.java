package hongwen.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ImageUpload {
	@RequestMapping(path = "/imageupload.hongwen", method = { RequestMethod.POST })
	public @ResponseBody String upload(@RequestParam Map<?, ?> param) {
		// 直接抓Session全部內容
		// @SuppressWarnings("rawtypes")
		// Enumeration e = session.getAttributeNames();
		// String tmp;
		// Object o;
		// while(e.hasMoreElements()) {
		// tmp = (String)e.nextElement();
		// System.out.println("Value is: "+tmp);
		// o = session.getAttribute(tmp);
		// System.out.println(tmp+":"+o);
		// }

		// 不知道Key，取得全部的值
		// for (Object key : param.keySet()) {
		// System.out.println(key + " : " + param.get(key));
		// }
		System.out.println("uploadsuccess");
		return "uploadsuccess";
	}
}
