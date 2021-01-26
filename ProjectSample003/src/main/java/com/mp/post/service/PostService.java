package com.mp.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;

import com.mp.post.dao.PostDao;
import com.mp.post.vo.Post;

@Validated
@Service
@Transactional
public class PostService {

	@Autowired
	private PostDao postDao;
	
	public int upload_post(Post post) {
		return postDao.upload_post(post);
	}
	public int upload_post2(Post post) {
		return postDao.upload_post2(post);
	}
	
	public List<Post> read(Post post){
		return postDao.read(post);
	}

	public List<Post> readJoin(Post post){
		return postDao.readJoin(post);
	}

	public int edit(Post post) {
		return postDao.edit(post);
	}

	public int delete(Post post) {
		return postDao.delete(post);
	}
}
