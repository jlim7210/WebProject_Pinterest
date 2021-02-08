package com.mp.member.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mp.member.service.MemberService;
import com.mp.member.service.MemberVal;
import com.mp.member.vo.Member;
import com.mp.restObject.ResultObject;

import lombok.extern.slf4j.Slf4j;

@Validated
@Slf4j
@Controller
@RequestMapping("/member")
//@RequestMapping
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVal memberVal;

//	sign in page
	@GetMapping("/snf")
	public String signupFirst() {
		return "Member/signup1";
	}

	@PostMapping("/sns")
	public String signupSecond(Model model, Member member, @RequestParam("radio") String radio, Errors errors) {
		if ("agree".equals(radio)) {
			model.addAttribute("Member", new Member());
			return "Member/signup2";
		} else {
			return "redirect:/member/snf";
		}
	}

	@RequestMapping("/snt")
	public String signupThrid(@RequestBody @Valid Member member, Errors errors, BindingResult result) {
		ResultObject ro = memberVal.createNewMember(member);
		if( result.hasErrors() ) {

			// 에러를 List로 저장
			List<ObjectError> list = result.getAllErrors();
			for( ObjectError error : list ) {
				System.out.println(error);
			}
			return "Member/signup2";
		}
		
		if (Integer.parseInt(ro.getResult_code()) >= 1) {
			System.out.println(ro.getResult_msg());
			return "redirect:/member/sns";
		}
		System.out.println("snt marker");
		System.out.println(member);
		memberService.insertMember(member);

		return "Member/signup3";
	}

//	account info page
	@RequestMapping("/info")
	public String memberInfo(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Member key = new Member();
		key.setMember_uqid((int) session.getAttribute("login_uqid"));
		session.setAttribute("user", memberService.indexMember(key).get(0));
		return "Member/memberinfo2/infoMain";
	}

	@RequestMapping("/info/edit")
	public String memberEdit(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Member key = new Member();
		key.setMember_name((String) session.getAttribute("login_name"));
		session.setAttribute("user", memberService.indexMember(key).get(0));
//		return "Member/memberInfo/infoEdit";
		return "Member/memberinfo2/infoEdit";
	}

	@RequestMapping("/info/close")
	public String memberDel(HttpServletRequest request, HttpServletResponse response) {
		return "Member/memberinfo2/infoDel";
	}
}
