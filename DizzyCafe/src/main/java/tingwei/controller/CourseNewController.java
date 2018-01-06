package tingwei.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tingwei.model.CourseBean;
import tingwei.model.CourseDateTimeService;
import tingwei.model.CourseService;

@Controller
@RequestMapping("/course/courseNew.controller")
public class CourseNewController {
	
	@Autowired
	private CourseService courseService;
	@Autowired
	private CourseDateTimeService courseDateTimeService;
	@Autowired
	private ServletContext servletContext;
	
	
	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST})
	public String method(Model model, String courseName, String courseIntro,
			String courseContent, int courseCost,
			String courseTeacher, int courseLimit,
			String courseSignupBegin, String courseSignupEnd,
			String courseBegin, String courseEnd,
			String[] whichDay,int time ,int courseLength,
			MultipartFile courseImg, RedirectAttributes redirectAttrs) {
		
		SimpleDateFormat dateFormate = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date courseSignupBeginNew = null;
		java.sql.Date courseSignupEndNew = null;
		java.sql.Date courseBeginNew = null;
		java.sql.Date courseEndNew = null;
		
		try {
			courseSignupBeginNew = new java.sql.Date(dateFormate.parse(courseSignupBegin).getTime());
			courseSignupEndNew = new java.sql.Date(dateFormate.parse(courseSignupEnd).getTime());
			courseBeginNew = new java.sql.Date(dateFormate.parse(courseBegin).getTime());
			courseEndNew = new java.sql.Date(dateFormate.parse(courseEnd).getTime());
		} catch (ParseException e1) {
			e1.printStackTrace();
		}

		String courseWeek = "";
		for(String var : whichDay) {
			courseWeek = courseWeek + var;
		}
		
		CourseBean courseBean = new CourseBean();
		courseBean.setCourseName(courseName);
		courseBean.setCourseIntro(courseIntro);
		courseBean.setCourseContent(courseContent);
		courseBean.setCourseCost(courseCost);
		courseBean.setCourseTeacher(courseTeacher);
		courseBean.setCourseLimit(courseLimit);
		courseBean.setCourseSignupBegin(courseSignupBeginNew);
		courseBean.setCourseSignupEnd(courseSignupEndNew);
		courseBean.setCourseBegin(courseBeginNew);
		courseBean.setCourseEnd(courseEndNew);
		courseBean.setCourseTime(time);
		courseBean.setCourseLength(courseLength);
		courseBean.setCourseWeek(courseWeek);
		
		//redirectAttrs.addFlashAttribute("newCourse", "新增成功");
		
		if (!courseImg.isEmpty()) {
			try {
				byte[] bytes = courseImg.getBytes();
	
				// Create the file on server
				String[] strs = courseImg.getContentType().split("/");
				String path = "/image/course/" + courseBean.getCourseId() + "." + strs[1];
				
				courseBean.setCourseImg(path);
				File serverFile = new File(servletContext.getRealPath(".") + path);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				
				courseService.insert(courseBean);
				courseDateTimeService.insertAll(courseBean, whichDay, time, courseLength);

				
				return "courseManage";
			} catch (Exception e) {
				System.out.println(e.getMessage());				
				return "courseManage";
			}
		} else {
			return "courseManage";
		}
	}

}
