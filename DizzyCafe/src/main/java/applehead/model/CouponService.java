package applehead.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import net.sf.json.JSONArray;

@Service
@Transactional
public class CouponService {
	@Autowired
	CouponDAO couponDAO;
	
	//insert coupon
	public void insertCoupon(CouponBean bean) {
		if(bean!=null) {
			couponDAO.insert(bean);	
		}
	}
	
	//ajax用，selectById傳回GSON格式
	public JSONArray selectToJSON(int memberId) {
		List<CouponBean> select = couponDAO.selectFromMemberId(memberId);
		String temp = new Gson().toJson(select );
		JSONArray json = JSONArray.fromObject(temp);
		return json;
	}
	
	//coupon過期
	public List<CouponBean> updateDeadline(int memberId){
		List<CouponBean> result = null;
		List<CouponBean> list = new ArrayList<>();
		//還要更新memberId
		result = couponDAO.selectFromMemberId(102);
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
		System.out.println("result = "+list);
		return list;
	}
}
