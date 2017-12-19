package dragon;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="OrdersDetails")
public class OrdersDetailsBean implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int ordersDetailsId;
	@Id
	private int ordersId;
	private String merchandiseName;
	private int merchandisePrice;
	private int buyCount;
	
	@Override
	public String toString() {
		return "OrdersDetailsBean [ordersDetailsId=" + ordersDetailsId + ", ordersId=" + ordersId + ", merchandiseName="
				+ merchandiseName + ", merchandisePrice=" + merchandisePrice + ", buyCount=" + buyCount + "]";
	}

	public int getOrdersDetailsId() {
		return ordersDetailsId;
	}

	public void setOrdersDetailsId(int ordersDetailsId) {
		this.ordersDetailsId = ordersDetailsId;
	}

	public int getOrdersId() {
		return ordersId;
	}

	public void setOrdersId(int ordersId) {
		this.ordersId = ordersId;
	}

	public String getMerchandiseName() {
		return merchandiseName;
	}

	public void setMerchandiseName(String merchandiseName) {
		this.merchandiseName = merchandiseName;
	}

	public int getMerchandisePrice() {
		return merchandisePrice;
	}

	public void setMerchandisePrice(int merchandisePrice) {
		this.merchandisePrice = merchandisePrice;
	}

	public int getBuyCount() {
		return buyCount;
	}

	public void setBuyCount(int buyCount) {
		this.buyCount = buyCount;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ordersDetailsId;
		result = prime * result + ordersId;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrdersDetailsBean other = (OrdersDetailsBean) obj;
		if (ordersDetailsId != other.ordersDetailsId)
			return false;
		if (ordersId != other.ordersId)
			return false;
		return true;
	}
	
	

}
