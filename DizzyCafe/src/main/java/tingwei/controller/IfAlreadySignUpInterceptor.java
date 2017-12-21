package tingwei.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class IfAlreadySignUpInterceptor implements HandlerInterceptor {

	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		request.getSession();
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
}	
