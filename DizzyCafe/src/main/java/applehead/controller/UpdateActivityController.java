package applehead.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import applehead.model.ActivityDetailsBean;
import applehead.model.ActivityDetailsService;
import applehead.model.ActivityListBean;
import applehead.model.ActivityListService;

@Controller
public class UpdateActivityController {
	@Autowired
	ServletContext context;
	@Autowired
	ActivityListService activityListService;
	@Autowired
	ActivityDetailsService activityDetailsService;
	@RequestMapping(
				path="/updateEvent.controller",
				method= {RequestMethod.POST}
			)
	public String updateActivity(String activityNo,String activityName,String activityStart,
			String activityEnd,String activityContent,
			MultipartFile activityPicture, String merchandiseTag,String activityDiscount,String ADnumber) {
		java.sql.Date startDate = null;
		java.sql.Date endDate = null;
		try {
			startDate = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(activityStart).getTime());
			endDate = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(activityEnd).getTime());
		} catch (ParseException e1) {
			e1.printStackTrace();
			return "createActivity.success";
		}
		ActivityListBean bean = activityListService.getBean(Integer.valueOf(activityNo));
		ActivityDetailsBean bean2 = activityDetailsService.selectById(Integer.valueOf(ADnumber));
		
		bean.setActivityName(activityName);
		bean.setActivityStart(startDate);
		bean.setActivityEnd(endDate);
		bean.setActivityContent(activityContent);
		
		bean2.setActivityDiscount(Double.parseDouble(activityDiscount)/10);
		bean2.setActivityNo(Integer.valueOf(activityNo));
		bean2.setMerchandiseTag(merchandiseTag);
		
		activityDetailsService.updateActivity(bean2);
		if (!activityPicture.isEmpty()) {
			try {
				byte[] bytes = activityPicture.getBytes();
	
				// Create the file on server
				String[] strs = activityPicture.getContentType().split("/");
//				String server_path = "C://DizzyCafe/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/DizzyCafe";
				String path = "/activity/res/images/" + bean.getActivityNo() + "." + strs[1];
				
				bean.setActivityPicture(path);
				File serverFile = new File(context.getRealPath(".") + path);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				
				activityListService.updateActivity(bean);
				return "createActivity.success";
			} catch (Exception e) {
				System.out.println(e.getMessage());				
				return "createActivity.success";
			}
		} else {
			activityListService.updateActivity(bean);
			return "createActivity.success";
		}
	}
}
