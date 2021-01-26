package com.mp.board.controller;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mp.board.service.BoardService;
import com.mp.board.vo.Board;
import com.mp.restObject.ResultObject;

@RestController
@MapperScan(basePackages = "com.mp.board.mapper")
@RequestMapping("/board")
public class BoardRestController {

	@Autowired
	private BoardService boardService;
	
	@PostMapping("/createR")
	public ResponseEntity create(@RequestBody Board board) {
		ResultObject ro = new ResultObject();
		int count = boardService.create_board(board);
		
		if(count > 0) {
			ro.setResult_code("0");
			ro.setResult_msg("success");
		}else {
			ro.setResult_code("1");
			ro.setResult_msg("fail");
		}
		return ResponseEntity.ok(ro);
	}
	
	@PostMapping("/readR")
	public ResponseEntity read(@RequestBody Board board) {
		ResultObject ro = new ResultObject();
		int count = boardService.search_board(board).size();
		
		if(count > 0) {
			ro.setResult_code("0");
			ro.setResult_msg("success");
		}else {
			ro.setResult_code("1");
			ro.setResult_msg("fail");
		}
		return ResponseEntity.ok(ro);
		
	}
	
	@PostMapping("/updateR")
	public ResponseEntity update(@RequestBody Board board) {
		ResultObject ro = new ResultObject();
		int count = boardService.edit_board(board);
		
		if(count > 0) {
			ro.setResult_code("0");
			ro.setResult_msg("success");
		}else {
			ro.setResult_code("1");
			ro.setResult_msg("fail");
		}
		return ResponseEntity.ok(ro);
		
	}
	
	@PostMapping("/deleteR")
	public ResponseEntity delete(@RequestBody Board board) {
		ResultObject ro = new ResultObject();
		int count = boardService.delete_board(board);
		
		if(count > 0) {
			ro.setResult_code("0");
			ro.setResult_msg("success");
		}else {
			ro.setResult_code("1");
			ro.setResult_msg("fail");
		}
		return ResponseEntity.ok(ro);
		
	}
}
