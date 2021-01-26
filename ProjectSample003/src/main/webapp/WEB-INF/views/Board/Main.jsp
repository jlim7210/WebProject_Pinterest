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
	<h1>hi im board main</h1>
	<a href="/ProjectSample003/board/create">create</a><br>
	<a href="/ProjectSample003/board/read">read</a><br>
</body>
</html>