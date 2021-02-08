package com.mp.interceptor;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@EnableWebMvc
@Configuration
public class MvcConf implements WebMvcConfigurer{
	
//	@Autowired
//	@Qualifier(value = "signInInterceptor")
//	private HandlerInterceptor interceptor;
//
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		List<String> patterns = new ArrayList();
//		System.out.println("123123");
//		patterns.add("/main");
//		registry.addInterceptor(interceptor)
//			.addPathPatterns(patterns);
//		WebMvcConfigurer.super.addInterceptors(registry);
//		
//	}

}
