package applehead.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import applehead.model.ActivityListBean;
import applehead.model.ActivityListService;

@Controller
public class UpdateActivityController {
	
	@Autowired
	ActivityListService activityListService;
	@RequestMapping(
				path="/updateEvent.controller",
				method= {RequestMethod.POST}
			)
	public String updateActivity(String activityNo,String activityName,String activityStart,
			String activityEnd,String activityContent,
			MultipartFile activityPicture) {
		
		java.sql.Date startDate = null;
		java.sql.Date endDate = null;
		try {
			startDate = new java.sql.Date(new SimpleDateFormat("MM/dd/yyyy").parse(activityStart).getTime());
			endDate = new java.sql.Date(new SimpleDateFormat("MM/dd/yyyy").parse(activityEnd).getTime());
		} catch (ParseException e1) {
			e1.printStackTrace();
			return "createActivity.success";
		}
		ActivityListBean bean = activityListService.getBean(Integer.valueOf(activityNo));
		
		bean.setActivityName(activityName);
		bean.setActivityStart(startDate);
		bean.setActivityEnd(endDate);
		bean.setActivityContent(activityContent);
		
		if(activityPicture==null) {
			bean.setActivityPicture(bean.getActivityPicture());
			return "createActivity.success";
		}
		if (!activityPicture.isEmpty()) {
			try {
				byte[] bytes = activityPicture.getBytes();
	
				// Create the file on server
				String[] strs = activityPicture.getContentType().split("/");
				String server_path = "C://DizzyCafe/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/DizzyCafe";
				String path = "/activity/res/images/" + bean.getActivityNo() + "." + strs[1];
				
				bean.setActivityPicture(path);
				File serverFile = new File(server_path + path);
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
			return "createActivity.success";
		}
	}
}
