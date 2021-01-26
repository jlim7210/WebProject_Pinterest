package com.mp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession httpSession = request.getSession();
		String name = (String) httpSession.getAttribute("login_name");
		if("".equals(name) || null == name) {
			response.sendRedirect("Error/NullUser");
			return false;
		}else {
			return HandlerInterceptor.super.preHandle(request, response, handler);
		}
	}

//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		System.out.println("======================================");
//		System.out.println("post-handler");
//		System.out.println("======================================");
//		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
//	}

}
