package com.mp.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mp.member.service.MemberService;
import com.mp.member.vo.Member;
import com.mp.restObject.ResultObject;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@RestController
@MapperScan(basePackages = "com.mp.member.mapper")
public class MemberRestController {

	@Autowired
	private MemberService memberService;
	
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
		if(memberService.indexMember(member).size() == 1) {
//			session에 정보 담기
			Member minfo = memberService.indexMember(member).get(0);
			httpSession.setAttribute("login_name", minfo.getMember_name());
			httpSession.setAttribute("login_uqid", minfo.getMember_uqid());
			httpSession.setAttribute("login_member_rank", minfo.getMember_rank());
		}else {
//			spring message : error 보내기
		}
		return ResponseEntity.ok(new ResultObject());
	}
}
