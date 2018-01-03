package minghui.controller;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailParseException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import minghui.model.MemberBean;
import minghui.model.dao.MemberDAO;

@Controller
public class TestSpringEmail {
	@Autowired
	private JavaMailSender javaMailSender;
	@Autowired
	private MemberDAO memberDAO;
	
	@RequestMapping(path= {"/testmail.controller"}, method= {RequestMethod.POST})
	public String method(String memberEmail) {
		long before = System.currentTimeMillis();
		MemberBean bean = memberDAO.select_by_email(memberEmail);
		//System.out.println(bean);
		MimeMessage message = javaMailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setTo(memberEmail);
			helper.setSubject("DizzyCafe 會員重設密碼");
			String random_URL = String.valueOf(System.currentTimeMillis()) + bean.getMemberName();
			helper.setText("<p>您好，請點擊下方連結重新設置密碼</p>"
			+ "<a href='http://127.0.0.1:8080/DizzyCafe/forgotPassword.controller?vc=" + random_URL + "'>重設密碼</a> ",true);
			bean.setMemberTempPassword(random_URL);
		}
		catch (MessagingException e) {
			throw new MailParseException(e);
		}
 
		javaMailSender.send(message);
		//System.out.println("cost" +(System.currentTimeMillis() - before) / 1000.0 + "seconds");
		
		return "index";
	}
}
