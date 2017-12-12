package tingweiSpringJavaConfig;

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
@ComponentScan(basePackages= {"tingwei.controller"})
@EnableWebMvc
public class SpringMvcJavaConfig implements WebMvcConfigurer{

	@Autowired
	private ServletContext servletContext;
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		System.out.println("registry View Resolvers");
		Resource resource = new ServletContextResource(servletContext, "/WEB-INF/viewnames.xml");
		XmlViewResolver viewResolver = new XmlViewResolver();
		viewResolver.setLocation(resource);
		registry.viewResolver(viewResolver);
		
	}
	
}


/*
	<context:component-scan base-package="controller"></context:component-scan>	
	
	<bean class="org.springframework.web.servlet.view.XmlViewResolver">
		<property name="location" value="/WEB-INF/viewnames.xml"></property>
	</bean>
*/