<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>main.jsp페이지입니다</h1>
<jsp:forward page="sub.jsp">
    <jsp:param name="id" value="test" />
    <jsp:param name="passwd" value="1234" />
</jsp:forward>
</body>
</html>