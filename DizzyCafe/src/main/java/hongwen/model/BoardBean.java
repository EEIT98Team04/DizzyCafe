package hongwen.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Board")
public class BoardBean {
//	/*論壇*/
//	CREATE TABLE board (
//		boardId			int IDENTITY,			--論壇編號	
//		name			varchar(100),			--論壇
//		popularity		int,					--人氣
//		managerId		int ,					--管理員編號
//		Bstatus			int,					--狀態碼(0:停用 1:正常)
//		announcement	varchar(max),			--看板公告
//		primary key(boardId),
//		foreign key (managerId) references manager (managerId),
//		unique (boardId)   
//	);
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int boardId;
	private String name;
	private int popularity;
	private int managerId;
	private int bstatus;
	private String announcement;
	@Override
	public String toString() {
		return "BoardBean [boardId=" + boardId + ", name=" + name + ", popularity=" + popularity + ", announcement="
				+ announcement + ", managerId=" + managerId + ", Bstatus=" + bstatus + "]";
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
		return bstatus;
	}
	public void setBstatus(int bstatus) {
		this.bstatus = bstatus;
	}
}
