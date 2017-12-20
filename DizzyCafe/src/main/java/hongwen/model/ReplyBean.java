package hongwen.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Reply")
public class ReplyBean {
//	/*回覆留言*/
//	CREATE TABLE reply (
//		replyId         int IDENTITY,			--回覆編號
//		memberId		int not null,			--會員編號
//		documentId		int not null,			--文章代號
//		content         varchar(2048),			--回覆內容(若含圖片,可能要增大)
//		times		    datetime,				--回覆時間
//		--Rstatus			BIT,				--狀態碼(0:停用 1:正常)(回復不給刪除)
//		primary key(replyId),
//		foreign key (memberId) references member (memberId),
//		foreign key (documentId) references document (documentId),
//		unique (replyId)
//	);
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int replyId;
	private int memberId;
	private int documentId;
	private String content;
	private java.util.Date times;
	@Override
	public String toString() {
		return "ReplyBean [replyId=" + replyId + ", memberId=" + memberId + ", documentId=" + documentId + ", content="
				+ content + ", times=" + times + "]";
	}
	
	public ReplyBean() {
	}

	public ReplyBean(int replyId, int memberId, int documentId, String content, Date times) {
		this.replyId = replyId;
		this.memberId = memberId;
		this.documentId = documentId;
		this.content = content;
		this.times = times;
	}

	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getDocumentId() {
		return documentId;
	}
	public void setDocumentId(int documentId) {
		this.documentId = documentId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public java.util.Date getTimes() {
		return times;
	}
	public void setTimes(java.util.Date times) {
		this.times = times;
	}
}
