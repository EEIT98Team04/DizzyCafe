package config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class DispatcherServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return null;
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {config.SpringMvcJavaConfig.class};
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] {"*.controller","/activities","/coupons","/merchandise","*.hongwen","*.hohoho"};
	}

}
