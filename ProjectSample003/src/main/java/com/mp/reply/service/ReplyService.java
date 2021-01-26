package com.mp.reply.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mp.post.vo.Post;
import com.mp.reply.mapper.ReplyMapper;
import com.mp.reply.vo.Reply;

@Service
@Repository
@Transactional
public class ReplyService {

	@Autowired
	private SqlSession session;
	
	public List<Map> idx_rep_bPost(Post post){
		return session.getMapper(ReplyMapper.class).idx_rep_bPost(post);
	}
	public List<Map> idx_rep_bPid(int post_id){
		return session.getMapper(ReplyMapper.class).idx_rep_bPid(post_id);
	}
	public List<Map> idx_rep_bUser(int uqid){
		return session.getMapper(ReplyMapper.class).idx_rep_bUser(uqid);
	}
	public int insert_reply(Reply reply){
		return session.getMapper(ReplyMapper.class).insert_reply(reply);
	}
	public int update_reply(Reply reply){
		return session.getMapper(ReplyMapper.class).update_reply(reply);
	}
	public int delete_reply(Reply reply){
		return session.getMapper(ReplyMapper.class).delete_reply(reply);
	}
}
