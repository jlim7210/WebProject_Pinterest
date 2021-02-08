package com.mp.post.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mp.member.vo.Member;
import com.mp.paging.mapper.PageService;
import com.mp.post.service.PostService;
import com.mp.post.vo.Post;
import com.mp.reply.service.ReplyService;
import com.mp.reply.vo.Reply;
import com.mp.restObject.ResultObject;

@Controller
public class PostController2 {
	
	@Autowired
	private PostService postService;
	@Autowired
	private PageService pageService;
	@Autowired
	private ReplyService replyService;

//	@RequestMapping("/postMain")
//	public String postMain() {
//		return "Post/PostMain";
//	}
	
//	@RequestMapping("/upload")
//	public String write() {
//		return "Post/PostUpload";
//	}
//	
//	@RequestMapping("/upload2")
//	public String write_alt(Model model) {
//		model.addAttribute("Post", new Post());
//		return "Post/PostUpload2";
//	}
//
//	@PostMapping("/upload3")
//	public String writing(@Valid /*@RequestBody*/ Post post, Errors errors, HttpServletRequest request, HttpServletResponse response) {
//		try {
//			System.out.println("wo");
//			ResultObject ro = new ResultObject(null, null);
//			HttpSession session = request.getSession();
//			String error = "required";
//			post.setUploader_uqid((int)session.getAttribute("login_uqid"));
////		validate(post, errors);
//			
//			int count = postService.upload_post(post);
//			if(count == 1) {
//				ro.setResult_code("0");
//				ro.setResult_msg("success");
//			}else {
//				ro.setResult_code("1");
//				ro.setResult_msg("fail");
//			}
//			return "Post/PostMain";
//			
//		}catch(Exception e) {
//			System.out.println("wwwowowowoowowo");
//			ResultObject ro = new ResultObject(null, null);
//			e.printStackTrace();
//			if(errors.hasErrors()) {
//				errors.reject("noID", "required.post_title");
//				errors.reject("notitle", "required.post_title");
//				errors.reject("post_title", "required.post_title");
//				errors.rejectValue("post_title", "required.post_title", null, "Value required.");
//				System.out.println("detected");
//				ro.setResult_code("1");
//				ro.setResult_msg("fail");
//				return "Post/PostUpload2";
////			return "redirect:/upload2";
//			}
//		}
//		return "Post/PostMain";
//	}
	
//	@RequestMapping("/view")
//	public String view(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue="1") int curBoard) {
//		List<HashMap> result = postService.readJoin(new Post());
//		HttpSession httpSession = request.getSession();
//		System.out.println(result.get(0).get("chg_file_name"));
////		int listcnt = pageService.countBoard(curBoard);
//		
//		httpSession.setAttribute("list", result);
//		return "Post/PostRead";
//	}

//	@GetMapping("/view_detail")
//	public String view_detail(HttpServletRequest request, HttpServletResponse response) {
//		Post search = new Post();
//		search.setPost_id(Integer.parseInt(request.getParameter("num")));
//		Post result = postService.read(search).get(0);
//		request.setAttribute("detail", result);
//		return "Post/Detail/Detail";
//	}

	@GetMapping("/view_detail")
	public String view_detail_join(HttpServletRequest request, HttpServletResponse response) {
		int pstID = Integer.parseInt(request.getParameter("num"));
		Post search = new Post();
		search.setPost_id(pstID);
		List<Map> repOsrc = replyService.idx_rep_bPid(pstID);
		request.setAttribute("detail", postService.readJoin(search).get(0));
		request.setAttribute("replyList", repOsrc);
		return "Post/Detail/Detail2";
	}

	@GetMapping("/edit")
	public String edit(HttpServletRequest request, HttpServletResponse response) {
		Post search = new Post();
		search.setPost_id(Integer.parseInt(request.getParameter("num")));
//		Map result = (HashMap) postService.read(search).get(0);
//		request.setAttribute("detail", result);
		request.setAttribute("detail", postService.readJoin(search).get(0));
		return "Post/Update/Edit2";
	}

}
