package applehead.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
@Transactional
public class CouponService {
	@Autowired
	CouponDAO couponDAO;
	
	//insert coupon
	public boolean insertCoupon(CouponBean bean) {
		if(bean!=null) {
			couponDAO.insert(bean);	
			return true;
		}
		return false;
	}
	
	//ajax用，selectById傳回GSON格式
	public JSONArray selectToJSON(int memberId) {
		List<Object[]> select = couponDAO.selectFromMemberIdObject(memberId);
		JSONArray json = new JSONArray();
		for(Object[] temp : select) {
			JSONObject xxx = new JSONObject();
			xxx.put("eventDiscount", temp[0]);
			xxx.put("couponDeadline", temp[1].toString());
			xxx.put("couponStatus", temp[2]);
			xxx.put("merchandiseName", temp[3]);
			json.add(xxx);
		}
		return json;
	}
	
	//coupon過期
	public List<CouponBean> updateDeadline(int memberId){
		List<CouponBean> result = null;
		List<CouponBean> list = new ArrayList<>();
		result = couponDAO.selectFromMemberId(memberId);
		if(result!=null) {
			for(CouponBean bean : result) {
				if(bean.getCouponStatus()==0) {
					if(bean.getCouponDeadline().before(new java.sql.Date(System.currentTimeMillis()))) {
						CouponBean temp = couponDAO.updateCouponStatus(2,bean.getCouponId());
						list.add(temp);
					}					
				}
			}
		}
		return list;
	}
}
