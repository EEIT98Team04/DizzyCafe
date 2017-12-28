package tingwei.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.sf.json.JSONArray;

@Service
@Transactional
public class CourseDateTimeService {
	
	@Autowired
	CourseDateTimeDAO courseDateTimeDAO;
	@Autowired
	CourseDAO courseDAO;
	
	public boolean insert(CourseDateTimeBean bean) {
		CourseDateTimeBean temp = courseDateTimeDAO.insert(bean);
		if(temp!=null)
			return true;
		else
			return false;
	}
	
	public void insertAll(CourseBean temp , String[] whichDay,int time ,int courseLength) {
		CourseDateTimeBean courseDateTimeBean = new CourseDateTimeBean();
		courseDateTimeBean.setCourseId(temp.getCourseId());
		Calendar cal1 = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		cal1.setTime(temp.getCourseBegin());
		cal2.setTime(temp.getCourseEnd());
		for(;cal1.getTimeInMillis()<cal2.getTimeInMillis();cal1.add(Calendar.DATE, 1)) {
			//day_in_week等於選擇的上課時間的話新增一筆資料
			for(String var : whichDay) {
				if(cal1.get(Calendar.DAY_OF_WEEK)==Integer.valueOf(var)) {
					courseDateTimeBean.setCourseStartTime(new java.sql.Timestamp(cal1.getTimeInMillis()
							+time*3600000));
					courseDateTimeBean.setCourseEndTime(new java.sql.Timestamp(cal1.getTimeInMillis()
							+(time+courseLength)*3600000));
					System.out.println("courseDateTimeBean"+courseDateTimeBean);
					this.insert(courseDateTimeBean);
				}
			}
		}
	}
	
	public List<CourseDateTimeBean> select() {
		System.out.println("CourseDateTimeService beanList:"+courseDateTimeDAO.select());
		return courseDateTimeDAO.select();
	}
	
	public JSONArray selectJoinCourse(){
		return courseDateTimeDAO.selectJoinCourse();
	}
	
	public void delete(int courseId) {
		courseDateTimeDAO.delete(courseId);
	}
	
	public void deleteAll() {
		courseDateTimeDAO.deleteAll();
	}
	
	public void insertAll(List<CalendarJSON> calendarData) {
		for(CalendarJSON data : calendarData) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss"); 
			CourseDateTimeBean courseDateTimeBean = new CourseDateTimeBean();
			courseDateTimeBean.setCourseId(courseDAO.getIdFromName(data.getTitle()));
			try {
				courseDateTimeBean.setCourseStartTime(new java.sql.Timestamp(format.parse(data.getStart()).getTime()));
				courseDateTimeBean.setCourseEndTime(new java.sql.Timestamp(format.parse(data.getEnd()).getTime()));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			this.insert(courseDateTimeBean);
		}
	}

}
