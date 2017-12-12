package applehead.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="ActivityDetails")
public class ActivityDetailsBean {
	@Id
	private int adNumber;
	private int activityNo;
	private String merchandiseTag;
	private double activityDiscount;

	public int getActivityNo() {
		return activityNo;
	}
	public void setActivityNo(int activityNo) {
		this.activityNo = activityNo;
	}
	public int getAdNumber() {
		return adNumber;
	}
	public void setAdNumber(int adNumber) {
		this.adNumber = adNumber;
	}
	public String getMerchandiseTag() {
		return merchandiseTag;
	}
	public void setMerchandiseTag(String merchandiseTag) {
		this.merchandiseTag = merchandiseTag;
	}
	public double getActivityDiscount() {
		return activityDiscount;
	}
	public void setActivityDiscount(double activityDiscount) {
		this.activityDiscount = activityDiscount;
	}

}
