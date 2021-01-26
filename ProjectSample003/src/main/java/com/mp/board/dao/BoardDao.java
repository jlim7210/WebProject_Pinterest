package com.mp.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mp.board.mapper.BoardMapper;
import com.mp.board.vo.Board;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSession sqlSession;

	public List<Board> search_board(Board board){
		return sqlSession.getMapper(BoardMapper.class).search_board(board);
	}
	public int create_board(Board board) {
		return sqlSession.getMapper(BoardMapper.class).create_board(board);
	}
	public int edit_board(Board board) {
		return sqlSession.getMapper(BoardMapper.class).edit_board(board);
	}
	public int delete_board(Board board) {
		return sqlSession.getMapper(BoardMapper.class).delete_board(board);
	}
}
