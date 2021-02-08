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
	<link th:href="@{~/ProjectSample003/css/bootstrap.min.css}" rel="stylesheet">

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
    <link th:href="@{~/ProjectSample003/css/starter-template.css}" rel="stylesheet">
  </head>
  <body>

<nav class="navbar navbar-expand-md navbar-dark fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" th:href="@{~/ProjectSample003/gallery}"><img th:src="@{/img\logo\logo.png}" title="logo" alt="logo" width="33.95" height="33.95" class="modal-logo"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
      <ul class="navbar-nav me-auto mb-2 mb-md-0">
        <li class="nav-item active">
          <a class="nav-link uriNav" aria-current="page" th:href="@{~/ProjectSample003/gallery}">Home</a>
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

<table border="1">
		<tr>
			<th>아이디</th>
			<th>등록일</th>
			<th>권한등급</th>
			<th>이름</th>
		</tr>
		<tr th:each="row: ${session.user}">
			<td th:text="${row.member_acc}"></td>
			<td th:text="${row.member_cre_date}"></td>
			<td th:text="${row.member_rank}"></td>
			<td><input type="text" id="member_name" placeholder="name" th:value="${row.member_name }" required></td>
		</tr>
	</table>
	<button id='submit'>submit</button>
	<button id='backback'>cancel</button>
</main>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	<script>
		/*<![CDATA[*/
		/*]]>*/
		document.getElementById('submit').addEventListener('click', function() {
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
						alert('error');
						document.location.href = '/ProjectSample003/member/info';
					}
				})
			
			}else{
				return;
			}
		});
		document.getElementById('backback').addEventListener('click', function() {
			document.location.href = '/ProjectSample003/member/info';
		});
	</script>
  </body>
</html>
