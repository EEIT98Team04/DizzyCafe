package tingweiSpringJavaConfig;

import org.springframework.web.context.AbstractContextLoaderInitializer;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;

public class ContextLoaderInitializer extends AbstractContextLoaderInitializer{
	@Override
	protected WebApplicationContext createRootApplicationContext() {
		AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();
		context.register(tingweiSpringJavaConfig.SpringJavaConfig.class);
		return context;
	}

}


//<param-value>springJavaConfig.SpringJavaConfig</param-value>
