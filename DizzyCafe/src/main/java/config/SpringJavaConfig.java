package config;

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

import applehead.model.ActivityListBean;
import applehead.model.CouponBean;
import dragon.model.OrdersBean;
import dragon.model.OrdersDetailsBean;
import dragon.model.ShoppingBean;
import hongwen.model.BoardBean;
import hongwen.model.DocumentBean;
import hongwen.model.ReplyBean;
import minghui.model.MemberBean;
import tingwei.model.CourseBean;
import tingwei.model.CourseDateTimeBean;
import tingwei.model.CourseMemberBean;
import wayne.model.MerchandiseBean;

@Configuration
@ComponentScan(basePackages= {"applehead.model","tingwei.model","wayne.model","hongwen.model","minghui.model","dragon.model"})
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
		System.out.println("sessionFactory");
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource());
		Properties properties = new Properties();		
		properties.setProperty("hibernate.dialect", "org.hibernate.dialect.SQLServerDialect");
//		properties.setProperty("hibernate.current_session_context_class", "thread");
		properties.setProperty("hibernate.show_sql", "true");
		builder.addProperties(properties);
		builder.addAnnotatedClasses(ActivityListBean.class,CouponBean.class,CourseBean.class,CourseDateTimeBean.class,CourseMemberBean.class,MerchandiseBean.class,MemberBean.class,OrdersBean.class,OrdersDetailsBean.class,ShoppingBean.class);
		builder.addAnnotatedClasses(BoardBean.class,DocumentBean.class,ReplyBean.class);
		

		return builder.buildSessionFactory();
	}
	@Bean
	public PlatformTransactionManager txManager() {
		return new HibernateTransactionManager(sessionFactory());
	}
}
