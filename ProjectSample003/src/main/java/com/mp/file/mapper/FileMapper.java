package com.mp.file.mapper;

import java.util.List;

import com.mp.file.vo.FileVo;

public interface FileMapper {

	public List<FileVo> select_file(FileVo file);
	public int insert_file(FileVo file);
	public int delete_file(FileVo file);
}
