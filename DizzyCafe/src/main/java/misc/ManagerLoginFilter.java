package misc;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter(urlPatterns= {"/backstage/index.jsp","/backstage/activitiymanage.jsp",
		"/backstage/merchandisemanage.jsp","/backstage/courseManage.jsp"})
public class ManagerLoginFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		
		boolean alreadyLogin = req.getSession().getAttribute("manager") == null;
		
		if(alreadyLogin) {		
			request.setAttribute("error", "Please log in");
				req.getRequestDispatcher("/backstage/login.jsp").forward(req, resp);
				return;
		}
		
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
