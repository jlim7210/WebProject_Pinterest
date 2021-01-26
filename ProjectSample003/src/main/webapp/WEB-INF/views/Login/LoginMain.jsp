<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script>
		if(${login_name ne null}){
			document.location.href = '/ProjectSample003/member/info';
		}
	</script>

	<!-- 로그인하면 메인화면으로 보내기  -->
	<h1>hi im login main</h1>
	<%-- <form:form action="val" modelAttribute="Member">
		<form:input type="text" path="member_acc" id="member_acc" placeholder="id" /><br>
		<form:input type="text" path="member_pw" id="member_pw" placeholder="pw" /><br>
		<input type="submit" value="login">
	</form:form> --%>
	
	<jsp:include page="/WEB-INF/include/loginTemplate.jsp"></jsp:include>
	
	<!-- <input type="button" value="sign-up" id="btn"> -->
	<script>
		document.getElementById('btn').addEventListener('click', function() {
			document.location.href = '/ProjectSample003/member/snf';
		});
	</script>
</body>
</html>