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
			    <h3 class="h3 mb-3 fw-normal welcome">로그인</h3>
			    <label for="inputEmail" class="visually-hidden">Email address</label>
			    <input type="text" id="inputEmail" class="form-control" placeholder="ID" required autofocus>
			    <label for="inputPassword" class="visually-hidden">Password</label>
			    <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
			    <div class="checkbox mb-3">
			      <label>
			        <input type="checkbox" value="remember-me" name="remember-me" id="remember_id"> 아이디 기억
			      </label>
			    </div>
			    <a href="#" class="findPW">비밀번호를 잊으셨나요?</a><br>
			    <button class="w-100 btn btn-lg btn-primary signIn" type="submit" onclick="enter();">Sign in</button>
			    <button class="w-100 btn btn-lg btn-primary signUp" type="button" data-dismiss="modal" data-toggle="modal" data-target="#signupModal">Sign up</button>
			    <p class="mt-5 mb-3 text-muted">&copy; 2020-2021</p>
			  </form>
			  
			</main>
	      </div>
	    </div>
	  </div>
	</div>
	<!--  -->