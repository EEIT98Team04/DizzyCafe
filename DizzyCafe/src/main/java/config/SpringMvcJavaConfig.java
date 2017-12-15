package config;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.XmlViewResolver;

@Configuration
@ComponentScan(basePackages = { "applehead.controller", "tingwei.controller", "minghui.controller"})
@EnableWebMvc
public class SpringMvcJavaConfig implements WebMvcConfigurer {
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// DemoInterceptor demoInterceptor = new DemoInterceptor();
		// registry.addInterceptor(demoInterceptor).addPathPatterns("/coupons");
	}

	@Autowired
	private ServletContext application;

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		System.out.println("configureViewResolvers");
		Resource resource = new ServletContextResource(application, "/WEB-INF/views.xml");
		XmlViewResolver xvr = new XmlViewResolver();
		xvr.setLocation(resource);
		registry.viewResolver(xvr);
		
//		ResourceBundleViewResolver rbvr = new ResourceBundleViewResolver();
//		rbvr.setBasename("view.viewNames");
//		registry.viewResolver(rbvr);		
		
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8");
		return multipartResolver;
	}

}
