package hongwen.model;

public class TmpBean {
	private String documentId;
	private String memberid;
	private String times;
	private String content;
	public String getDocumentId() {
		return documentId;
	}
	public void setDocumentId(String documentId) {
		this.documentId = documentId;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getTimes() {
		return times;
	}
	public void setTimes(String times) {
		this.times = times;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "dataTmp [documentId=" + documentId + ", memberid=" + memberid + ", times=" + times + ", content="
				+ content + "]";
	}
}
