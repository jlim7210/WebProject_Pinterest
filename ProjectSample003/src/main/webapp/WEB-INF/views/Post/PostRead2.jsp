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

    <!-- 스타일 자리 -->
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
    </style>
    
    <link href="css/starter-template.css" rel="stylesheet">
  </head>
  <body>

<nav class="navbar navbar-expand-md navbar-dark fixed-top">
  <div class="container-fluid" style="background-color:white;">
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

<!-- first timer  -->

	<div class="modal fade" id="firstTimer" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
			  <!-- class="mb-4" -->
			    <h1 class="h3 mb-3 fw-normal welcome">계정을 인증해주세요!</h1>
			    <p class="mb-3 fw-normal">계정을 인증해야만 안전한 사용이 가능합니다. 이메일을 확인해주세요!</p>
			    <input type="text" id="verf_code" class="form-control" name="verf_code" placeholder="인증코드" required autofocus>
			    <button class="w-100 btn btn-lg btn-primary signIn" type="submit">인증</button>
			    <p class="mt-5 mb-3 text-muted">&copy; 2020-2021</p>
			</main>
	      </div>
	    </div>
	  </div>
	</div>

<!-- first timer  -->

  <!--/* This code will be removed at thymeleaf parsing time! */-->
  <!--/*<table border="1">
		<tr>
			<th>게시글 번호</th>
			<th>제목</th>
			<th>업로더</th>
			<th>작성일</th>
		</tr>
		<tr th:if="#{${session.list} != null }" th:each="row: ${session.list}">
			<td th:text="${row.post_id }"></td>
			<td><a th:href="@{'/view_detail?num=' + ${row.post_id}}" th:text="${row.post_title }"></a></td>
			<td th:text="${row.member_name }"></td>
			<td th:text="${row.cre_date }"></td>
		</tr>
		<tr th:if="#{${session.list} == null }">
			<td colspan="4">게시물이 없습니다.</td>
		</tr>
		
	</table>*/-->

<div loading=lazy th:if="#{${session.list} != null }" th:each="row: ${session.list}" class="bg-image hover-overlay ripple shadow-1-strong rounded"
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

</main><!-- /.container -->
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
			    <!-- <input type="text" id="post_content" class="form-control" name="post_content" placeholder="글내용" required> -->
			    <textarea id="post_content" cols="80" rows="10" class="form-control" name="post_content" placeholder="글내용" required></textarea>
			    <input id="filename" name="filename" type="file" required/>
			    <button class="w-100 btn btn-lg btn-primary signIn" type="submit">업로드</button>
			    <p class="mt-5 mb-3 text-muted">&copy; 2020-2021</p>
			  </form>
			</main>
	      </div>
	    </div>
	  </div>
	</div>


<!--  -->
<!--  -->
<!--  -->
<!--  -->
<!--  -->
<!--  -->
<!--  -->
    
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	<script>
		console.log(document.cookie);
		if (document.cookie.split('; ').find(row => row.startsWith('first_time=true'))) {
		    alert("Do something here!");
		    document.cookie = "first_time=false;";
		}
	</script>
  </body>
</html>
