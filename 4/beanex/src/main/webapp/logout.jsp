<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Logout</title>
</head>
<body>
<%
    session.removeAttribute("id");
%>
<h1>로그아웃되었습니다.</h1>

</body>
</html>
