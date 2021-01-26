package com.mp.reply.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.mp.post.service.PostService;
import com.mp.post.vo.Post;
import com.mp.reply.service.ReplyService;
import com.mp.reply.vo.Reply;
import com.mp.restObject.ResultObject;

@RestController(value = "replyRestController")
@MapperScan(basePackages = "com.mp.reply.mapper")
public class ReplyRestController {
//reply/delete'
	
	@Autowired
	private ReplyService replyService;

	@Autowired
    protected Validator validator;
	
	@PostMapping("/reply/delete")
	public ResponseEntity delete_reply(@RequestBody Reply reply, Errors errors, HttpServletRequest request, HttpServletResponse response) {
		ResultObject ro = new ResultObject(null, null);
		ro.setResult_code("0");
		ro.setResult_msg("success");
		replyService.delete_reply(reply);
		return ResponseEntity.ok(ro);
	}
	
	@PostMapping("/reply/edit_confirm")
	public ResponseEntity edit_reply(@Valid @RequestBody Reply reply, Errors errors, HttpServletRequest request, HttpServletResponse response) {
		//if the new reply's content is null, send an error.
		ResultObject ro = new ResultObject(null, null);
		HttpSession session = request.getSession();
		String error = "required";
		validator.validate(reply, errors);
		
		ro.setResult_code("0");
		ro.setResult_msg("success");
		replyService.update_reply(reply);
		return ResponseEntity.ok(ro);
	}
	
}
