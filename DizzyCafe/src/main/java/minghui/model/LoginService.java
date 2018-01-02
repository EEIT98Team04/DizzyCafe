package minghui.model;

import java.io.File;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailParseException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.base.Joiner;
import com.google.common.io.Files;
import com.google.gson.Gson;

import minghui.model.dao.MemberDAO;
import minghui.utils.Encryption;
import net.sf.json.JSONArray;

@Service
public class LoginService {
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Autowired
	private ServletContext servletContext;

	@Transactional(readOnly = true)
	public MemberBean login(String memberName, String memberPassword) {
		if (memberName != null && !memberName.trim().isEmpty()) {
			MemberBean bean = memberDAO.select(memberName);
			if (bean != null && memberPassword != null && !memberPassword.trim().isEmpty()) {
				if (bean.getMemberPassword().equals(Encryption.md5(memberPassword))) {
					bean.setMemberTempPassword("");
					return bean;
				}
			}
		}
		return null;
	}
	
	@Transactional
	public MemberBean login_fb(MemberBean bean) {
		MemberBean result_name = memberDAO.select(bean.getMemberName());
		if(result_name != null) {
			if(bean.getMemberPhoto().contains("/" + servletContext.getServletContextName())) {
				result_name.setMemberPhoto(bean.getMemberPhoto());
				return result_name;	
			}
			return result_name;
		}else {
			MemberBean result_email = memberDAO.select_by_email(bean.getMemberEmail());
			if(result_email != null) {
				if(bean.getMemberPhoto().contains("/" + servletContext.getServletContextName())) {
					result_email.setMemberPhoto(bean.getMemberPhoto());
					return result_email;	
				}
				return result_email;
			}else {
				return null;
//				return memberDAO.insert(bean);
			}
		}
	}

	@Transactional
	public boolean register(MemberBean bean) {
		String memberPassword = bean.getMemberPassword();
		bean.setMemberPassword(Encryption.md5(memberPassword));

		// 將每日活動狀態預設成前一天
		long now_time = System.currentTimeMillis();
		bean.setMemberPlay(new java.sql.Date(now_time - 86400000));

		MemberBean result = memberDAO.insert(bean);
		if (result != null) {
			return true;
		}

		return false;
	}

	@Transactional
	public MemberBean updateDailyEvent(MemberBean bean) {
		MemberBean result = null;
		java.sql.Date date = new java.sql.Date(System.currentTimeMillis() + 86400000);
		if (bean.getMemberPlay().before(date)) {
			bean.setMemberPlay(date);
			memberDAO.update(bean);
			result = bean;
			return result;
		}
		return result;
	}

	@Transactional
	public MemberBean update_member_info(MemberBean bean) {
		return memberDAO.update(bean);
	}

	@Transactional
	public boolean forgot_password_send_email(String memberEmail) {
		long start = System.currentTimeMillis();
		
		MemberBean bean = memberDAO.select_by_email(memberEmail);
		if (bean != null) {
				String subject = "DizzyCafe 會員重設密碼";
				
				String random_URL = String.valueOf(System.currentTimeMillis()) + bean.getMemberName();
					
				String html = "<p>親愛的" + bean.getMemberName() + "您好，請點擊下方連結重新設置密碼</p>"
				+ "<a href='http://localhost:8080/DizzyCafe/forgotPassword.controller?vc=" + random_URL + "'>重設密碼</a> ";

				MimeMessage message = javaMailSender.createMimeMessage();
				
				try {
					MimeMessageHelper helper = new MimeMessageHelper(message, true);
					helper.setTo(memberEmail);
					helper.setSubject(subject);
					helper.setText(html,true);
					bean.setMemberTempPassword(random_URL);
				}
				catch (MessagingException e) {
					throw new MailParseException(e);
				}
		 
				javaMailSender.send(message);
				
				bean.setMemberTempPassword(random_URL);
				
				System.out.println("cost : " + (System.currentTimeMillis() - start) / 1000.0 + "second");
				
				return true;
			
		}
		return false;
	}
	
	@Transactional
	public MemberBean verify_password(String memberTempPassword) {
		if(memberTempPassword != null && !memberTempPassword.trim().isEmpty()) {
			MemberBean bean =  memberDAO.select_by_TempPassword(memberTempPassword);
			if(bean != null) {
				bean.setMemberTempPassword("");
				bean.setMemberPassword("");
				return bean;
			}			
		}		
		return null;
	}
	
	@Transactional
	public MemberBean changePwd(String memberName, String newPwd) {
		MemberBean bean = memberDAO.select(memberName);
		bean.setMemberPassword(Encryption.md5(newPwd));				
		return bean;
	}
	
	@Transactional
	public boolean uploadServerFile(MultipartFile memberPhoto, MemberBean bean) {
//		System.out.println(Joiner.on("/").join(servletContext.getRealPath(".").split("\\")));
//		System.out.println("\\");
		
		if (!memberPhoto.isEmpty()) {
			try {
				
//				byte[] bytes = memberPhoto.getBytes();
//				String[] strs = memberPhoto.getContentType().split("/");
//				System.out.println(strs[1]);
//				String path = "/minghui/res/member_photo/" + bean.getMemberName() + "." + strs[1];
//				File serverFile = new File(server_path + path);
//				bean.setMemberPhoto("/DizzyCafe" + path);
//				memberDAO.update(bean);
//				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
//				stream.write(bytes);
//				stream.close();
				
				byte[] bytes = memberPhoto.getBytes();
				String[] strs = memberPhoto.getContentType().split("/");
				Joiner joiner = Joiner.on("");
				String guava_path = joiner.join("/minghui/res/member_photo/", bean.getMemberName(), ".", strs[1]);
				File serverFile = new File(servletContext.getRealPath(".") + guava_path);
				bean.setMemberPhoto("/" + servletContext.getServletContextName() + guava_path);
				memberDAO.update(bean);
				Files.write(bytes, serverFile);				
				
				return true;
			} catch (Exception e) {
				System.out.println(e.getMessage());				
				return false;
			}
		}
		return false;
	}
	
	//hongwen
	@Transactional
	public JSONArray selectToJSON() {
		List<TmpBean> select = memberDAO.selectall();
		String temp = new Gson().toJson(select); // 轉JSON檔案
		JSONArray json = JSONArray.fromObject(temp);
		return json;
	}
}