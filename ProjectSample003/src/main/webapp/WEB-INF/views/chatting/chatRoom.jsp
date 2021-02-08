<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    <title>Pin Chat</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/starter-template/">
	<link th:href="@{~/ProjectSample003/css/bootstrap.min.css}" rel="stylesheet">
	<link th:href="@{~/ProjectSample003/css/starter-template.css}" rel="stylesheet">
	<link th:href="@{~/ProjectSample003/css/mycss.css}" rel="stylesheet">
    <style>
	  *{
			margin:0;
			padding:0;
		}
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container h1{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #FFBB00;
			border-left: 3px solid #FFBB00;
			margin-bottom: 20px;
		}
		.chating{
			background-color: #000;
			width: 500px;
			height: 500px;
			overflow: auto;
		}
		.chating p{
			color: #fff;
			text-align: left;
		}
		input{
			width: 330px;
			height: 25px;
		}
		#yourMsg{
			/* display: none; */
		}
    </style>
    
    <!-- Custom styles for this template -->
  </head>
  <body>
<noscript><h2 style="color: #ff0000">Seems your browser doesn't support Javascript! Websocket relies on Javascript being
    enabled. Please enable
    Javascript and reload this page!</h2></noscript>
<nav class="navbar navbar-expand-md navbar-dark fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" th:href="@{~/ProjectSample003/gallery}"><img th:src="@{~/ProjectSample003/img\logo\logo.png}" title="logo" alt="logo" width="33.95" height="33.95" class="modal-logo"></a>
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

<div id="container" class="container">
		<h1>채팅</h1>
		<div id="chating" class="chating">
		</div>
		
		<!-- <div id="yourName">
			<table class="inputTable">
				<tr>
					<th>사용자명</th>
					<th><input type="text" name="userName" id="userName"></th>
					<th><button onclick="chatName()" id="startBtn">이름 등록</button></th>
				</tr>
			</table>
		</div> -->
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button th:onclick="send();" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
	</div>

</main>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	
	<script>
	/*<![CDATA[*/
	
	var crn_login_name = '[[${#session.getAttribute('login_name')}]]';
/*]]>*/

	var ws;
	ws = new WebSocket("ws://" + location.host + "/ProjectSample003/chating");
	wsEvt();
	ws.onopen = () => ws.send('안녕하세요 '+crn_login_name+'!');
	function wsEvt() {
		ws.onopen = function(data){
		//소켓이 열리면 초기화 세팅하기
	}
	
	ws.onmessage = function(data) {
		var msg = data.data;
		if(msg != null && msg.trim() != ''){
			$("#chating").append("<p>" + msg + "</p>");
		}
	}
	
	document.addEventListener("keypress", function(e){
		if(e.keyCode == 13){ //enter press
			send();
		}
	});
	
	}
	
	function chatName(){
		var userName = crn_login_name;
		wsOpen();
		/* $("#yourName").hide(); */
		$("#yourMsg").show();
	}
	
	function send() {
		var uN = crn_login_name;
		var msg = $("#chatting").val();
		ws.send(uN+" : "+msg);
		$('#chatting').val("");
	}
	</script>
  </body>
</html>
