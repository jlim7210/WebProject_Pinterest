package com.mp.interceptor;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConf implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
//		List<String> patterns = new ArrayList();
//		patterns.add("/upload");
//		patterns.add("/edit");
//		patterns.add("/post/delete");
//		registry.addInterceptor(new LoginInterceptor()).addPathPatterns(patterns);
//		WebMvcConfigurer.super.addInterceptors(registry);
	}

}
