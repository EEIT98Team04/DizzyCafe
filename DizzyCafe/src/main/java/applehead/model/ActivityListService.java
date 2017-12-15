package applehead.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ActivityListService {

	@Autowired
	ActivityListDAO activityListDAO;

	private final int itemsInPage = 2;

	public List<ActivityListBean> showPageItems(int nowPage) {
		// int totalItems = activityListDAO.itemsCount();
		List<ActivityListBean> showPage = new ArrayList<>();
//		 Query<ActivityListBean> query = activityListDAO.selectQuery();
//		 query.setFirstResult(nowPage*getItemsInPage());
//		 query.setMaxResults(getItemsInPage());
//		 showPage = query.list();
		List<ActivityListBean> temp = activityListDAO.selectList();
		showPage.add(temp.get(nowPage * getItemsInPage()));
		if (temp.size() >= (nowPage+1) * getItemsInPage()) {
			showPage.add(temp.get(nowPage * getItemsInPage() + 1));
		}
		return showPage;
	}
	public ActivityListBean getBean(int activityNo) {
		ActivityListBean bean = null;
		bean = activityListDAO.select(activityNo);
		if(bean!=null) {
			return bean;
		}
		return null;
	}

	public int calculateTotalPage() {
		int result = (activityListDAO.itemsCount()) / (getItemsInPage());
		int temp = (activityListDAO.itemsCount()) % (getItemsInPage());
		if(temp!=0) {
			result++;
		}
		return result;
	}

	public int getItemsInPage() {
		return itemsInPage;
	}

}
