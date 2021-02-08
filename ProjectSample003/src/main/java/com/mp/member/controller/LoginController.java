package com.mp.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mp.member.service.MemberService;
import com.mp.member.vo.Member;

@Controller
public class LoginController {

	@Autowired
	private MemberService memberService;
	
//	@GetMapping("/login/main")
//	public String loginMain(Model model) {
//		model.addAttribute("Member", new Member());
//		return "Login/LoginMain";
//	}
//	modal window
	@RequestMapping("/login/mainAlt")
	public String loginMainAlt(@ModelAttribute("class") Class newClass, Model model) {
		model.addAttribute("Member", new Member());
		return "Main/main";
//		return "Login/LoginMainAlt";
	}
	
//	@PostMapping("/login/val")
//	public String validation(@RequestBody Member member, HttpServletRequest request, HttpServletResponse response, Model model) {
//		System.out.println(member.getMember_acc());
//		System.out.println(member.getMember_pw());
//		System.out.println(member.getMember_active());
//		
//		HttpSession httpSession = request.getSession();
//		
//		String result;
//		if(memberService.indexMember(member).size() == 1) {
////			session에 정보 담기
//			Member minfo = memberService.indexMember(member).get(0);
//			System.out.println("success");
//			result = "Main/main";
////			model.addAttribute("login_mem", minfo);
////			model.addAttribute("login_name", minfo.getMember_name());
////			model.addAttribute("login_uqid", minfo.getMember_uqid());
////			model.addAttribute("login_member_rank", minfo.getMember_rank());
//			
//			httpSession.setAttribute("login_name", minfo.getMember_name());
//			httpSession.setAttribute("login_uqid", minfo.getMember_uqid());
//			httpSession.setAttribute("login_member_rank", minfo.getMember_rank());
//		}else {
////			spring message : error 보내기
//			System.out.println("fail");
//			result = "redirect:/main";
//		}
//		return result;
//	}
	
}
