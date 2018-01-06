package minghui.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import minghui.model.LoginService;
import minghui.model.MemberBean;

/**
 * Handles requests for the application file upload requests
 */
@Controller
public class FileUploadController {
	@Autowired
	private LoginService loginService;

	@RequestMapping(path = "/uploadFile.controller", method = { RequestMethod.POST, RequestMethod.GET })
	public String uploadFileHandler(String memberName, String memberPassword1, String memberPhone,
			String memberEmail, String memberAddress, String memberBirth,MultipartFile memberPhoto) {

		MemberBean bean = new MemberBean();
		bean.setMemberName(memberName);
		bean.setMemberPassword(memberPassword1);
		bean.setMemberPhone(memberPhone);
		bean.setMemberEmail(memberEmail);
		bean.setMemberAddress(memberAddress);
		
		try {
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			bean.setMemberBirth(sf.parse(memberBirth));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		System.out.println(memberPhoto);
		if (!memberPhoto.isEmpty()) {
			try {
				byte[] bytes = memberPhoto.getBytes();

				// Create the file on server
				String[] strs = memberPhoto.getContentType().split("/");
				String server_path = "C://DizzyCafe/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/DizzyCafe";
				String path = "/minghui/res/member_photo/" + bean.getMemberName() + "." + strs[1];
				bean.setMemberPhoto(path);
				File serverFile = new File(server_path + path);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				
				// logger.info("Server File Location="
				// + serverFile.getAbsolutePath());
				loginService.register(bean);
				return "login.success";
			} catch (Exception e) {
				System.out.println(e.getMessage());
				
				return "login.success";
			}
		} else {
			return "login.success";
		}
	}

}
