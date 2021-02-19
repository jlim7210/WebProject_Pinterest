package com.mp.main.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mp.post.service.PostService;
import com.mp.post.vo.Post;

@Controller
public class MainController {

	@Autowired
	private PostService postService;
	@Autowired
	private MessageSource messageSource;

	@RequestMapping("/main")
	public String get_to_main(HttpServletRequest request) throws IOException {
		String result = "";
		HttpSession hs = request.getSession();
		System.out.println("main controller / get_to_main");
		if(hs.getAttribute("login_name")!=null) {
			result = "redirect:/gallery";
		}else {
			result += "Main/main";
		}
		return result;
	}
	
	@RequestMapping("/gallery")
	public String get_to_gallery(HttpServletRequest request, HttpServletResponse response) {
		String result = "";
		HttpSession hs = request.getSession();
		if(hs.getAttribute("login_name")!=null) {
			List<HashMap> post_list = null;
			List file_name_list = new ArrayList();
			post_list = postService.readJoin(new Post());
			for(HashMap p : post_list) {
				file_name_list.add((String) p.get("chg_file_name"));
			}
			hs.setAttribute("list", post_list);
			hs.setAttribute("file_list", file_name_list);
			result = "Post/PostRead2";
		}else {
//			result += "redirect:/main";
		}
		return result;
	}
	
	// 나중에 수정 아이디어: 아작스로 해당 페이지 리턴하기
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession hs = request.getSession();
		hs.invalidate();
		return "redirect:/main";
	}

	@RequestMapping("/chat")
	public String to_chat_room(HttpServletRequest request, HttpServletResponse response) {
		return "chatting/chatRoom";
	}
}
