package hongwen.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Document")
public class DocumentBean {
	// /*文章*/
	// CREATE TABLE document (
	// documentId int IDENTITY, --文章編號
	// name varchar(100), --標題
	// times datetime, --發文時間
	// membername varchar(20), --會員名稱(不FK)
	// popularity int, --人氣
	// memberId int, --會員編號
	// boardId int, --論壇代號
	// status BIT, --狀態碼(0:停用 1:正常)
	// content varchar(max), --發文內容(若含圖片,可能要增大)
	// primary key(documentId),
	// foreign key (memberId) references member (memberId),
	// foreign key (boardId) references board (boardId),
	// unique (documentId)
	// );
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int documentId;
	private String name;
	private java.util.Date times;
	private String membername;
	private int popularity;
	private int memberId;
	private int boardId;
	private boolean dstatus;
	private String content;
	// @ManyToOne
	// @JoinColumn(
	// name="DEPTID",
	// referencedColumnName="DEPTID"
	// )

	public DocumentBean() {
		super();
	}

	public DocumentBean(int documentId, String name, Date times, String membername, int popularity, int memberId,
			int boardId, boolean dstatus, String content) {
		super();
		this.documentId = documentId;
		this.name = name;
		this.times = times;
		this.membername = membername;
		this.popularity = popularity;
		this.memberId = memberId;
		this.boardId = boardId;
		this.dstatus = dstatus;
		this.content = content;
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

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
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

	public boolean getDstatus() {
		return dstatus;
	}

	public void setDstatus(boolean dstatus) {
		this.dstatus = dstatus;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "DocumentBean [documentId=" + documentId + ", name=" + name + ", times=" + times + ", membername="
				+ membername + ", popularity=" + popularity + ", memberId=" + memberId + ", boardId=" + boardId
				+ ", dstatus=" + dstatus + ", content=" + content + "]";
	}

}
