package com.mp.member.controller;

import java.io.IOException;
import java.net.URI;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mp.email.Entry;
import com.mp.member.service.MemberService;
import com.mp.member.service.MemberVal;
import com.mp.member.vo.Member;
import com.mp.restObject.ResultObject;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@RestController
@MapperScan(basePackages = "com.mp.member.mapper")
public class MemberRestController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVal memberVal;
	@Autowired
	private Entry entry;
	
	@PostMapping("/info/editR")
	public ResponseEntity edit(@RequestBody Member member, HttpServletRequest request, HttpServletResponse response) {
		ResultObject ro = new ResultObject();
		HttpSession session = request.getSession();
		String loginName = (String)session.getAttribute("login_name");
		Member index = new Member();
		index.setMember_name(loginName);
		Member preMem = memberService.indexMember(index).get(0);
		
		System.out.println(preMem.getMember_name());
		preMem.setMember_name(member.getMember_name());
		System.out.println(preMem.getMember_name());
		memberService.edit(preMem);
		session.setAttribute("login_name", preMem.getMember_name());
		return ResponseEntity.ok(ro);
	}
	
	@PostMapping("/login/val")
	public ResponseEntity validation(@RequestBody Member member, HttpServletRequest request, HttpServletResponse response) {
		HttpSession httpSession = request.getSession();
		System.out.println("member rest con / validation");
		if(memberService.loginMember(member).size() == 1) {
//			session에 정보 담기
			Member minfo = memberService.indexMember(member).get(0);
			httpSession.setAttribute("login_name", minfo.getMember_name());
			httpSession.setAttribute("login_uqid", minfo.getMember_uqid());
			httpSession.setAttribute("login_member_rank", minfo.getMember_rank());
		}else {
//			spring message : error 보내기
			return ResponseEntity.badRequest().build();
		}
		return ResponseEntity.ok().build();
	}
	
	@PostMapping("/signUp")
	public ResponseEntity new_mem(@RequestBody @Valid  Member member, Errors errors, HttpServletRequest request, HttpServletResponse response, BindingResult result) throws IOException {
		HttpSession httpSession = request.getSession();
		if( result.hasErrors() ) {
			return ResponseEntity.badRequest().build();
		}
		ResultObject ro = memberVal.createNewMember(member);
		if (Integer.parseInt(ro.getResult_code()) >= 1) {
			System.out.println(ro.getResult_msg());
			return ResponseEntity.badRequest().build();
		}
		memberService.insertMember(member);
		Member minfo = memberService.indexMember(member).get(0);
		httpSession.setAttribute("login_name", minfo.getMember_name());
		httpSession.setAttribute("login_uqid", minfo.getMember_uqid());
		httpSession.setAttribute("login_member_rank", minfo.getMember_rank());
		
		Cookie cookie = new Cookie("first_time", "true");
		response.addCookie(cookie);
		
//		이메일 보내기
		entry.setBODY(member.getMember_email().hashCode());
		entry.setSUBJECT("안녕하세요"+member.getMember_name()+"!");
		entry.setTO(member.getMember_email());
		try {
			entry.send_email();
		} catch (Exception e) {
			e.printStackTrace();
		}
		entry.close_entry();
//		------------
		
		return ResponseEntity.ok().build();
	}
	
	@PostMapping("member/info/close")
	public ResponseEntity close(@RequestBody Member member, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String loginName = (String)session.getAttribute("login_name");
		Member index = new Member();
		index.setMember_name(loginName);
		Member preMem = memberService.indexMember(index).get(0);
		preMem.setMember_active(0);
		memberService.edit(preMem);
		session.invalidate();
		return ResponseEntity.ok().build();
	}
}
