package applehead.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import applehead.model.ActivityListBean;
import applehead.model.ActivityListService;

@Controller
public class CreateActivity {
	@Autowired
	ServletContext context;
	@Autowired
	ActivityListService activityListService;

	@RequestMapping(path = "/createEvent.controller", method = { RequestMethod.GET, RequestMethod.POST })
	public String createEvent(String activityName, String activityStart, String activityEnd, String activityContent,
			MultipartFile activityPicture, Model model) {
		java.sql.Date startDate = null;
		java.sql.Date endDate = null;
		try {
			startDate = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(activityStart).getTime());
			endDate = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(activityEnd).getTime());
		} catch (ParseException e1) {
			e1.printStackTrace();
			return "createActivity.success";
		}

		ActivityListBean bean = new ActivityListBean();
		bean.setActivityName(activityName);
		bean.setActivityStart(startDate);
		bean.setActivityEnd(endDate);
		bean.setActivityContent(activityContent);

		if (!activityPicture.isEmpty()) {
			try {
				ActivityListBean temp = activityListService.createActivity(bean);
				byte[] bytes = activityPicture.getBytes();

				// Create the file on server
				String[] strs = activityPicture.getContentType().split("/");
//				String server_path = "C://DizzyCafe/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/DizzyCafe";
				String path = "/activity/res/images/" + temp.getActivityNo() + "." + strs[1];

				temp.setActivityPicture(path);
				File serverFile = new File(context.getRealPath(".") + path);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				activityListService.updateActivity(temp);
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
