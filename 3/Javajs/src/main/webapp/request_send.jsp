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
	String strAge = request.getParameter("age");
	int age = Integer.parseInt(strAge);
	
	if(age >= 20)
	    response.sendRedirect("pass.jsp?age=" + age);
	else
	    response.sendRedirect("notpass.jsp?age=" + age);
%>
</body>
</html>