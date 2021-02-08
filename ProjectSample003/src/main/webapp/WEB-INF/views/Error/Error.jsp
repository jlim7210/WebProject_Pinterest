<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div layout:fragment="content">
    <h1>Error Page</h1>
    error code : <span th:text="${code}"></span>
    <br>error msg : <span th:text="${msg}"></span>
    <br>timestamp : <span th:text="${timestamp}"></span>
    <br>
    <a href="/ProjectSample003/main">back to main</a>
  </div>
</body>
</html>