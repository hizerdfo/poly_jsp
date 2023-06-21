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
String age;
%>
<%
age = request.getParameter("age");
%>
   당신의 나이는 <%=age %>세로 성인입니다.
<a href="requestex.html">처음으로</a>
</body>
</html>