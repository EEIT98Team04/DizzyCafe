package dragon;

import java.util.List;

public interface PaymentDAO {
	
	PaymentBean select(String paymentId);
	
	List<PaymentBean> select();
	
	int insert(PaymentBean bean);
	
	int update(PaymentBean bean);
	
	int delete(String paymentId);
}
