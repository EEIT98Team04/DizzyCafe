package hongwen.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import hongwen.model.DocumentBean;
import hongwen.model.DocumentService;
import hongwen.model.TmpBean;
import minghui.model.MemberBean;
import net.sf.json.JSONArray;

@Controller
public class DocumentController {

	@Autowired
	DocumentService documentService;
	
	@Autowired
	private ServletContext servletContext;

	@RequestMapping(path = "/ReportFile.hongwen", method = { RequestMethod.GET })
	public @ResponseBody String forum(@RequestParam Map<?, ?> param) {
		String serverPath = servletContext.getRealPath(".");
		String filePath = "/hongwen/resources";
		String sourcePath = serverPath + filePath;
		String filename = "/report.txt";
		String id = ((String)param.get("id"));
		BufferedReader br = null;
		BufferedWriter bw = null;
		
		try {
			br = new BufferedReader(new FileReader(sourcePath + filename));
			String read;
			String data="";
			id = "\"documentId\":\"" + id;
			while((read = br.readLine()) != null) {
				if(read.contains(id)) {
					continue;
				}
				data += read+"\n";
			}
//			//System.out.println(data);
			bw = new BufferedWriter(new FileWriter(sourcePath + filename,false));//true 接續寫下去//false 複寫
			bw.write(data);
			documentService.delete(Integer.valueOf((String)param.get("id")));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
				bw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	@RequestMapping(path = "/Report.hongwen", method = { RequestMethod.POST })
	public @ResponseBody String Report(TmpBean bean) {

		String serverPath = servletContext.getRealPath(".");
		String filePath = "/hongwen/resources";
		String filename = "/report.txt";
		String sourcePath = serverPath + filePath;
		File file = null;
		BufferedWriter bw = null;

		String temp = new Gson().toJson(bean); // 轉JSON檔案

		try {
			file = new File(sourcePath);
			file.mkdirs();
			file = new File(sourcePath + filename);
			if (!file.exists()) {
				file.createNewFile();
			}
			bw = new BufferedWriter(new FileWriter(file,true));//true 接續寫下去//false 複寫
			bw.write(temp);
			bw.newLine();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				bw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	@RequestMapping(path = "/Document.hongwen", method = { RequestMethod.GET })
	public @ResponseBody JSONArray getJSON(@RequestParam Map<?, ?> param) {
		JSONArray json = documentService.selectToJSON(Integer.parseInt((String) param.get("boardId")));
		return json;
	}

	@RequestMapping(path = "/Document.hongwen", method = { RequestMethod.POST })
	public @ResponseBody JSONArray postJSON(HttpSession session, @RequestParam Map<?, ?> param) {
		// 直接抓Session全部內容
		// @SuppressWarnings("rawtypes")
		// Enumeration e = session.getAttributeNames();
		// String tmp;
		// Object o;
		// while(e.hasMoreElements()) {
		// tmp = (String)e.nextElement();
		// //System.out.println("Value is: "+tmp);
		// o = session.getAttribute(tmp);
		// //System.out.println(tmp+":"+o);
		// }

		// 不知道Key，取得全部的值
		// for (Object key : param.keySet()) {
		// //System.out.println(key + " : " + param.get(key));
		// }
		String[] key = { "title", "grid", "textarea", "modify", "documentid" };
		JSONArray json = null;
		MemberBean bean = (MemberBean) session.getAttribute("user");
		int tmp = 0;
		String x = (String) param.get(key[4]);

		if (!"".equals(x)) {
			tmp = Integer.parseInt((String) param.get(key[4]));
		}

		if (bean == null || "".equals(String.valueOf(bean.getMemberId())) || "".equals(bean.getMemberName())) {
			String temp = "[{\"status\":\"false\"}]";// 回傳一個json陣列物件，內容為status:false，與下面insert回傳值的key相同
			json = JSONArray.fromObject(temp);
			return json;
		}
		DocumentBean documentbean = new DocumentBean(tmp, (String) param.get(key[0]), new java.util.Date(),
				bean.getMemberName(), 1, bean.getMemberId(), Integer.parseInt((String) param.get(key[1])), true,
				(String) param.get(key[2]));
		if ("true".equals(param.get(key[3]))) {
			json = documentService.update(documentbean);
		} else {
			json = documentService.insert(documentbean);
		}
		return json;
	}
}