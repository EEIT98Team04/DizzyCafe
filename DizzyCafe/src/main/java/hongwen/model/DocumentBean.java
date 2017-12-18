package hongwen.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Document")
public class DocumentBean {
//	/*文章*/
//	CREATE TABLE document (
//		documentId		int IDENTITY(50,1),		--文章代號(測試51開始)
//		name			varchar(100),			--標題
//		times	        datetime,				--發文時間
//		content         varchar(2048),			--發文內容(若含圖片,可能要增大)
//		popularity		int,					--人氣
//		memberId        int,					--會員編號
//		boardId			int,					--論壇代號
//		Dstatus			BIT,					--狀態碼(0:停用 1:正常)
//		primary key(documentId),
//		foreign key (memberId) references member (memberId),
//		foreign key (boardId) references board (boardId),
//		unique (documentId)
//	);
	@Id
	private int documentId;
	private String name;
	private java.util.Date times;
	private String content;
	private int popularity;
	private int memberId;
//	@ManyToOne
//	@JoinColumn(
//			name="DEPTID",
//			referencedColumnName="DEPTID"
//	)
	private int boardId;
	private boolean Dstatus;
	@Override
	public String toString() {
		return "DocumentBean [documentId=" + documentId + ", name=" + name + ", times=" + times + ", content=" + content
				+ ", popularity=" + popularity + ", memberId=" + memberId + ", boardId=" + boardId + ", Dstatus="
				+ Dstatus + "]";
	}
	public int getDocumentId() {
		return documentId;
	}
	public void setDocumentId(int documentId) {
		this.documentId = documentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public java.util.Date getTimes() {
		return times;
	}
	public void setTimes(java.util.Date times) {
		this.times = times;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPopularity() {
		return popularity;
	}
	public void setPopularity(int popularity) {
		this.popularity = popularity;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public boolean isDstatus() {
		return Dstatus;
	}
	public void setDstatus(boolean dstatus) {
		Dstatus = dstatus;
	}
}
