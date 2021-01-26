package com.mp.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.SqlReturnResultSet;
import org.springframework.stereotype.Repository;

import com.mp.member.mapper.MemberMapper;
import com.mp.member.vo.Member;

@Repository
public class MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Member> indexMember(Member member){
		return sqlSession.getMapper(MemberMapper.class).indexMember(member);
	}
	public int insertMember(Member member) {
		return sqlSession.getMapper(MemberMapper.class).insertMember(member);
	}
	public int edit(Member member) {
		return sqlSession.getMapper(MemberMapper.class).edit(member);
	}
	public int delete(Member member) {
		return sqlSession.getMapper(MemberMapper.class).delete(member);
	}
}
