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
<style>
textarea {
  resize: none;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/include/loginTemplate.jsp"></jsp:include>
	<br>

	<br>

	<h1>hi im edit</h1>
	<p>post id : ${detail.post_id}</p>
	<p>board id : ${detail.board_id}</p>
	<textarea id="board_id" cols="2" rows="1" required="required">${detail.board_id}</textarea>
	<textarea id="post_title" cols="40" rows="1" required="required">${detail.post_title}</textarea>
	<textarea id="post_content" cols="80" rows="10">${detail.post_content}</textarea>
	<p>uploader : ${detail.member_name}</p>
	<p>date : ${detail.cre_date}</p>
	<p>date will be changed when you update.</p>
	<br>
	<button id="edit">edit</button>
	<script>
		document.getElementById('edit').addEventListener('click', function(){
			var result = confirm("Do you want to edit the post '${detail.post_title}'?");
			if(result){
				var url = 'http://localhost:8080/ProjectSample003/edit_conf';
				$.ajax({
					async : true,
					method : 'post',
					url : url,
					data : JSON.stringify({
						post_id : '${detail.post_id}',
						board_id : $('#board_id').val(),
						post_title : $('#post_title').val(),
						post_content : $('#post_content').val()
					}),
					dataType: 'text',
					contentType : 'application/json',
					beforeSend : function(){
						console.log('ajax before send');
					},
					success: function(data){
						console.log('ajax success');
						document.location.href = '/ProjectSample003/view_detail?num=${detail.post_id}';
					},
					error: function(data){
						console.log('ajax error');
						
					}
				}).done(function(obj) {
					console.log(obj);
				}).fail(function(msg) {
					console.log(msg);
				});
			}else{
				return;
			};
		});
	</script>
</body>
</html>