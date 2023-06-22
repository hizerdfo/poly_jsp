<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.jsplec.ex.Member" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
    Member member = new Member();
    member.setId(request.getParameter("id"));
    member.setPasswd(request.getParameter("passwd"));
    member.setName(request.getParameter("name"));
    member.setEmail(request.getParameter("email"));
    
    session.setAttribute("member", member);
%>

<jsp:getProperty name="member" property="id" param="id"/>
<jsp:getProperty name="member" property="passwd" param="passwd"/>
<jsp:getProperty name="member" property="name" param="name"/>
<jsp:getProperty name="member" property="email" param="email"/>

<h1>회원 정보 확인</h1>
<p>ID: <%= member.getId() %></p>
<p>Password: <%= member.getPasswd() %></p>
<p>Name: <%= member.getName() %></p>
<p>Email: <%= member.getEmail() %></p>
</body>
</html>