package com.mp.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@Autowired
	private MessageSource messageSource;

	@RequestMapping("/main")
	public String get_to_main(HttpServletRequest request) {
		System.out.println("main access");
		String result = "";
		HttpSession hs = request.getSession();
		
		if(hs.getAttribute("login_name")!=null) {
			System.out.println("logged in");
//			result = "redirect:/Post/PostRead2";
			result = "Post/PostRead2";
		}else {
			System.out.println("notlogged in");
			result += "Main/main";
		}
//		messageSource.getMessage("error.404", null, LocaleContextHolder.getLocale());
//		errors.reject("required", "email");
		return result;
	}
	
	@RequestMapping("/Error/NullUser")
	public String no_user() {
		return "Error/NullUser";
	}

	// 나중에 수정 아이디어: 아작스로 해당 페이지 리턴하기
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession hs = request.getSession();
		hs.invalidate();
		return "redirect:/main";
	}

	@RequestMapping("/test")
	public String tete() {
		return "test";
	}
}
