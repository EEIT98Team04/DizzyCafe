package hongwen.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ImageUpload {
	@Autowired
	private ServletContext servletContext; 
	
	@RequestMapping(path = "/imageupload.hongwen", method = { RequestMethod.POST })
	public @ResponseBody String upload(HttpSession session, MultipartFile upload) {
		if (upload.isEmpty() || upload == null) {
			return "fileEmpty";
		}
		try {
			String serverPath = servletContext.getRealPath(".");
			String randomenglish = "abcdefghijklmnopqrstuvwxyz"; 
			String path = "/hongwen/resources/" + 
						new SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
			String photoname = "/"+ randomenglish.charAt((int)(Math.random()*25)) 
					+ new java.util.Date().getTime() + ".jpg";
			String mkdirpath = serverPath + path;
			String finalpath = serverPath + path + photoname;
			File file = null;
			byte[] bytes = null;
			
			bytes = upload.getBytes();
			file = new File(mkdirpath);
			file.mkdirs();
			file = new File(finalpath);
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file));
			stream.write(bytes);
			stream.close();
			return "/DizzyCafe/" + path + photoname;
		} catch (Exception e) {
			e.printStackTrace();
			return "uploadFail";
		}
	}
}
