<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    <title>Pinterest</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/starter-template/">

    <!-- Bootstrap core CSS -->
	<link href="css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      .dropdown-menu{
      	left: 77%;
     	right: 1% !important;
      }
      td {text-align:center;}
      th {text-align:center;}
      element.style {
      	display:none !important;
      }
      .modal-body{
      	text-align:center;
      }
      textarea { resize: none;}
      .container-fluid{z-index:9999; background-color: white;}
      .image_output{
		border-radius:15px;
		width: auto; height: auto; max-width: 17rem; max-height: 17rem;
	  }
	  .image_output:hover{
	  	-moz-box-shadow: 0 0 15px #757575;
      	-webkit-box-shadow: 0 0 15px #757575;
      	box-shadow: 0 0 15px #757575;
	  }
	  .post_info{
	  	float:left;
	  }
	  .image_show{
	  	float:left;
	  	border-radius: 15px 0 0 15px;
	  	margin-right:15px;
	  	width: auto; height: auto; max-width: 50rem; max-height: 50rem;
	  }
	  .reply{
	  	float:none;
	  }
	  .detail_deco{
	  	-moz-box-shadow: 0 0 15px #757575;
      	-webkit-box-shadow: 0 0 15px #757575;
      	box-shadow: 0 0 15px #757575;
	  	border-radius: 15px;
	  	overflow: hidden;
	  }
	  .detail_gal{
	  	height: 50px;
	  	float:none;
	  }
	  .post_info{
	  	margin-top:15px;
	  }
	  .reply{
	  	margin-top:15px;
	  }
    </style>
    
    <!-- Custom styles for this template -->
    <link href="css/starter-template.css" rel="stylesheet">
  </head>
  <body>

<nav class="navbar navbar-expand-md navbar-dark fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="gallery"><img src="img\logo\logo.png" title="logo" alt="logo" width="33.95" height="33.95" class="modal-logo"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
      <ul class="navbar-nav me-auto mb-2 mb-md-0">
        <li class="nav-item active">
          <a class="nav-link uriNav" aria-current="page" href="gallery">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link uriNav" href="#">Following</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" id="search_bar">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
      
      <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</a>
          <ul class="dropdown-menu" aria-labelledby="dropdown01">
            <li><a class="dropdown-item" href="/ProjectSample003/member/info">Profile</a></li>
            <li><a class="dropdown-item" href="#">Post</a></li>
            <li><a class="dropdown-item" href="/ProjectSample003/chat">Chat</a></li>
            <li><a class="dropdown-item" href="/ProjectSample003/logout">Log out</a></li>
          </ul>
    </div>
  </div>
</nav>


<main class="container">
	<!--*/ <p th:text="${#request.getAttribute('detail')}"></p> */-->
