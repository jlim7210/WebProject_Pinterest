package com.mp.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mp.board.service.BoardService;
import com.mp.board.vo.Board;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;


	@RequestMapping("/main")
	public String to_board() {
		return "Board/Main";
	}
	
	@RequestMapping("/create")
	public String create() {
		return "Board/Create";
	}
	@RequestMapping("/read")
	public String read(HttpServletRequest request, HttpServletResponse response) {
		List<Board> result = boardService.search_board(null);
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("list", result);
		
		return "Board/Read";
	}
}
