package dragon.spring;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.XmlViewResolver;

@Configuration
@ComponentScan(basePackages= {"controller"})
@EnableWebMvc
public class SpringMvcJavaConfiguration implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new controller.DemoInterceptor())
				.addPathPatterns("/*");
		/*攔截所有網址*/
	}
	@Autowired
	private ServletContext application;
	//設定View Resolver
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		XmlViewResolver viewResolver = new XmlViewResolver();
		Resource resource = new ServletContextResource(application, "/WEB-INF/views.xml");
		viewResolver.setLocation(resource);
		registry.viewResolver(viewResolver);
	}

	
}
