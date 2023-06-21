<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
//쿠키지정 NAME, VALUE   
	Cookie cookie = new Cookie("memberId","admin");
//쿠키의 유효시간 설정
	cookie.setMaxAge(60*60);
//쿠키 추가
	response.addCookie(cookie);
%>

    <a href="cookieget.jsp">cookie get</a>
</body>
</html>