package applehead.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Coupon")
public class CouponBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int couponId;
	private int memberId;
	private int merchandiseId;
	private double eventDiscount;
	private java.sql.Date couponDeadline;
	private int couponStatus;
	
	
	@Override
	public String toString() {
		return "CouponBean [couponId=" + couponId + ", memberId=" + memberId + ", merchandiseId=" + merchandiseId
				+ ", eventDiscount=" + eventDiscount + ", couponDeadline=" + couponDeadline + ", couponStatus="
				+ couponStatus + "]";
	}
	public int getCouponId() {
		return couponId;
	}
	public void setCouponId(int couponId) {
		this.couponId = couponId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getMerchandiseId() {
		return merchandiseId;
	}
	public void setMerchandiseId(int merchandiseId) {
		this.merchandiseId = merchandiseId;
	}
	public double getEventDiscount() {
		return eventDiscount;
	}
	public void setEventDiscount(double eventDiscount) {
		this.eventDiscount = eventDiscount;
	}
	public java.sql.Date getCouponDeadline() {
		return couponDeadline;
	}
	public void setCouponDeadline(java.sql.Date couponDeadline) {
		this.couponDeadline = couponDeadline;
	}
	public int getCouponStatus() {
		return couponStatus;
	}
	public void setCouponStatus(int couponStatus) {
		this.couponStatus = couponStatus;
	}
	
}
