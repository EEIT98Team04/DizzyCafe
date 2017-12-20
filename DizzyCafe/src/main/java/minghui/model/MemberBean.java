package minghui.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "MEMBER")
public class MemberBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int memberId;
	private String memberName;
	private String memberPassword;
	private String memberPhone;
	private String memberEmail;
	private java.util.Date memberBirth;
	private String memberAddress;
	private int memberStatus; // 狀態預留欄位(0 : 黑名單 1 : 正常狀態)(留言板)
	private java.sql.Date memberPlay; // 每日活動狀態碼
	private String memberPhoto;
	private String memberTempPassword;

	@Override
	public String toString() {
		return "MemberBean [memberId=" + memberId + ", memberName=" + memberName + ", memberPassword=" + memberPassword
				+ ", memberPhone=" + memberPhone + ", memberEmail=" + memberEmail + ", memberBirth=" + memberBirth
				+ ", memberAddress=" + memberAddress + ", memberStatus=" + memberStatus + ", memberPlay=" + memberPlay
				+ ", memberPhoto=" + memberPhoto + "]";
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public java.util.Date getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(java.util.Date memberBirth) {
		this.memberBirth = memberBirth;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public int getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(int memberStatus) {
		this.memberStatus = memberStatus;
	}

	public java.sql.Date getMemberPlay() {
		return memberPlay;
	}

	public void setMemberPlay(java.sql.Date memberPlay) {
		this.memberPlay = memberPlay;
	}

	public String getMemberPhoto() {
		return memberPhoto;
	}

	public void setMemberPhoto(String memberPhoto) {
		this.memberPhoto = memberPhoto;
	}

	public String getMemberTempPassword() {
		return memberTempPassword;
	}

	public void setMemberTempPassword(String memberTempPassword) {
		this.memberTempPassword = memberTempPassword;
	}	
}
