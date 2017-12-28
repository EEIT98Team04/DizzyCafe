package minghui.model;

import javax.persistence.Entity;

@Entity
public class TmpBean {

	private String memberName;
	private String memberPhoto;
	
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPhoto() {
		return memberPhoto;
	}
	public void setMemberPhoto(String memberPhoto) {
		this.memberPhoto = memberPhoto;
	}
	@Override
	public String toString() {
		return "TmpBean [memberName=" + memberName + ", memberPhoto=" + memberPhoto + "]";
	}
}
