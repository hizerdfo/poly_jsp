<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.Statement, java.sql.ResultSet, java.sql.DriverManager" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%! String id, passwd, name, phone; %>

<%
id = request.getParameter("id");
passwd = request.getParameter("passwd");
name = request.getParameter("name");
phone = request.getParameter("phone");
%>
<h1>ȸ������ �Ϸ�!</h1>

<a href="login.html">�α��� �ϱ�</a>
</body>
</html>