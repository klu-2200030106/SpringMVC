package com.klef.jfsd.configuration;

import java.util.Properties;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.klef.jfsd.dao.EmployeeDAO;
import com.klef.jfsd.dao.EmployeeDAOImpl;
import com.klef.jfsd.model.Employee;
import com.klef.jfsd.service.EmployeeService;
import com.klef.jfsd.service.EmployeeServiceImpl;


@Configuration
@EnableTransactionManagement
@EnableWebMvc
public class ApplicationConfig  implements WebMvcConfigurer 
{
	
	@Bean
	public MappingJackson2HttpMessageConverter jsonConverter() {
	    return new MappingJackson2HttpMessageConverter();
	}
	//dbcp - database connection pool
   @Bean
      public BasicDataSource dataSource() 
      {
          BasicDataSource dataSource = new BasicDataSource();
          dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver"); // driver class
          dataSource.setUrl("jdbc:mysql://localhost:3306/springmvchibernate21"); //url
          dataSource.setUsername("root"); //user
          dataSource.setPassword("root");  //password
          return dataSource;
      }

      @Bean
      public Properties hibernateProperties() 
      {
          Properties hibernateProperties = new Properties();
          hibernateProperties.setProperty("hibernate.show_sql", "true");
          hibernateProperties.setProperty("hibernate.hbm2ddl.auto", "update");
          hibernateProperties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
          return hibernateProperties;
      }

      @Bean
      public LocalSessionFactoryBean localSessionFactoryBean() 
      {
          LocalSessionFactoryBean localSessionFactoryBean = new LocalSessionFactoryBean();
          localSessionFactoryBean.setDataSource(dataSource()); //first bean
          localSessionFactoryBean.setHibernateProperties(hibernateProperties()); //second bean
          localSessionFactoryBean.setPackagesToScan("com.klef.jfsd.model"); //mapping 
          return localSessionFactoryBean;
      }

      @Bean
      public HibernateTransactionManager hibernateTransactionManager() 
      {
          HibernateTransactionManager transactionManager = new HibernateTransactionManager();
          transactionManager.setSessionFactory(localSessionFactoryBean().getObject());
          return transactionManager;
      }
   
      @Bean
      public HibernateTemplate hibernateTemplate() 
      {
          HibernateTemplate hibernateTemplate = new HibernateTemplate();
          hibernateTemplate.setSessionFactory(localSessionFactoryBean().getObject());
          return hibernateTemplate;
      }
    
      @Bean
      public EmployeeDAO employeeDAO()
      {
    	    EmployeeDAOImpl daoImpl = new EmployeeDAOImpl();
    	    daoImpl.setHibernateTemplate(hibernateTemplate());
    	    return daoImpl;
      }
      
      @Bean
      public EmployeeService employeeService()
      {
    	   EmployeeServiceImpl servImpl=new EmployeeServiceImpl();
    	   servImpl.setEmployeeDAO(employeeDAO());
    	   return servImpl;
      }
      
      
      
      
}