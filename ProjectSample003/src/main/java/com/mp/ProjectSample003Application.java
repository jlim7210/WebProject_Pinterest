package com.mp;

import java.io.IOException;
import java.net.ServerSocket;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Primary;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import com.mp.interceptor.MvcConf;

@MapperScan(basePackages = "com.mp.member.mapper")
@SpringBootApplication
public class ProjectSample003Application {

	public static void main(String[] args) {
		SpringApplication.run(ProjectSample003Application.class, args);
	}

	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource);
		Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:*.xml");
		
		sessionFactory.setMapperLocations(res);
		
		return sessionFactory.getObject();
	}
	
//	@Bean
//	public SqlSession sqlSession(SqlSessionFactory sqlSessionFactory) {
//		return sqlSessionFactory.openSession();
//	}
	
	@Bean
	@Primary
	public SqlSession sqlSession(SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}
	
	@Bean
	public MessageSource messageSource() {
	    ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
	    messageSource.setBasename("classpath:messages/message");
	    messageSource.setCacheSeconds(10); //reload messages every 10 seconds
	    return messageSource;
	}
	
}
