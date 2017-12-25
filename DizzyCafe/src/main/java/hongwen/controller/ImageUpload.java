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

@Controller
public class ImageUpload {
	@RequestMapping(path = "/imageupload.hongwen", method = { RequestMethod.POST })
	public @ResponseBody String upload(@RequestParam Map<?, ?> param) {
//		if (!memberPhoto.isEmpty()) {
//			try {
//				byte[] bytes = memberPhoto.getBytes();
//
//				// Create the file on server
//				String[] strs = memberPhoto.getContentType().split("/");
//				String server_path = "C://DizzyCafe/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/DizzyCafe";
//				String path = "/minghui/res/member_photo/" + bean.getMemberName() + "." + strs[1];
//				bean.setMemberPhoto(path);
//				File serverFile = new File(server_path + path);
//				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
//				stream.write(bytes);
//				stream.close();
//				
//				// logger.info("Server File Location="
//				// + serverFile.getAbsolutePath());
//				loginService.register(bean);
//				return "login.success";
//			} catch (Exception e) {
//				System.out.println(e.getMessage());
//				
//				return "login.success";
//			}
//		}
		return "uploadsuccess";
	}
}
