package com.mp.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mp.board.vo.Board;

@Mapper
public interface BoardMapper {

	public List<Board> search_board(Board board);
	public int create_board(Board board);
	public int edit_board(Board board);
	public int delete_board(Board board);
}
