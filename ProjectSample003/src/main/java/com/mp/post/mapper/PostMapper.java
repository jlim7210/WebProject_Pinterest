package com.mp.post.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mp.post.vo.Post;

@Mapper
public interface PostMapper {

	public int upload_post(Post post);
	public int upload_post2(Post post);
	public HashMap read(Post post);
	public List<HashMap> readJoin(Post post);
	public int edit(Post post);
	public int delete(Post post);
}
