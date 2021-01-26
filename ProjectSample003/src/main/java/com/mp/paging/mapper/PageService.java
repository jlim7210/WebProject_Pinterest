package com.mp.paging.mapper;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@Repository
public class PageService {

	@Autowired
	private SqlSession session;
	
	public int countBoard(int board_id) {
		return session.getMapper(PagingMapper.class).countBoard(board_id);
	}
}
