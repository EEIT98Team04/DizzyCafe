package applehead.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ActivityList")
public class ActivityListBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int activityNo;
	private String activityName;
	private java.sql.Date activityStart;
	private java.sql.Date activityEnd;
	private String activityContent;
	private String activityPicture;

	
	@Override
	public String toString() {
		return "ActivityListBean [activityNo=" + activityNo + ", activityName=" + activityName + ", activityStart="
				+ activityStart + ", activityEnd=" + activityEnd + ", activityContent=" + activityContent
				+ ", activityPicture=" + activityPicture + "]";
	}
	public String getActivityContent() {
		return activityContent;
	}
	public void setActivityContent(String activityContent) {
		this.activityContent = activityContent;
	}
	public String getActivityPicture() {
		return activityPicture;
	}
	public void setActivityPicture(String activityPicture) {
		this.activityPicture = activityPicture;
	}
	public int getActivityNo() {
		return activityNo;
	}
	public void setActivityNo(int activityNo) {
		this.activityNo = activityNo;
	}
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	public java.sql.Date getActivityStart() {
		return activityStart;
	}
	public void setActivityStart(java.sql.Date activityStart) {
		this.activityStart = activityStart;
	}
	public java.sql.Date getActivityEnd() {
		return activityEnd;
	}
	public void setActivityEnd(java.sql.Date activityEnd) {
		this.activityEnd = activityEnd;
	}
	
}
