package wayne.config;

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
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import wayne.model.MerchandiseBean;


@Configuration
@ComponentScan(basePackages= {"wayne.model"})
@EnableTransactionManagement
public class SpringJavaConfig{
	@Bean
	public DataSource dataSource() {
		try {
			Context ctx = new InitialContext();
			return (DataSource) ctx.lookup("java:comp/env/jdbc/xxx");
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
		builder.addAnnotatedClasses(MerchandiseBean.class);
		return builder.buildSessionFactory();
	}
	@Bean
	public PlatformTransactionManager txManager() {
		return new HibernateTransactionManager(sessionFactory());
	}
}
