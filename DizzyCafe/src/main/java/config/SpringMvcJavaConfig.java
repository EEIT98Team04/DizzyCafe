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
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.XmlViewResolver;

@Configuration
@ComponentScan(basePackages= {"applehead.controller","tingwei.controller","hongwen.controller","minghui.controller","wayne.controller"})
@EnableWebMvc
public class SpringMvcJavaConfig implements WebMvcConfigurer{
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
//		DemoInterceptor demoInterceptor = new DemoInterceptor();
		
		//禁止使用者登入登出後回上一頁
//		SecurityInterceptor securityInterceptor = new SecurityInterceptor(); 
//		registry.addInterceptor(securityInterceptor).addPathPatterns("/*");
		
		//檢查是否登入
//		LoginInterceptor loginInterceptor = new LoginInterceptor();
//		registry.addInterceptor(loginInterceptor).addPathPatterns("/member");
	}

	@Autowired
	private ServletContext application;
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		
		Resource resource = new ServletContextResource(application, "/WEB-INF/views.xml");
		XmlViewResolver xvr = new XmlViewResolver();
		xvr.setOrder(5);
		xvr.setLocation(resource);
		registry.viewResolver(xvr);
		
		InternalResourceViewResolver irvr = new InternalResourceViewResolver();
		irvr.setOrder(10);
		irvr.setPrefix("/");
		irvr.setSuffix(".jsp");
		registry.viewResolver(irvr);
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
