<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>hi im postUpload</h1>
	<form action="fileupload3" id="file_form" name="file_form" method="post" enctype="multipart/form-data">
		<input type="text" id="board_id" name="board_id" placeholder="board_id"/>
		<input type="text" id="post_title" name="post_title" placeholder="post_title"/>
		<input type="text" id="post_content" name="post_content" placeholder="post_content"/>
		<input id="filename" name="filename" type="file" />
		<input type="submit" value="upload" />
	</form>
</body>
</html>