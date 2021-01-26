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
		<!-- ���� ���̵�� ���̹� ī��ó�� ����ڽ��� ���� ������ ����ֱ� -->
		<form:input type="text" path="board_id" id="" placeholder="board_id"/>
		<form:errors path="board_id" />
		<form:input type="text" path="post_title" id="" placeholder="post_title"/>
		<form:errors path="post_title" />
		<form:input type="text" path="post_content" id="" placeholder="post_content"/>
		<input type="submit" id="write" value="write"/>
		<!-- ���δ��� �����Ͻ� �������� ���ǰ� �޾Ƽ� ��ü�� �ְ� ��� �����ֱ� -->
		<input id="filename" name="filename" type="file" />
	</form:form>
	<br>
	<form action="fileupload" id="file_form" name="file_form" method="post" enctype="multipart/form-data">
		<input type="submit" value="upload" />
	</form>
</body>
</html>