package applehead.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="ActivityDetails")
public class ActivityDetailsBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int adNumber;
	private int activityNo;
	private String merchandiseTag;
	private double activityDiscount;

	@Override
	public String toString() {
		return "ActivityDetailsBean [adNumber=" + adNumber + ", activityNo=" + activityNo + ", merchandiseTag="
				+ merchandiseTag + ", activityDiscount=" + activityDiscount + "]";
	}
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
