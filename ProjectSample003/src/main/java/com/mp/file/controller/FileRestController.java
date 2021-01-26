package com.mp.file.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController(value = "fileRestController")
@MapperScan(basePackages = "com.mp.file.mapper")
public class FileRestController {

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
	
	@RequestMapping(value = "view_detail/viewFile/{file_name}", produces = MediaType.IMAGE_JPEG_VALUE)
	public ResponseEntity<byte[]> viewFile(@PathVariable("file_name") String file_name) throws IOException {
		System.out.println("caught");
		//InputStream imageStream = new FileInputStream("c:/soledot/" + file_name); 
		InputStream imageStream = new FileInputStream("C:/SpringWorkspace/ProjectSample003/src/main/webapp/files_inWeb" + file_name); 
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
}
