<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page isErrorPage="true" %>
<%
response.setStatus(200);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
response.setStatus(200);
%>
<%= exception.getMessage() %>
에러발생 <br />
예외 메시지<%= exception.getMessage() %> <br />
예외유형 및 메시지<%= exception.toString() %> <br />
</body>
</html>
