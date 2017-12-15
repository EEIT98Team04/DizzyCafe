package minghui.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import minghui.model.LoginService;
import minghui.model.MemberBean;

//@WebServlet("/TestImg.do")
//@MultipartConfig
public class TestUpload extends HttpServlet{
	private LoginService loginService;
		
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		ApplicationContext context = (ApplicationContext)
				application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		loginService = (LoginService) context.getBean("loginService");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setCharacterEncoding("UTF-8");
//		
//		MemberBean bean = new MemberBean();
//		bean.setMemberName(req.getParameter("memberName"));
//		bean.setMemberPassword(req.getParameter("memberPassword1"));
//		bean.setMemberPhone(req.getParameter("memberPhone"));
//		bean.setMemberEmail(req.getParameter("memberEmail"));
//		bean.setMemberAddress(req.getParameter("memberAddress"));
//		
//		try {
//			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
//			bean.setMemberBirth(sf.parse(req.getParameter("memberBirth")));
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//				
//		
//		Collection<Part> parts = req.getParts();
//		if (parts != null) {
//			for (Part part : parts) {
//				if (part.getContentType() != null) {
//					String[] strs = part.getContentType().split("/");
//					String path = "/minghui/res/member_photo/" + bean.getMemberName() + "." + strs[1];
//					part.write(
//						"C://DizzyCafe/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/DizzyCafe" + path);
//					String photo_path = path;
//					bean.setMemberPhoto(photo_path);
//				}
//			}
//		}
//		if(!loginService.register(bean)) {
//			String error = "註冊失敗，帳號已存在";
//			req.setAttribute("error_register", error);
//			req.getRequestDispatcher("/index.jsp").forward(req, resp);;
//			return;
//		}
//
//		String context_path = req.getContextPath();
//		resp.sendRedirect(context_path + "/index.jsp");
	}

}
