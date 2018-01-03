package hongwen.controller;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;

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
	@Autowired
	private ServletContext servletContext;

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
		JSONArray json = documentService.modify(Integer.parseInt((String) param.get("id")));
		return json;
	}

	// 修改回文用
	@RequestMapping(path = "/Replymodify.hongwen", method = { RequestMethod.GET })
	public @ResponseBody JSONArray replymodify(@RequestParam Map<?, ?> param) {
		JSONArray json = replyService.modify(Integer.parseInt((String) param.get("id")));
		return json;
	}

	// 刪除回文用
	@RequestMapping(path = "/Replydelete.hongwen", method = { RequestMethod.GET })
	public @ResponseBody JSONArray delete(@RequestParam Map<?, ?> param) {
		JSONArray json = documentService.delete(Integer.parseInt((String) param.get("id")));
		return json;
	}

	// 查閱檢舉文章
	@RequestMapping(path = "/Privatereport.hongwen", method = { RequestMethod.GET })
	public @ResponseBody JSONArray privatereport(@RequestParam Map<?, ?> param) {
		JSONArray json = null;

		FileReader fr = null;
		BufferedReader br = null;
		String serverPath = servletContext.getRealPath(".");
		String filePath = "/hongwen/resources";
		String fileName = "/report.txt";
		String sourcePath = serverPath + filePath;
		String path = sourcePath + fileName;

		try {
			fr = new FileReader(path);
			br = new BufferedReader(fr);
			String data;
			String jsonString = "[";
			while ((data = br.readLine()) != null) {
				if (!"[".equals(jsonString)) {
					jsonString += ",";
				}
				jsonString += data;
			}
			jsonString += "]";
			json = JSONArray.fromObject(jsonString);
		} catch (FileNotFoundException e) {
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			
			try {
				br.close();
				fr.close();
			} catch (NullPointerException e) {
				e.printStackTrace();
				return null;
			} catch (IOException e) {
				e.printStackTrace();
				return null;
			}
		}
		return json;
	}

	// 會員中心被檢舉文章
	@RequestMapping(path = "/Reported.hongwen", method = { RequestMethod.GET })
	public @ResponseBody JSONArray reported(@RequestParam Map<?, ?> param) {
		JSONArray json = null;
		FileReader fr = null;
		BufferedReader br = null;
		String serverPath = servletContext.getRealPath(".");
		String filePath = "/hongwen/resources";
		String fileName = "/report.txt";
		String sourcePath = serverPath + filePath;
		String path = sourcePath + fileName;

		try {
			fr = new FileReader(path);
			br = new BufferedReader(fr);
			String data;
			String jsonString = "[";
			while ((data = br.readLine()) != null) {
				if (!"[".equals(jsonString)) {
					jsonString += ",";
				}
				jsonString += data;
			}
			jsonString += "]";
			json = JSONArray.fromObject(jsonString);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
				fr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return json;
	}
}
