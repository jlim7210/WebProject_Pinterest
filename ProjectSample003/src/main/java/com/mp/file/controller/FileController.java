package com.mp.file.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mp.file.service.FileService;
import com.mp.post.service.PostService;
import com.mp.post.vo.Post;

@Controller
public class FileController {
	
	@Autowired
	private PostService postSerivce;
	@Autowired
	private FileService fileService;

//	@RequestMapping("/fileupadd")
//	public String fileadd(HttpServletRequest request) {
//		return "Post/PostUpload3";
//	}

//	@RequestMapping("/fileupload")
//	public String fileadd(HttpServletRequest request, @RequestParam("filename") MultipartFile mFile, MultipartHttpServletRequest mRequest) {
//		try {
//			mFile.transferTo(new File("c:/soledot/"+mFile.getOriginalFilename()));
//		}catch(IllegalStateException | IOException e) {
//			e.printStackTrace();
//		}
//		return "Post/PostMain";
//	}

//	@RequestMapping("/upload")
//	public String fileadd2(HttpServletRequest request) {
//		return "Post/PostUpload4";
//	}
//	@RequestMapping("/fileupload2")
//	public String fileadd2(HttpServletRequest request, @RequestParam("filename") MultipartFile mFile, MultipartHttpServletRequest mRequest) {
//		try {
//			Integer board_id = Integer.parseInt(request.getParameter("board_id"));
//			String post_title = request.getParameter("post_title");
//			String post_content = request.getParameter("post_content");
//			Integer uqid = (int)request.getSession().getAttribute("login_uqid");
//			
//			
//			mFile.transferTo(new File("c:/soledot/"+mFile.getOriginalFilename()));
//		}catch(IllegalStateException | IOException e) {
//			e.printStackTrace();
//		}
//		return "Post/PostMain";
//	}
	@PostMapping("/fileupload3")
	public String fileadd3(HttpServletRequest request, @RequestParam("filename") MultipartFile mFile/*, MultipartHttpServletRequest mRequest*/) {
		try {
//			Integer board_id = Integer.parseInt(request.getParameter("board_id"));
			Integer board_id = 1;
			String post_title = request.getParameter("post_title");
			String post_content = request.getParameter("post_content");
			Integer uqid = (int)request.getSession().getAttribute("login_uqid");
			String org_file_name = mFile.getOriginalFilename();
			int file_size = (int)mFile.getSize();
			
			String chg_file_name2 = fileService.new_name(org_file_name);
			//File target = new File("C:/SpringWorkspace/ProjectSample003/src/main/webapp/files_inWeb", chg_file_name2);
			File target = new File("c:/soledot/", chg_file_name2);
			FileCopyUtils.copy(mFile.getBytes(), target);
			
			Post post = new Post(0, board_id, post_title, post_content, uqid, org_file_name, chg_file_name2, file_size, true, null);
			postSerivce.upload_post2(post);
			
//			mFile.transferTo(new File("c:/soledot/"+mFile.getOriginalFilename()));
		}catch(IllegalStateException | IOException e) {
			e.printStackTrace();
			return "redirect:/gallery";
		}
		return "redirect:/gallery";
	}
	
	@PostMapping("/edit_confirm")
	public String edit_confirm(HttpServletRequest request, @RequestParam("filename") MultipartFile mFile/*, MultipartHttpServletRequest mRequest*/) {
		try {
			Integer board_id = 1;
			Integer post_id = Integer.parseInt(request.getParameter("post_id"));
			String post_title = request.getParameter("post_title");
			String post_content = request.getParameter("post_content");
			String org_file_name = mFile.getOriginalFilename();
			int file_size = (int)mFile.getSize();
			String chg_file_name2 = fileService.new_name(org_file_name);
			//File target = new File("C:/SpringWorkspace/ProjectSample003/src/main/webapp/files_inWeb", chg_file_name2);
			File target = new File("c:/soledot/", chg_file_name2);
			FileCopyUtils.copy(mFile.getBytes(), target);
			Post post = new Post();
			post.setBoard_id(board_id);
			post.setPost_id(post_id);
			post.setPost_title(post_title);
			post.setPost_content(post_content);
			post.setOrg_file_name(org_file_name);
			post.setChg_file_name(chg_file_name2);
			post.setFile_size(file_size);
			postSerivce.edit(post);
//			mFile.transferTo(new File("c:/soledot/"+mFile.getOriginalFilename()));
		}catch(IllegalStateException | IOException e) {
			e.printStackTrace();
			return "redirect:/gallery";
		}
		return "redirect:/gallery";
	}
	
	
}
