package hongwen.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Board")
public class BoardBean {
//	/*論壇*/
//	CREATE TABLE board (
//		boardId			int IDENTITY,		--論壇代號	
//		name			varchar(100),		--論壇
//		popularity		int,				--人氣
//		announcement	varchar(300),		--看板公告
//		managerId		int ,				--管理員編號
//		Bstatus			int,				--狀態碼(0:停用 1:正常)
//		primary key(boardId),
//		foreign key (managerId) references manager (managerId),
//		unique (boardId)   
//	);
	@Id
	private int boardId;
	private String name;
	private int popularity;
	private String announcement;
	private int managerId;
	private int Bstatus;
	@Override
	public String toString() {
		return "BoardBean [boardId=" + boardId + ", name=" + name + ", popularity=" + popularity + ", announcement="
				+ announcement + ", managerId=" + managerId + ", Bstatus=" + Bstatus + "]";
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPopularity() {
		return popularity;
	}
	public void setPopularity(int popularity) {
		this.popularity = popularity;
	}
	public String getAnnouncement() {
		return announcement;
	}
	public void setAnnouncement(String announcement) {
		this.announcement = announcement;
	}
	public int getManagerId() {
		return managerId;
	}
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}
	public int getBstatus() {
		return Bstatus;
	}
	public void setBstatus(int bstatus) {
		Bstatus = bstatus;
	}
}
