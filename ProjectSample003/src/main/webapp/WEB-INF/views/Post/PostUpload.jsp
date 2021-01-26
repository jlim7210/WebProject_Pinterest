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
	<h1>hi im postUpload</h1>
	<p>please fill out the template below</p>
	<%-- <form:form action="" modelAttribute="">
		<!-- 보드 아이디는 네이버 카페처럼 드랍박스에 보드 종류들 집어넣기 -->
		<form:input type="text" path="board_id" id="" placeholder=""/>
		<form:input type="text" path="post_title" id="" placeholder=""/>
		<form:input type="text" path="post_content" id="" placeholder=""/>
		<!-- 업로더는 비지니스 로직에서 세션값 받아서 객체에 넣고 디비에 보내주기 -->
	</form:form>
		<input type="submit" value="write"/> --%>


<%-- <p>===============</p>
<p>${er_title }</p>
<p>${er_title2 }</p>
<p>===============</p>

	<spring:hasBindErrors name="post">
	<p>test1</p>
		<c:if test="${errors.hasFieldErrors('post_title') }">
	<p>test2</p>

			<strong>${errors.getFieldError( 'post_title' ).defaultMessage }</strong>
	<p>test3</p>

		</c:if>
	</spring:hasBindErrors> --%>

	<input type="text" id="board_id" placeholder="board_id"><form:form><form:errors path="noID" /></form:form>
	<input type="text" id="post_title" placeholder="post_title"><form:form><form:errors path="notitle" /></form:form>
	<input type="text" id="post_content" placeholder="post_content">
	<br>
	<form id="upload-file-form">
	  <input type="text" name="extra">
	  <label for="upload-file-input">Upload your file:</label>
	  <input id="upload-file-input" type="file" name="uploadfile" accept="*" />
	  <button type="button" onclick="uploadFile();">업로드</button>
	</form>	
	<input type="submit" id="write" value="write">

	<script>
			function uploadFile() {
				  $.ajax({
				    url: "http://localhost:8080/ProjectSample003/uploadFile",
				    type: "POST",
				    data: new FormData($("#upload-file-form")[0]),
				    enctype: 'multipart/form-data',
				    processData: false,
				    contentType: false,
				    cache: false,
				    success: function () {
				      // Handle upload success
				      // ...
				    },
				    error: function () {
				      // Handle upload error
				      // ...
				    }
				  });
				}
		document.getElementById('write').addEventListener('click', function() {
			var url = 'http://localhost:8080/ProjectSample003/post/write';
			if($('#post_title').val() == ""){
				$('#error').val('sibal');
				console.log('sibla');
				/* return; */
			}
			$.ajax({
				async : true,
				method : 'post',
				url : url,
				data : JSON.stringify({
					board_id : $('#board_id').val(),
					post_title : $('#post_title').val(),
					post_content : $('#post_content').val(),
					uploader_uqid : ${login_uqid}
				}),
				dataType: 'text',
				contentType : 'application/json',
				beforeSend : function(){
					console.log('ajax before send');
				},
				error: function(request,status,error){
					console.log('ajax error');
					//alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					//document.location.href = '/ProjectSample003/post/write';
					${pageContext.setAttribute("er_title", "no work")};
					location.reload();
					return;
				},
				success: function(data){
					console.log('ajax success');
					document.location.href = '/ProjectSample003/main';
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