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
	<p>please fill out the template below</p>
	<form:form action="upload3" modelAttribute="Post" method="post">
		<!-- 보드 아이디는 네이버 카페처럼 드랍박스에 보드 종류들 집어넣기 -->
		<form:input type="text" path="board_id" id="" placeholder="board_id"/>
		<form:errors path="board_id" />
		<form:input type="text" path="post_title" id="" placeholder="post_title"/>
		<form:errors path="post_title" />
		<form:input type="text" path="post_content" id="" placeholder="post_content"/>
		<input type="submit" id="write" value="write"/>
		<!-- 업로더는 비지니스 로직에서 세션값 받아서 객체에 넣고 디비에 보내주기 -->
		<input id="filename" name="filename" type="file" />
	</form:form>
	<br>
	<form action="fileupload" id="file_form" name="file_form" method="post" enctype="multipart/form-data">
		<input type="submit" value="upload" />
	</form>
</body>
</html>