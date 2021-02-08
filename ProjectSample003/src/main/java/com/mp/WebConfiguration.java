package com.mp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.thymeleaf.spring5.templateresolver.SpringResourceTemplateResolver;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ITemplateResolver;

import com.mp.interceptor.SignInInterceptor;

@Configuration
public class WebConfiguration extends WebMvcConfigurationSupport implements ApplicationContextAware {
	
	@Autowired
	SignInInterceptor signInInterceptor;
	
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) { 
            registry.addResourceHandler("/**").addResourceLocations("classpath:/static/");
    }

	@Override
	protected void addInterceptors(InterceptorRegistry registry) {
		List<String> patterns = new ArrayList();
		patterns.add("/gallery");
		patterns.add("/logout");
		patterns.add("/fileupload3");
		patterns.add("/edit_confirm");
		patterns.add("/member/info");
		patterns.add("/member/info/edit");
		patterns.add("/member/info/close");
		patterns.add("/edit");
		patterns.add("/reply/add");
		patterns.add("/chat");
		registry.addInterceptor(signInInterceptor).addPathPatterns(patterns);
		super.addInterceptors(registry);
	}
	
}

    
