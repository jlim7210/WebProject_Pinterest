package com.mp.member.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
}
