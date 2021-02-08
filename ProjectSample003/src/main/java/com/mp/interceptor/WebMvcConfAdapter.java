package com.mp.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@EnableWebMvc
@Configuration
public class WebMvcConfAdapter extends WebMvcConfigurerAdapter {

//	@Autowired
//	SignInInterceptor interceptor;
//	
//	@Override
//	   public void addInterceptors(InterceptorRegistry registry) {
//	      registry.addInterceptor(interceptor).addPathPatterns("/main");
//	   }
	
}
