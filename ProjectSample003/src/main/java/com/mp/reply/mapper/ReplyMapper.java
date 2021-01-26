package com.mp.reply.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mp.post.vo.Post;
import com.mp.reply.vo.Reply;

@Mapper
public interface ReplyMapper {

	public List<Map> idx_rep_bPost(Post post);
	public List<Map> idx_rep_bPid(int post_id);
	public List<Map> idx_rep_bUser(int uqid);
	public int insert_reply(Reply reply);
	public int update_reply(Reply reply);
	public int delete_reply(Reply reply);
	
}
