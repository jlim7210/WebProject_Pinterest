<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<c:if test="${login_name eq null}">
	<input type="text" id="id" placeholder="id">
	<br>
	<input type="text" id="pw" placeholder="pw">
	<br>
	<input type="button" value="login" id="login">
	<input type="button" value="sign-up" id="btn">
</c:if>

<!-- 

<div th:if="${login_name ne null}">
	<p>logged in state</p>
	<p>Hello, ${login_name }!</p>
	<button id="logout">log out</button>
	<br>
	<br>
	<ul>
		<li><a href="/ProjectSample003/main">main</a></li>
		<li><a href="/ProjectSample003/upload">upload</a></li>
		<li><a href="/ProjectSample003/view">view</a></li>
	</ul>
</div>

 -->

<c:if test="${login_name ne null}">
	<p>logged in state</p>
	<p>Hello, ${login_name }!</p>
	<button id="logout">log out</button>
	<br>
	<br>
	<ul>
		<li><a href="/ProjectSample003/main">main</a></li>
		<li><a href="/ProjectSample003/upload">upload</a></li>
		<li><a href="/ProjectSample003/view">view</a></li>
	</ul>
</c:if>

<p>menu</p>
<a href="/ProjectSample003/upload">to write a post</a>
<br>
<a href="/ProjectSample003/member/info">to account info</a>
<br>
<a href="/ProjectSample003/view">to view posts</a>
<br>
<a href="/ProjectSample003/board/main">to board manager</a>
<br>

<script type="text/javascript">
	if(${login_name eq null}){
		document.getElementById('btn').addEventListener('click', function() {
			document.location.href = '/ProjectSample003/login/main';
		});

		document.getElementById('login').addEventListener('click', function() {
			var url = 'http://localhost:8080/ProjectSample003/main/login';
			$.ajax({
				async : true,
				method : 'post',
				url : url,
				data : JSON.stringify({
					member_acc : $('#id').val(),
					member_pw : $('#pw').val()
				}),
				dataType : 'text',
				contentType : 'application/json',
				beforeSend : function(){
				},
				success : function(data) {
					location.reload();
					document.location.href = '/ProjectSample003/main';
				},
				error : function(data) {
					alert('incorrect account info');
					location.reload();
					document.location.href = '/ProjectSample003/main';
				}
			})
		});
		
	}else{
		document.getElementById('logout').addEventListener('click',function(){
			document.location.href = '/ProjectSample003/logout';
		});
	}
		console.log(${member.member_name});
		console.log(${member.member_name()});
		console.log(${member});
	</script>