package config;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.XmlViewResolver;

@Configuration
@ComponentScan(basePackages= {"wayne.controller"})
@EnableWebMvc
public class WayneSpringMvcJavaConfig implements WebMvcConfigurer {
	
	@Autowired
	private ServletContext application;

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		Resource resource = new ServletContextResource(application, "/WEB-INF/wayneviews.xml");
		XmlViewResolver xvr = new XmlViewResolver();
		xvr.setLocation(resource);
		registry.viewResolver(xvr);
	}
		
}
