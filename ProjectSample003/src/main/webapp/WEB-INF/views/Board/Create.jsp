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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/include/loginRequired.jsp"></jsp:include>
<jsp:include page="/WEB-INF/include/loginRankBouncer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/include/loginTemplate.jsp"></jsp:include>
<br>
<br>
	<h1>hi im board create</h1>
	<input id="board_title" placeholder="board_title"><br>
	<input id="board_content" placeholder="board_content"><br>
	<button id="btn">create</button><br>
	
	<script>
		document.getElementById('btn').addEventListener('click', function(){
			var url = 'http://localhost:8080/ProjectSample003/board/createR';
			$.ajax({
				async : true,
				method : 'post',
				url : url,
				data : JSON.stringify({
					board_title : $('#board_title').val(),
					board_content : $('#board_content').val()
				}),
				dataType: 'text',
				contentType : 'application/json',
				beforeSend : function(){
					console.log('ajax before send');
				},
				success: function(data){
					console.log('ajax success');
					document.location.href = '/ProjectSample003/board/main';
				},
				error: function(data){
					console.log('ajax error');
				}
			}).done(function(obj) {
				console.log(obj);
			}).fail(function(msg) {
				console.log(msg);
			});
		});
	</script>
</body>
</html>