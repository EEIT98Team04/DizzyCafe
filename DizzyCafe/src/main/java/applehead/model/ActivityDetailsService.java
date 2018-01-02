package applehead.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ActivityDetailsService {
	@Autowired
	ActivityDetailsDAO activityDetailsDAO;
	
	public boolean updateActivity(ActivityDetailsBean bean) {
		try {
			activityDetailsDAO.update(bean);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public boolean insertActivity(ActivityDetailsBean bean) {
		try {
			activityDetailsDAO.insert(bean);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public ActivityDetailsBean selectById(int id) {
		ActivityDetailsBean result = null;
		try {
			result = activityDetailsDAO.selectById(id);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
	}
}
