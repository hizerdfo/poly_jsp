<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Response</title>
</head>
<body>
    <h1>ID: <%= request.getAttribute("id") %></h1>
    <h1>PW: <%= request.getAttribute("pw") %></h1>
</body>
</html>
