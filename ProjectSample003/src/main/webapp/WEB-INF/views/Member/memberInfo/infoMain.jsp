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
	<jsp:include page="/WEB-INF/include/loginRequired.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/include/loginTemplate.jsp"></jsp:include>
	<br>
	<br>
	<h1>hi im user info main</h1>
	<br>
	<br>
	<table border="1">
		<tr>
			<th>���̵�</th>
			<th>�����</th>
			<th>���ѵ��</th>
			<th>�̸�</th>
		</tr>
		<tr>
			<td>${user.member_acc }</td>
			<td>${user.member_cre_date }</td>
			<td>${user.member_rank }</td>
			<td>${user.member_name }</td>
		</tr>
	</table>
	<button id='edit'>info edit</button>
	<button id='delete'>close account</button>

	<script>
		document.getElementById('edit').addEventListener('click', function() {
			document.location.href = '/ProjectSample003/member/info/edit';
		});
		document.getElementById('delete').addEventListener('click', function() {
			document.location.href = '/ProjectSample003/member/info/close';
		});
	</script>
</body>
</html>