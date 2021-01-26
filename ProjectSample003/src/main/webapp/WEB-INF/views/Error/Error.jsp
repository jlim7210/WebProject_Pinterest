<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div layout:fragment="content">
    <h1>Error Page</h1>
    error code : <span>${code}</span>
    <br>error msg : <span>${msg}</span>
    <br>timestamp : <span>${timestamp}</span>
    <br>
    <a href="/ProjectSample003/main">back to main</a>
  </div>
</body>
</html>