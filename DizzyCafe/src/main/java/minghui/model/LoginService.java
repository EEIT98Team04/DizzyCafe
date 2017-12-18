package minghui.model;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import minghui.model.dao.MemberDAO;

@Service
public class LoginService {
	@Autowired
	private MemberDAO memberDAO;
	
	@Transactional(readOnly=true)
	public MemberBean login(String memberName, String memberPassword) {
		if(memberName != null && !memberName.trim().isEmpty()) {
			MemberBean bean = memberDAO.select(memberName);
			if(bean != null && memberPassword != null && !memberPassword.trim().isEmpty()) {
				if(bean.getMemberPassword().equals(Encryption.md5(memberPassword))) {
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
		
		//將每日活動狀態預設成前一天
		long now_time = System.currentTimeMillis();
		bean.setMemberPlay(new java.sql.Date(now_time - 86400000));
		
		MemberBean result = memberDAO.insert(bean);
		if(result != null) {
			return true;
		}	
		
		return false;
	}
	@Transactional
	public void updateDailyEvent(MemberBean bean) {
		java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
		if(bean.getMemberPlay().before(date)) {
			bean.setMemberPlay(date);
			memberDAO.update(bean);	
		}
	}
	
	@Transactional
	public MemberBean update_member_info(MemberBean bean) {
		return memberDAO.update(bean);
	}
}
