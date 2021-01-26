package com.mp.reply.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.mp.post.service.PostService;
import com.mp.reply.service.ReplyService;
import com.mp.reply.vo.Reply;
import com.mp.restObject.ResultObject;

@RestController(value = "replyController")
public class ReplyController {
	@Autowired
	private ReplyService replyService;

	@Autowired
    protected Validator validator;
	
	@PostMapping("/reply/add")
	public ResponseEntity upload(@RequestBody @Valid Reply reply, Errors errors, HttpServletRequest request, HttpServletResponse response) {
		ResultObject ro = new ResultObject(null, null);
		HttpSession session = request.getSession();
		String error = "required";
		validator.validate(reply, errors);
		
		if(errors.hasErrors()) {
			System.out.println("detected reply error");
			ro.setResult_code("1");
			ro.setResult_msg("fail");
			//return new ResponseEntity<>("no post title", HttpStatus.BAD_REQUEST);
		}else {
			int count = replyService.insert_reply(reply);
			if(count == 1) {
				ro.setResult_code("0");
				ro.setResult_msg("success");
			}else if(count == 0) {
				ro.setResult_code("1");
				ro.setResult_msg("fail");
			}else {
				System.out.println("what kind of error is this");
			}
		}
		return ResponseEntity.ok(ro);
	}
}
