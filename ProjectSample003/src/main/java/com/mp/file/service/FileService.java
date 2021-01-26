package com.mp.file.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;

import com.mp.file.mapper.FileMapper;
import com.mp.file.vo.FileVo;

@Service
@Transactional
@Repository
public class FileService {

	@Autowired
	private SqlSession session;
	
	public List<FileVo> select_file(FileVo file){
		return session.getMapper(FileMapper.class).select_file(file);
	}
	public int insert_file(FileVo file) {
		return session.getMapper(FileMapper.class).insert_file(file);
	}
	public int delete_file(FileVo file) {
		return session.getMapper(FileMapper.class).delete_file(file);		
	}
	
//	랜덤 이름 생성
	public String new_name(String original_name) {
		UUID uuid = UUID.randomUUID();
		String result = "";
		if(original_name.length() >= 21) {
			//a long name
			result = uuid.toString().substring(0, 20)+"_"+original_name.substring(original_name.length()-10, original_name.length());
		}else {
			//a short name
			result = uuid.toString().substring(0, 32-original_name.length())+"_"+original_name;
		}
		System.out.println(result);
		System.out.println(result.length());
		return result;
	}
}
