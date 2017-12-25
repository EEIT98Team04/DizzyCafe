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
	/*回覆留言*/
//	CREATE TABLE reply (
//		replyId         int IDENTITY,			--回覆編號
//		times		    datetime,				--回覆時間
//		membername		varchar(20),			--會員名稱(不FK)
//		memberId		int not null,			--會員編號
//		documentId		int not null,			--文章代號
//		--Rstatus			BIT,				--狀態碼(0:停用 1:正常)(回復不給刪除)
//		content         varchar(max),			--回覆內容(若含圖片,可能要增大)
//		primary key(replyId),
//		foreign key (memberId) references member (memberId),
//		foreign key (documentId) references document (documentId),
//		unique (replyId)
//	);
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int replyId;
	private String membername;	
	private int memberId;
	private int documentId;
	private String content;
	private java.util.Date times;
	
	public ReplyBean() {
		super();
	}

	public ReplyBean(int replyId, String membername, int memberId, int documentId, String content, Date times) {
		super();
		this.replyId = replyId;
		this.membername = membername;
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

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
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

	@Override
	public String toString() {
		return "ReplyBean [replyId=" + replyId + ", membername=" + membername + ", memberId=" + memberId
				+ ", documentId=" + documentId + ", content=" + content + ", times=" + times + "]";
	}
}
