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
<jsp:include page="/WEB-INF/include/loginRankBouncer.jsp"></jsp:include>
<br>
	<br>
	<table border="1">
		<tr>
			<th>게시판 번호</th>
			<th>게시판 이름</th>
			<th>게시판 내용</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="row" items="${list}">
		<tr>
			<td>${row.board_id }</td>
			<td>${row.board_title }</td>
			<td>${row.board_content }</td>
			<td>${row.cre_date }</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>