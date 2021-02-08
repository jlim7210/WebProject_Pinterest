package com.mp.post.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mp.post.mapper.PostMapper;
import com.mp.post.vo.Post;



@Repository
public class PostDao {

	@Autowired
	SqlSession sqlSession;
	
	public int upload_post(Post post) {
		return sqlSession.getMapper(PostMapper.class).upload_post(post);
	}
	public int upload_post2(Post post) {
		return sqlSession.getMapper(PostMapper.class).upload_post2(post);
	}
	
	public HashMap read(Post post){
		HashMap result = sqlSession.getMapper(PostMapper.class).read(post);
		return result;
	}

	public List<HashMap> readJoin(Post post){
		List<HashMap> result = sqlSession.getMapper(PostMapper.class).readJoin(post);
		return result;
	}

	public int edit(Post post) {
		return sqlSession.getMapper(PostMapper.class).edit(post);
	}

	public int delete(Post post) {
		return sqlSession.getMapper(PostMapper.class).delete(post);
	}
}
