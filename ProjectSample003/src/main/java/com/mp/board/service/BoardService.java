package com.mp.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mp.board.dao.BoardDao;
import com.mp.board.mapper.BoardMapper;
import com.mp.board.vo.Board;

@Service
@Transactional
public class BoardService {

	@Autowired
	private BoardDao boardDao;

	public List<Board> search_board(Board board){
		return boardDao.search_board(board);
	}
	public int create_board(Board board) {
		return boardDao.create_board(board);
	}
	public int edit_board(Board board) {
		return boardDao.edit_board(board);
	}
	public int delete_board(Board board) {
		return boardDao.delete_board(board);
	}
}
