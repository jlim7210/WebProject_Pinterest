package com.mp.file.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mp.file.service.FileService;
import com.mp.post.service.PostService;
import com.mp.post.vo.Post;

@RestController(value = "fileRestController")
@MapperScan(basePackages = "com.mp.file.mapper")
public class FileRestController {

	@Autowired
	private PostService postSerivce;
	@Autowired
	private FileService fileService;
	
	@PostMapping(value = "/uploadFile")
	public ResponseEntity uploadFile(@Valid MultipartFile uploadfile) {
		try {
			System.out.println("file uploading");
			String filename = uploadfile.getOriginalFilename();
			//C:\SpringWorkspace\ProjectSample003\src\files
			String directory = "/src/files";
			String filepath = Paths.get(directory, filename).toString();
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(filepath)));
			stream.write(uploadfile.getBytes());
			stream.close();
		} catch (Exception e) {
			System.out.println("file error");
			System.out.println(e.getMessage());
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		System.out.println("file success");
		return new ResponseEntity<>(HttpStatus.OK);
	}
	@PostMapping(value = "/uploadFile2")
	public ResponseEntity uploadFile2(HttpServletRequest request, @Valid Post post, @Valid MultipartFile uploadfile) {
		try {
			System.out.println("file uploading");
			
			post.setBoard_id(1);
			post.setUploader_uqid((int)request.getSession().getAttribute("login_uqid"));
			post.setFile_size((int)uploadfile.getSize());
			String org_file_name = uploadfile.getOriginalFilename();
			String chg_file_name2 = fileService.new_name(org_file_name);
			post.setOrg_file_name(org_file_name);
			post.setChg_file_name(chg_file_name2);
			File target = new File("C:/SpringWorkspace/ProjectSample003/src/main/webapp/files_inWeb", chg_file_name2);
			FileCopyUtils.copy(uploadfile.getBytes(), target);
			
			postSerivce.upload_post2(post);
			
//			String filename = uploadfile.getOriginalFilename();
//			String directory = "C:\\soledot";
//			String filepath = Paths.get(directory, filename).toString();
//			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(filepath)));
//			stream.write(uploadfile.getBytes());
//			stream.close();
		} catch (Exception e) {
			System.out.println("file error");
			System.out.println(e.getMessage());
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		System.out.println("file success");
		return new ResponseEntity<>(HttpStatus.OK);
	}
	//view_detail/
//	@RequestMapping(value = "viewFile/{file_name}", produces = MediaType.IMAGE_JPEG_VALUE)
//	public ResponseEntity<byte[]> viewFile(@PathVariable("file_name") String file_name) throws IOException {
//		System.out.println("caught");
//		InputStream imageStream = new FileInputStream("c:/soledot/" + file_name); 
//		//InputStream imageStream = new FileInputStream("C:/SpringWorkspace/ProjectSample003/src/main/webapp/files_inWeb" + file_name); 
//		byte[] imageByteArray = IOUtils.toByteArray(imageStream); imageStream.close(); 
//		return new ResponseEntity<byte[]>(imageByteArray, HttpStatus.OK);
//	}
	@RequestMapping(value = "/viewFile", produces = MediaType.IMAGE_JPEG_VALUE)
	public ResponseEntity/* <byte[]> */viewFile(
			/* @PathVariable("file_name") String file_name, */HttpServletRequest request) throws IOException {
		System.out.println("caught");
		InputStream imageStream = new FileInputStream("c:/soledot/" + request.getParameter("file")); 
		//InputStream imageStream = new FileInputStream("C:/SpringWorkspace/ProjectSample003/src/main/webapp/files_inWeb" + file_name); 
		byte[] imageByteArray = IOUtils.toByteArray(imageStream); imageStream.close(); 
		return new ResponseEntity<byte[]>(imageByteArray, HttpStatus.OK);
	}

//	@RequestMapping(value = "logo/logo.png", produces = MediaType.IMAGE_JPEG_VALUE)
//	public ResponseEntity<byte[]> logo(@PathVariable("file_name") String file_name) throws IOException {
//		System.out.println("caught");
//		InputStream imageStream = new FileInputStream("c:/soledot/" + file_name); 
//		byte[] imageByteArray = IOUtils.toByteArray(imageStream); imageStream.close(); 
//		return new ResponseEntity<byte[]>(imageByteArray, HttpStatus.OK);
//		
//	}
	
	@PostMapping(value = "/edit_post")
	public ResponseEntity edit_post(HttpServletRequest request, @Valid Post post, @Valid MultipartFile uploadfile) {
		try {
			System.out.println("file editting");
			post.setBoard_id(1);
			post.setFile_size((int)uploadfile.getSize());
			String org_file_name = uploadfile.getOriginalFilename();
			String chg_file_name2 = fileService.new_name(org_file_name);
			post.setOrg_file_name(org_file_name);
			post.setChg_file_name(chg_file_name2);
			File target = new File("c:/soledot/", chg_file_name2);
			FileCopyUtils.copy(uploadfile.getBytes(), target);
			postSerivce.edit(post);
			
		} catch (Exception e) {
			System.out.println("file error");
			System.out.println(e.getMessage());
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		System.out.println("file success");
		return new ResponseEntity<>(HttpStatus.OK);
	}
}
