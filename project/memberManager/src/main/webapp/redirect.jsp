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
    request.setAttribute("id","pw");
    request.setAttribute("pw","12345");
    
    response.sendRedirect("actionDo.do");
    
    %>
</body>
</html>