<div class="detail_deco">
	<div>
		<img class="image_show" th:src="@{'/viewFile?file=' + ${detail.chg_file_name}}" th:alt="${detail.chg_file_name}">
		<div class="post_info">
			<h3>Title : <span th:text="${detail.post_title }"></span></h3>
			<h3>Content : <span th:text="${detail.post_content }"></span></h3>
			<h4>Uploader : <span th:text="${detail.member_name }"></span></h4>
			<p>Date : <span th:text="${detail.cre_date }"></span></p>
			<p>File Name : <span th:text="${detail.chg_file_name }"></span></p>
		</div>
	</div>

	<table class="reply">
		<tr>
			<th>유저</th>
			<th>댓글</th>
			<th>작성일</th>
		</tr>
			<tr th:if="${#lists.size(replyList) eq 0}">
				<th colspan="3">no comment</td>
			</tr>
		<div>
					<tr th:if="${replyList ne null}" th:each="RepListrow: ${replyList}" id="${RepListrow.reply_id }+'before'">
						<td th:text="${RepListrow.member_name }"></td>
						<td th:text="${RepListrow.reply_content }"></td>
						<td th:text="${RepListrow.cre_date }"></td>
						<div th:if="${RepListrow.uqid eq session.login_uqid}">
							<!--/* <td><button th:attr="id=|edit_rep_${RepListrow.reply_id }|, onclick=|edit_comment(${RepListrow.reply_id }, '${RepListrow.member_name }', '${RepListrow.reply_content }', '${RepListrow.cre_date }');|">edit</button></td> */-->
							<td><button type="button" class="btn btn-danger" data-dismiss="modal" data-toggle="modal" data-target="#edit_comment_modal">edit</button></td>
							<td><button th:attr="id=|delete_rep_${RepListrow.reply_id }|, onclick=|delete_comment(${RepListrow.reply_id }, ${RepListrow.uqid });|">delete</button></td>
						</div>
					</tr>
		</div>
		
	</table>
  <!-- edit comment Modal -->
	<div class="modal fade" id="edit_comment_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="h3 mb-3 fw-normal" id="exampleModalLabel"></h5>
			<img src="img\logo\logo.png" title="logo" alt="logo" width="33.95" height="33.95" class="modal-logo">
	        <div class="close" data-dismiss="modal" aria-label="Close" th:text="x">
	        </div>
	      </div>
	      <div class="modal-body">
	        <main class="form-signin">
			  <form action="" id="file_form" name="file_form" method="post" enctype="multipart/form-data">
			  <!-- class="mb-4" -->
			    <h1 class="h3 mb-3 fw-normal welcome">댓글 수정</h1>
			    <textarea id="post_content" cols="80" rows="10" class="form-control" name="post_content" placeholder="글내용" th:text="ㄴㄴ" required></textarea>
			    <button class="w-100 btn btn-lg btn-primary signIn" type="submit">업로드</button>
			    <p class="mt-5 mb-3 text-muted">&copy; 2020-2021</p>
			  </form>
			</main>
	      </div>
	    </div>
	  </div>
	</div>
	
