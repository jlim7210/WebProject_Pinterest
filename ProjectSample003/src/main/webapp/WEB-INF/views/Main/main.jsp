<!doctype html>
<html lang="en" class="h-100" xmlns:th="http://www.thymeleaf.org">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="lim jaejoon's web project.">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    <title>Pinterest</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/cover/">

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
    </style>

    <!-- Custom styles for this template -->
    <link href="css/cover.css" rel="stylesheet">
  </head>
  <body class="d-flex h-100 text-center text-white bg-dark">
	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
	  <header class="mb-auto">
	  	<!-- nav units -->
	    <div>
	      <a href="#" class="float-md-start mb-0"><img src="img\logo\logo.png" title="logo" alt="logo" width="33.95" height="33.95" class="modal-logo"></a>
	      <nav class="nav nav-masthead justify-content-center float-md-end">
	        <a class="nav-link active login uriNav2" aria-current="page" href="#">Home</a>
	        <span class="fake" style="width:30px;"></span>
	        <button th:if="${session.login_name eq null}" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
			  Login
			</button>
	      </nav>
	    </div>
	  </header>
	
	<!-- Modal -->
	<div th:if="${login_name eq null}" class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <!-- <h5 class="modal-title" id="exampleModalLabel">Modal title</h5> -->
	        <!-- erase the line between the header and body later -->
	        <h5 class="h3 mb-3 fw-normal" id="exampleModalLabel"></h5>
			<img src="img\logo\logo.png" title="logo" alt="logo" width="33.95" height="33.95" class="modal-logo">
	        <div class="close" data-dismiss="modal" aria-label="Close" th:text="x">
	        </div>
	      </div>
	      <div class="modal-body">
	        <main class="form-signin">
			  <form>
			  <!-- class="mb-4" -->
			    <h1 class="h3 mb-3 fw-normal welcome">Welcome to Pinterest!</h1>
			    <label for="inputEmail" class="visually-hidden">Email address</label>
			    <input type="text" id="inputEmail" class="form-control" placeholder="Account" required autofocus>
			    <label for="inputPassword" class="visually-hidden">Password</label>
			    <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
			    <div class="checkbox mb-3">
			      <label>
			        <input type="checkbox" value="remember-me"> Remember me
			      </label>
			    </div>
			    <a href="#" class="findPW">did you forget your password?</a>
			    <button class="w-100 btn btn-lg btn-primary signIn" type="submit" onclick="enter();">Sign in</button>
			    <p class="mt-5 mb-3 text-muted">&copy; 2020-2021</p>
			  </form>
			  
			</main>
	      </div>
	    </div>
	  </div>
	</div>
	<!--  -->
	
	  <main class="px-3">
	    <h1 th:text="#{main }"></h1>
	    <p class="lead">Cover is a one-page template for building simple and beautiful home pages. Download, edit the text, and add your own fullscreen background photo to make it your own.</p>
	    <p class="lead">
	      <a href="#" class="btn btn-lg btn-secondary fw-bold border-white bg-white">Learn more</a>
	    </p>
	  </main>
	
	  <footer class="mt-auto text-white-50">
	    <p>Cover template for <a href="https://getbootstrap.com/" class="text-white">Bootstrap</a>, by <a href="https://twitter.com/mdo" class="text-white">@mdo</a>.</p>
	  </footer>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	<script>
	$(document).ready(function() {
	    console.log( "ready!" );
	});
	function enter(){
		var url = 'http://localhost:8080/ProjectSample003/login/val';
		$.ajax({
			async : false,
			method : 'post',
			url : url,
			data : JSON.stringify({
				member_acc : $('#inputEmail').val(),
				member_pw : $('#inputPassword').val()
			}),
			dataType : 'text',
			contentType : 'application/json',
			beforeSend : function(){
			},
			success : function(data) {
				//location.reload();
				document.location.href = '/ProjectSample003/main';
			},
			error : function(data) {
				console.log('login error');
				alert('incorrect account info');
			}
		})
	}
	
	</script>
  </body>
</html>
