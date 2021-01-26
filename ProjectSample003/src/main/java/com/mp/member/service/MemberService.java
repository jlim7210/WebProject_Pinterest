package com.mp.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;

import com.mp.member.dao.MemberDao;
import com.mp.member.mapper.MemberMapper;
import com.mp.member.vo.Member;

@Validated
@Service
@Transactional
public class MemberService {

	@Autowired
	private MemberDao memberDao;
	
	public List<Member> indexMember(Member member){
		return memberDao.indexMember(member);
	}
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}
	public int edit(Member member) {
		return memberDao.edit(member);
	}
	public int delete(Member member) {
		return memberDao.delete(member);
	}
}
