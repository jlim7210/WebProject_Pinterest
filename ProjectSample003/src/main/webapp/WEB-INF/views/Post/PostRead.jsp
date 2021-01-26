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
	<jsp:include page="/WEB-INF/include/loginTemplate.jsp"></jsp:include>
	<br>
	<br>
	<div id="tempLine" style="border{1px solid red;}"></div>
	<table border="1">
		<tr>
			<th>게시글 번호</th>
			<th>제목</th>
			<th>업로더</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="row" items="${list}">
		<tr>
			<td>${row.post_id }</td>
			<td><a href="/ProjectSample003/view_detail?num=${row.post_id}">${row.post_title }</a></td>
			<td>${row.member_name }</td>
			<td>${row.cre_date }</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>