package applehead.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="DAILYEVENT")
public class DailyEventBean {
	@Id
	private int eventId;
	private double probability;
	private int merchandiseId;
	private double discount;
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	public double getProbability() {
		return probability;
	}
	public void setProbability(double probability) {
		this.probability = probability;
	}
	public int getMerchandiseId() {
		return merchandiseId;
	}
	public void setMerchandiseId(int merchandiseId) {
		this.merchandiseId = merchandiseId;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	@Override
	public String toString() {
		return "DailyEventBean [eventId=" + eventId + ", probability=" + probability + ", merchandiseId="
				+ merchandiseId + ", discount=" + discount + "]";
	}

	
}
