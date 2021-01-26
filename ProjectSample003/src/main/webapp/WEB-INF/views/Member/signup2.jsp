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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<h1>sign-up2</h1>
	<!-- com.mp.member.vo. -->
	<spring:hasBindErrors name="Member">
		<c:if test="${errors.hasFieldErrors('member_acc') }">

			<strong>${errors.getFieldError( 'member_acc' ).defaultMessage }</strong>

		</c:if>
	</spring:hasBindErrors>

	<form:form action="snt" modelAttribute="Member">
		<form:input type="text" path="member_acc" id="member_acc"
			placeholder="id" maxlength="12" />
		<form:errors path="member_acc" />
		<form:input type="text" path="member_pw" id="member_pw"
			placeholder="pw" maxlength="12" />
		<form:errors path="member_pw" />
		<%-- <form:input type="text" path="member_pw" id="member_pw_confirm" placeholder="pw_confirm" /> --%>
		<form:input type="text" path="member_name" id="member_name"
			placeholder="name" maxlength="12" />
		<form:errors path="member_name" />
		<input type="submit" value="submit" id="submit">
	</form:form>
	<script>
		
	</script>
</body>
</html>