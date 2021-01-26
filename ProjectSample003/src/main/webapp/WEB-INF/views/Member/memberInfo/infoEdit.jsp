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
			<th>아이디</th>
			<th>등록일</th>
			<th>권한등급</th>
			<th>이름</th>
		</tr>
		<tr>
			<td>${user.member_acc }</td>
			<td>${user.member_cre_date }</td>
			<td>${user.member_rank }</td>
			<td><input type="text" id="member_name" placeholder="name" value="${user.member_name }"></td>
		</tr>
	</table>
	<button id='submit'>submit</button>
	<button id='cancel'>cancel</button>
	
	<script>
		document.getElementById('submit').addEventListener('click', function(){
			/* document.location.href = '/ProjectSample003/info/editR'; */
			var result = confirm("Do you want to confirm edit?");
			if(result){
				var url = 'http://localhost:8080/ProjectSample003/info/editR';
				$.ajax({
					async : true,
					method : 'post',
					url : url,
					data : JSON.stringify({
						member_name : $('#member_name').val()
					}),
					dataType : 'text',
					contentType : 'application/json',
					beforeSend : function(){
						console.log('sending request...');
					},
					success : function(data) {
						document.location.href = '/ProjectSample003/member/info';
					},
					error : function(data) {
						document.location.href = '/ProjectSample003/member/info';
					}
				})
			
			}else{
				return;
			}
		});
		document.getElementById('cancel').addEventListener('click', function(){
			document.location.href = '/ProjectSample003/info';
		});
	</script>
</body>
</html>