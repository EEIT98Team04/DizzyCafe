package dragon;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.lang.NonNull;

@Entity
@Table(name="Orders")
public class OrdersBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int autoOrderId;
	private int memberId;
	private String ordersDate;
	private String buyer;
	private String shipPhone;
	private String buyerEmail;
	private String shipAddress;
	private String storeName;
	private String storeAddress;
	private String shipStyle;
	private int shipCost;
	private int totalPrice;
	private String paymentStyle;
	private String ordersStatusId;

	
	
	
	@Override
	public String toString() {
		return "OrdersBean [autoOrderId=" + autoOrderId + ", memberId=" + memberId + ", ordersDate=" + ordersDate
				+ ", buyer=" + buyer + ", shipPhone=" + shipPhone + ", buyerEmail=" + buyerEmail + ", shipAddress="
				+ shipAddress + ", storeName=" + storeName + ", storeAddress=" + storeAddress + ", shipStyle="
				+ shipStyle + ", shipCost=" + shipCost + ", totalPrice=" + totalPrice + ", paymentStyle=" + paymentStyle
				+ ", ordersStatusId=" + ordersStatusId + "]";
	}
	public int getAutoOrderId() {
		return autoOrderId;
	}
	public void setAutoOrderId(int autoOrderId) {
		this.autoOrderId = autoOrderId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getOrdersDate() {
		return ordersDate;
	}
	public void setOrdersDate(String ordersDate) {
		this.ordersDate = ordersDate;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public String getShipPhone() {
		return shipPhone;
	}
	public void setShipPhone(String shipPhone) {
		this.shipPhone = shipPhone;
	}
	public String getBuyerEmail() {
		return buyerEmail;
	}
	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}
	public String getShipAddress() {
		return shipAddress;
	}
	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreAddress() {
		return storeAddress;
	}
	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
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
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getPaymentStyle() {
		return paymentStyle;
	}
	public void setPaymentStyle(String paymentStyle) {
		this.paymentStyle = paymentStyle;
	}
	public String getOrdersStatusId() {
		return ordersStatusId;
	}
	public void setOrdersStatusId(String ordersStatusId) {
		this.ordersStatusId = ordersStatusId;
	}
	
	
}
