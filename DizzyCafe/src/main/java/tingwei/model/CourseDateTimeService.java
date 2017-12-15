package tingwei.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CourseDateTimeService {
	
	@Autowired
	private CourseDateTimeDAO courseDateTimeDAO;
	
	public boolean insert(CourseDateTimeBean bean) {
		CourseDateTimeBean temp = courseDateTimeDAO.insert(bean);
		if(temp!=null)
			return true;
		else
			return false;
	}
	
	public List<CourseDateTimeBean> showCourseDateTime() {
		System.out.println("CourseDateTimeService beanList:"+courseDateTimeDAO.select());
		return courseDateTimeDAO.select();
	}

}