<!-- 댓글 쓰기 -->
	<div th:if="${#session.getAttribute('login_name') ne null}">
		<textarea id="reply_content" cols="40" rows="3" placeholder="comment"></textarea>
		<button id="add_comment" onclick="add_comment();">add comment</button>
	</div>
	<br>
	<br>
	<!-- 글 수정/삭제 -->
	<!-- ${#request.getAttribute('detail')}} -->
	
	<div th:if="${detail.member_name eq #session.getAttribute('login_name') or #session.getAttribute('login_member_rank') eq 9}">
		<button id="edit2" th:attr="onclick=|edit(${detail.post_id })|" >edit2</button>
		<button id="delete" onclick=delete_post()>delete</button>
	</div>
  
  
  <!--/* <table border="1">
		<tr>
			<th>게시글 번호</th>
			<th>제목</th>
			<th>업로더</th>
			<th>작성일</th>
		</tr>
		<tr th:each="row: ${session.list}">
			<td th:text="${row.post_id }"></td>
			<td><a th:href="@{'/view_detail?num=' + ${row.post_id}}" th:text="${row.post_title }"></a></td>
			<td th:text="${row.member_name }"></td>
			<td th:text="${row.cre_date }"></td>
		</tr>
		
	</table> */-->
	</div>
	<div class="detail_gal"></div>
	
<div th:if="#{${session.list} != null }" th:each="row: ${session.list}" class="bg-image hover-overlay ripple shadow-1-strong rounded"
  data-mdb-ripple-color="light">
		<figure style="width: auto; height: auto; float:left;margin-right:15px;">
			<a th:href="@{'/view_detail?num=' + ${row.post_id}}">
				<img class="image_output w-100" th:src="@{'/viewFile?file=' + ${row.chg_file_name}}" th:alt="${row.chg_file_name}">
			</a>
			<a href="#!">
		    	<div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>
		  	</a>
			<figcaption style="padding-left:5px;">
				<a th:href="@{'/view_detail?num=' + ${row.post_id}}" th:text="${row.post_title }" style="text-decoration:none;color:black;"></a>
			</figcaption>
		</figure>
	</div>
</main>

<button type="button" class="btn btn-danger" data-dismiss="modal" data-toggle="modal" data-target="#postNew" style ="position:fixed; right:15px; bottom:15px;">&#43;</button>
<!-- Modal -->
	<div class="modal fade" id="postNew" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="h3 mb-3 fw-normal" id="exampleModalLabel"></h5>
			<img src="img\logo\logo.png" title="logo" alt="logo" width="33.95" height="33.95" class="modal-logo">
	        <div class="close" data-dismiss="modal" aria-label="Close" th:text="x">
	        </div>
	      </div>
	      <div class="modal-body">
	        <main class="form-signin">
			  <form action="fileupload3" id="file_form" name="file_form" method="post" enctype="multipart/form-data">
			  <!-- class="mb-4" -->
			    <h1 class="h3 mb-3 fw-normal welcome">글쓰기</h1>
			    <input type="text" id="post_title" class="form-control" name="post_title" placeholder="글제목" required autofocus>
			    <input type="text" id="post_content" class="form-control" name="post_content" placeholder="글내용" required>
			    <input id="filename" name="filename" type="file" required/>
			    <button class="w-100 btn btn-lg btn-primary signIn" type="submit">업로드</button>
			    <p class="mt-5 mb-3 text-muted">&copy; 2020-2021</p>
			  </form>
			</main>
	      </div>
	    </div>
	  </div>
	</div>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	<script>
		/*<![CDATA[*/
		
		    var crn_post_id = [[${#request.getAttribute('detail').get('post_id')}]];
			var crn_post_title = '[[${#request.getAttribute('detail').get('post_title')}]]';
			var crn_uploader_uqid = [[${#request.getAttribute('detail').get('uploader_uqid')}]];
			var crn_uqid = [[${#session.getAttribute('login_uqid')}]];
			var crn_login_name = '[[${#session.getAttribute('login_name')}]]';
		/*]]>*/
		
		/* 글수정 */
		function edit(post_id){
			document.location.href = '/ProjectSample003/edit?num='+post_id;
		}
		/* 글삭제 */
		function delete_post(){
			if(crn_uploader_uqid == crn_uqid){
			var result = confirm('Do you want to delete the post '+crn_post_title+'?');
			if(result){
				var url = 'http://192.168.25.61:8080/ProjectSample003/post/delete';
				$.ajax({
					async : true,
					method : 'post',
					url : url,
					data : JSON.stringify({
						post_id : crn_post_id,
						board_id : 1,
						post_title : crn_post_title
					}),
					dataType : 'text',
					contentType : 'application/json',
					beforeSend : function(){
						console.log('sending delete request...');
					},
					success : function(data) {
						alert('post deleted');
						document.location.href = '/ProjectSample003/gallery';
					},
					error : function(data) {
						alert('error');
						document.location.href = '/ProjectSample003/gallery';
					}
				})
			}
			
			}else{
				return;
			}
		}
		
		/* 댓글 추가 */
		function add_comment(){
			if($('#reply_content').val() == ""){
				alert('댓글을 입력해주세요');
				return;
			}
		if(true){
			Number(crn_post_id);
			Number(crn_uqid);
			var url = 'http://192.168.25.61:8080/ProjectSample003/reply/add';
			$.ajax({
				async : true,
				method : 'post',
				url : url,
				data : JSON.stringify({
					post_id : crn_post_id,
					uqid : crn_uqid,
					reply_content : $('#reply_content').val()
				}),
				dataType : 'text',
				contentType : 'application/json',
				beforeSend : function(){
					console.log('sending reply add request...');
				},
				success : function(data) {
					location.reload();
				},
				error : function(data) {
					alert('error');
					location.reload();
				}
			})
		}
		}
		
		/* 댓글 수정 */
		
		/* 댓글 삭제 */
		function delete_comment(reply_id, reply_uqid){
			if(crn_uqid == reply_uqid){
				var result = confirm("Do you want to delete this comment?");
				if(result){
					var url = 'http://192.168.25.61:8080/ProjectSample003/reply/delete';
					$.ajax({
						async : true,
						method : 'post',
						url : url,
						data : JSON.stringify({
							reply_id : reply_id
						}),
						dataType : 'text',
						contentType : 'application/json',
						beforeSend : function(){
							console.log('sending reply edit request...');
						},
						success : function(data) {
							location.reload();
						},
						error : function(data) {
							alert('error');
							location.reload();
						}
					})
				}
				
				
			}
		}
	</script>
  </body>
</html>
