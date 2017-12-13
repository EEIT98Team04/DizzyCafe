package hongwen.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import net.sf.json.JSONArray;

@Service
@Transactional
public class BoardService {
	@Autowired
	BoardDAO boardDAO;
	
	//ajax用，selectById傳回GSON格式
	public JSONArray selectToJSON() {
		List<BoardBean> select = boardDAO.select();
		String temp = new Gson().toJson(select );
		JSONArray json = JSONArray.fromObject(temp);
		return json;
	}	
	
//	//insert coupon
//	public void insertCoupon(BoardBean bean) {
//		if(bean!=null) {
//			boardDAO.insert(bean);	
//		}
//	}
	
	//coupon過期
//	public List<BoardBean> updateDeadline(int memberId){
//		List<BoardBean> result = null;
//		List<BoardBean> list = new ArrayList<>();
//		//還要更新memberId
//		result = boardDAO.selectFromMemberId(102);
//		if(result!=null) {
//			for(BoardBean bean : result) {
//				if(bean.getCouponStatus()==0) {
//					if(bean.getCouponDeadline().before(new java.sql.Date(System.currentTimeMillis()))) {
//						BoardBean temp = boardDAO.updateCouponStatus(2,bean.getCouponId());
//						list.add(temp);
//					}					
//				}
//			}
//		}
//		System.out.println("result = "+list);
//		return list;
//	}
}
