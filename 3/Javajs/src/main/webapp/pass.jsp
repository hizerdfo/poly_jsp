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
   ����� ���̴� <%=age %>���� �����Դϴ�.
<a href="requestex.html">ó������</a>
</body>
</html>