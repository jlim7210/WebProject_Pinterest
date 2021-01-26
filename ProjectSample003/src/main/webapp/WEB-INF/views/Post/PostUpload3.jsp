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
	<br>
	<form action="fileupload" id="file_form" name="file_form" method="post" enctype="multipart/form-data">
		<input id="filename" name="filename" type="file" />
		<input type="submit" value="upload" />
	</form>
</body>
</html>