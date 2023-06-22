<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.jsplec.ex.Member" %>
<jsp:useBean id="member" class="kr.co.jsplec.ex.Member" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");
String email = request.getParameter("email");
%>

<jsp:setProperty name ="member" property="id" value="id"/>
<jsp:setProperty name ="member" property="passwd" value="passwd"/>
<jsp:setProperty name ="member" property="name" value="name"/>
<jsp:setProperty name ="member" property="email" value="email"/>



</body>
</html>