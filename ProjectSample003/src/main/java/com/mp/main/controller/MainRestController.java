package com.mp.main.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.mp.member.service.MemberService;
import com.mp.member.vo.Member;
import com.mp.post.service.PostService;
import com.mp.post.vo.Post;
import com.mp.restObject.ResultObject;

@RestController(value = "mainRestController")
@MapperScan(basePackages = "com.mp.member.mapper")
public class MainRestController {

	@Autowired
	private MemberService memberService;
	
	@PostMapping("/main/login")
	public ResponseEntity mainLogin(@RequestBody @Valid Member member, HttpServletRequest request, HttpServletResponse response) {
		System.out.println(member.getMember_acc());
		System.out.println(member.getMember_pw());
		member.setMember_name(null);
		HttpSession httpSession = request.getSession();
		Cookie[] cookie = request.getCookies();
		ResultObject ro = new ResultObject(null, null);
		if(memberService.indexMember(member).size() == 1) {
			ro.setResult_code("0");
			ro.setResult_msg("success");
			Member minfo = memberService.indexMember(member).get(0);
			httpSession.setAttribute("login_name", minfo.getMember_name());
			httpSession.setAttribute("login_uqid", minfo.getMember_uqid());
			httpSession.setAttribute("login_member_rank", minfo.getMember_rank());
			response.addCookie(cookie[0]);
		}else {
			ro.setResult_code("1");
			ro.setResult_msg("fail");
		}
		System.out.println(ro.getResult_msg());
		return ResponseEntity.ok(ro);
	}
}
