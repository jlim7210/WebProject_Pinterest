package com.mp.post.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.HttpJspPage;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity.BodyBuilder;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.mp.post.service.PostService;
import com.mp.post.vo.Post;
import com.mp.restObject.ResultObject;

@RestController(value = "postController")
@MapperScan(basePackages = "com.mp.post.mapper")
public class PostController implements Validator {

	@Autowired
	private PostService postService;

	@Autowired
	protected Validator validator;

	@PostMapping("/post/write")
	public ResponseEntity upload(@Valid @RequestBody Post post, Errors errors, HttpServletRequest request,
			HttpServletResponse response) {
		ResultObject ro = new ResultObject(null, null);
		HttpSession session = request.getSession();
		String error = "required";
		validate(post, errors);

		if (errors.hasErrors()) {
			errors.reject("noID", "required.post_title");
			errors.reject("notitle", "required.post_title");
			errors.reject("post_title", "required.post_title");
			errors.rejectValue("post_title", "required.post_title", null, "Value required.");
			System.out.println("detected");
			ro.setResult_code("1");
			ro.setResult_msg("fail");
			return new ResponseEntity<>("no post title", HttpStatus.BAD_REQUEST);
		}

		int count = postService.upload_post(post);
		if (count == 1) {
			ro.setResult_code("0");
			ro.setResult_msg("success");
		} else {
			ro.setResult_code("1");
			ro.setResult_msg("fail");
		}
		return ResponseEntity.ok(ro);
	}

//	ajax gallery
	@GetMapping("/post/read")
	public List<Post> retrieve(Model model) {
		ResultObject ro = new ResultObject(null, null);
		List<Post> result = postService.readJoin(new Post());
		model.addAttribute("result", result);
		// return ResponseEntity.ok(ro);
		return result;
	}

	@GetMapping("/post/read/{post_id}")
	public ResponseEntity retrieve_spc(Post post) {
		ResultObject ro = new ResultObject(null, null);
		List<Post> result = postService.read(post);
		return ResponseEntity.ok(result);
	}

	@GetMapping(value = "/post/read_gal", produces = MediaType.IMAGE_JPEG_VALUE)
	public @ResponseBody byte[] getImageWithMediaType() throws IOException {
		InputStream in = getClass().getResourceAsStream("c:/soledot/**.PNG");
		return IOUtils.toByteArray(in);
	}
//	no use

	@PostMapping("/edit_conf")
	public ResponseEntity edit(@RequestBody Post post) {
		ResultObject ro = new ResultObject(null, null);
		int count = postService.edit(post);

		if (count == 1) {
			ro.setResult_code("0");
			ro.setResult_msg("successfully deleted");
		} else {
			ro.setResult_code("1");
			ro.setResult_msg("failed");
		}
		return ResponseEntity.ok(ro);
	}

	@PostMapping("/post/delete")
	public ResponseEntity delete(@RequestBody Post post) {
		ResultObject ro = new ResultObject(null, null);
		System.out.println(post.getPost_title());
		int count = postService.delete(post);

		if (count == 1) {
			ro.setResult_code("0");
			ro.setResult_msg("successfully deleted");
		} else {
			ro.setResult_code("1");
			ro.setResult_msg("failed");
		}
		return ResponseEntity.ok(ro);
	}

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "post_title", "required.post_title");
		System.out.println("post_title error");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "board_id", "required.board_id");
		System.out.println("board_id error");
	}
}
