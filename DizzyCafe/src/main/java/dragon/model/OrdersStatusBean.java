package dragon.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="OrdersStatus")
public class OrdersStatusBean {
	@Id
	private String ordersStatusId;
	private String ordersStatus;

	@Override
	public String toString() {
		return "orders_status [ordersStatusId=" + ordersStatusId + ", ordersStatus=" + ordersStatus + "]";
	}
	
	public String getOrdersStatusId() {
		return ordersStatusId;
	}
	public void setOrdersStatusId(String ordersStatusId) {
		this.ordersStatusId = ordersStatusId;
	}
	public String getOrdersStatus() {
		return ordersStatus;
	}
	public void setOrdersStatus(String ordersStatus) {
		this.ordersStatus = ordersStatus;
	}
	
}
