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
            <li><a class="dropdown-item" href="#">Profile</a></li>
            <li><a class="dropdown-item" href="#">Post</a></li>
            <li><a class="dropdown-item" href="/ProjectSample003/chat">Chat</a></li>
            <li><a class="dropdown-item" href="/ProjectSample003/logout">Log out</a></li>
          </ul>
    </div>
  </div>
</nav>


<main class="container">

	<form action="edit_confirm" id="file_form" name="file_form" method="post" enctype="multipart/form-data">
		<input type="text" id="post_id" name="post_id" th:value="${#request.getAttribute('detail').get('post_id') }" style ="display:none">
		<h3 th:text="글제목"></h3>
	    <input type="text" id="post_title" class="form-control" name="post_title" placeholder="글제목" th:value="${#request.getAttribute('detail').get('post_title') }" required autofocus>
		<h3 th:text="글내용"></h3>
	    <textarea id="post_content" cols="80" rows="10" class="form-control" name="post_content" placeholder="글내용" th:text="${#request.getAttribute('detail').get('post_content') }" required></textarea>
		<h4 th:text="${detail.member_name }"></h4>
		<p th:text="${detail.cre_date }">date :</p>
		<p th:text="${detail.chg_file_name}"></p>
	    <input id="filename" name="filename" type="file" required/>

	<!-- 글 수정/삭제 -->
	<div th:if="${detail.member_name eq #session.getAttribute('login_name') or #session.getAttribute('login_member_rank') eq 9}">
	    <button class="w-100 btn btn-lg btn-primary signIn" type="submit">confirm</button>
		<!-- <button id="edit" th:attr="onclick=|confirm2()|" >confirm</button> -->
		<button id="delete" onclick="cancel_edit();">cancel</button>
	</div>
  </form>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	<script th:inline="javascript">
		function cancel_edit(){
			/*<![CDATA[*/
			
			    var post_id = /*[[${#request.getAttribute('detail').get('post_id')}]]*/ 'default';
			
			/*]]>*/
			
			document.location.href = '/ProjectSample003/view_detail?num='+post_id;
		}
		
</script>
  </body>
</html>
