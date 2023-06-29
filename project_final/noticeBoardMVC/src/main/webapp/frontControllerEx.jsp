<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <h2>insert.do</h2>
    <a href ="insert.do">insert</a>
    <hr />
    <h2>update.do</h2>
    <a href ="http://localhost:8080<%=request.getContextPath() %>/update.do">update</a>
    <hr/>
    <h2>select.do</h2>
    <a href="http://localhost:8080/memberManager/select.do">select</a>
    <hr />
    <h2>delete.do</h2>
    <a href="<%=request.getContextPath() %>/listArticles.do">delete</a>
</body>
</html>