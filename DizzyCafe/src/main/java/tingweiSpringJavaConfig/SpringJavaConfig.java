package tingweiSpringJavaConfig;

import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import tingwei.model.CourseBean;
import tingwei.model.CourseDateTimeBean;


@Configuration
@ComponentScan(basePackages= {"tingwei.model"})
@EnableTransactionManagement
public class SpringJavaConfig {
	
	@Bean
	public DataSource dataSource() {
		System.out.println("dataSource");
		try {
			Context ctx = new InitialContext();
			return (DataSource) ctx.lookup("java:comp/env/jdbc/DizzyCafe");
		} catch (NamingException e) {
			e.printStackTrace();
			throw new ExceptionInInitializerError(e);
		}
	}
	
	@Bean
	public SessionFactory sessionFactory() {
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource());
		Properties properties = new Properties();
		properties.setProperty("hibernate.dialect", "org.hibernate.dialect.SQLServerDialect");
//		properties.setProperty("hibernate.current_session_context_class", "thread");
		properties.setProperty("hibernate.show_sql", "true");
		builder.addProperties(properties);
		builder.addAnnotatedClasses(CourseBean.class,CourseDateTimeBean.class);
		return builder.buildSessionFactory();
	}
	
	@Bean
	public HibernateTransactionManager transactionManager() {
		return new HibernateTransactionManager(sessionFactory());	
	}
}

/*
<bean id="sessionFactory"
class="org.springframework.orm.hibernate5.LocalSessionFactoryBean">

<property name="dataSource" ref="dataSource"></property>
<property name="configLocation" value="classpath:hibernate.cfg.xml"></property>

</bean>
*/
