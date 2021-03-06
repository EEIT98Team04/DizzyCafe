package dragon.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="shopping")
public class ShoppingBean implements Serializable{
	@Id
	private int memberId;
	@Id
	private int merchandiseId;
	private int buyCount;
	private int price;
	
	public static void main(String[] args) {

	}
	

	@Override
	public String toString() {
		return "ShoppingBean [memberId=" + memberId + ", merchandiseId=" + merchandiseId + ", buyCount=" + buyCount
				+ ", price=" + price + "]";
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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
		result = prime * result + memberId;
		result = prime * result + merchandiseId;
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
		ShoppingBean other = (ShoppingBean) obj;
		if (memberId != other.memberId)
			return false;
		if (merchandiseId != other.merchandiseId)
			return false;
		return true;
	}
	
}
