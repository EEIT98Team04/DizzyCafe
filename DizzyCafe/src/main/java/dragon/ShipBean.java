package dragon;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Ship")
public class ShipBean {
	@Id
	private String shipId;
	private String shipStyle;
	private int shipCost;
	
	@Override
	public String toString() {
		return "ShipBean [shipId=" + shipId + ", shipStyle=" + shipStyle + ", shipCost=" + shipCost + "]";
	}
	
	public String getShipId() {
		return shipId;
	}
	public void setShipId(String shipId) {
		this.shipId = shipId;
	}
	public String getShipStyle() {
		return shipStyle;
	}
	public void setShipStyle(String shipStyle) {
		this.shipStyle = shipStyle;
	}
	public int getShipCost() {
		return shipCost;
	}
	public void setShipCost(int shipCost) {
		this.shipCost = shipCost;
	}
	
}
