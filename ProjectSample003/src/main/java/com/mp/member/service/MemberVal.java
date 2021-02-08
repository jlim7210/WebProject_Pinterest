package com.mp.member.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import com.mp.member.vo.Member;
import com.mp.restObject.ResultObject;

@Validated
@Service
public class MemberVal {

	@Autowired
	private MemberService memberService;
	
//	public ResultObject emptyCheck(Member member) {
//		
//	}
	
	public ResultObject createNewMember(Member member) {
		ResultObject result = new ResultObject();
		Member chk1 = new Member();
		Member chk2 = new Member();
		chk1.setMember_acc(member.getMember_acc());
		chk2.setMember_name(member.getMember_name());
		
		int id_count = memberService.indexMember(chk1).size();
		int name_count = memberService.indexMember(chk2).size();
		if(id_count > 0) {
			result.setResult_code("1");
			result.setResult_msg("id already exists");
		}else if(name_count > 0) {
			result.setResult_code("2");
			result.setResult_msg("name already exists");
		}else if(id_count == 0 || name_count == 0) {
			result.setResult_code("0");
			result.setResult_msg("id created");
		}
		return result;
	}
	
	public static boolean is_logged_in(HttpServletRequest request, HttpServletResponse response) {
		HttpSession hs = request.getSession();
		Object uqid = hs.getAttribute("login_uqid");
		boolean result = false;
		if(uqid == null) {
		}else {
			result = true;
		}
		return result;
	}
}
