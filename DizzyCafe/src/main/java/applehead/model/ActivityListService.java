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
public class ActivityListService {

	@Autowired
	ActivityListDAO activityListDAO;

	private final int itemsInPage = 3;

	public List<ActivityListBean> showPageItems(int nowPage) {
		// int totalItems = activityListDAO.itemsCount();
		List<ActivityListBean> showPage = new ArrayList<>();
		// Query<ActivityListBean> query = activityListDAO.selectQuery();
		// query.setFirstResult(nowPage*getItemsInPage());
		// query.setMaxResults(getItemsInPage());
		// showPage = query.list();
		List<ActivityListBean> temp = activityListDAO.selectList();
		for (int i = nowPage * getItemsInPage(); (nowPage * getItemsInPage()+getItemsInPage()) > i; i++) {
			if(temp.size()<=i) {
				break;
			}
			showPage.add(temp.get(i));
		}
		return showPage;
	}

	public ActivityListBean getBean(int activityNo) {
		ActivityListBean bean = null;
		bean = activityListDAO.select(activityNo);
		if (bean != null) {
			return bean;
		}
		return null;
	}

	public int calculateTotalPage() {
		int result = (activityListDAO.itemsCount()) / (getItemsInPage());
		int temp = (activityListDAO.itemsCount()) % (getItemsInPage());
		if (temp != 0) {
			result++;
		}
		return result;
	}

	public int getItemsInPage() {
		return itemsInPage;
	}
	
	public ActivityListBean createActivity(ActivityListBean bean) {
		ActivityListBean result = null;
		try {
			result = activityListDAO.insert(bean);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
	}
	
	public JSONArray showActivityInBackstage(){
		List<ActivityListBean> result = null;
		result = activityListDAO.selectList();
		String temp = new Gson().toJson(result);
		JSONArray json = JSONArray.fromObject(temp);
		return json;
	}

}
