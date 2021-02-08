<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
</head>
<body>
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
</body>
</html>