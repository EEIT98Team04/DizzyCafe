package minghui.model;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import minghui.model.dao.MemberDAO;
import minghui.utils.Encryption;
import minghui.utils.MailUtils;

@Service
public class LoginService {
	@Autowired
	private MemberDAO memberDAO;

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
		System.out.println("memberEmail:" + memberEmail);
		MemberBean bean = memberDAO.select_by_email(memberEmail);
		System.out.println(bean);
		if (bean != null) {
			try {
				String subject = "DizzyCafe 會員重設密碼";
				
				String random_URL = String.valueOf(System.currentTimeMillis()) + bean.getMemberName();
					
				String html = "<p>親愛的" + bean.getMemberName() + "您好，請點擊下方連結重新設置密碼</p>"
						+ "<a href='http://127.0.0.1:8080/DizzyCafe/forgotPassword.controller?vc=" + random_URL + "'>重設密碼</a> ";

				MailUtils.generateAndSendEmail(memberEmail, subject, html);
				bean.setMemberTempPassword(random_URL);
				return true;
			} catch (AddressException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
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
}
