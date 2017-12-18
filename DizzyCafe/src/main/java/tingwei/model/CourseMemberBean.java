package tingwei.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class CourseMemberBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	private int memberId;
	@Id
	private int courseId;
	private String memberPhone;
	private String memberEmail;
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + courseId;
		result = prime * result + memberId;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CourseMemberBean other = (CourseMemberBean) obj;
		if (courseId != other.courseId)
			return false;
		if (memberId != other.memberId)
			return false;
		return true;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
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
	@Override
	public String toString() {
		return "CourseMemberBean [memberId=" + memberId + ", courseId=" + courseId + ", memberPhone=" + memberPhone
				+ ", memberEmail=" + memberEmail + "]";
	}

	
}
