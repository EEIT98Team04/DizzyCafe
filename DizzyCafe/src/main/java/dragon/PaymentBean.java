package dragon;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Payment")
public class PaymentBean {
	@Id
	private String paymentId;
	private String paymentStyle;

	@Override
	public String toString() {
		return "PaymentBean [paymentId=" + paymentId + ", paymentStyle=" + paymentStyle + "]";
	}
	
	
	public String getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	public String getPaymentStyle() {
		return paymentStyle;
	}
	public void setPaymentStyle(String paymentStyle) {
		this.paymentStyle = paymentStyle;
	}
	
}
