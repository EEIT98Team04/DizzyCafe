package hongwen.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ImageUpload {
	@RequestMapping(path = "/imageupload.hongwen", method = { RequestMethod.POST })
	public @ResponseBody String upload(@RequestParam Map<?, ?> param,MultipartFile file) {
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				// Create the file on server
				String server_path = "C://DizzyCafe/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/DizzyCafe";
//				String path = "/hongwen/resources/"+new java.util.Date();
				String path = "/hongwen/resources/1.jpg";
				String final_path = server_path + path;
				File serverFile = new File(final_path);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				return "/DizzyCafe/"+path;
			} catch (Exception e) {
				System.out.println(e.getMessage());
				return "fail";
			}
		}
		return "empty";
	}
}
