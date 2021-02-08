package com.mp.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mp.member.vo.Member;

@Mapper
public interface MemberMapper {

	public List<Member> indexMember(Member member);
	public List<Member> loginMember(Member member);
	public int insertMember(Member member);
	public int edit(Member member);
	public int delete(Member member);
}
