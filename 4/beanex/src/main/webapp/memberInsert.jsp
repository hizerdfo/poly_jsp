<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action = "jdbcex" method = "post">
    아이디&nbsp;<input type="text" name="id" size="20"><br />
    비밀번호&nbsp;<input type="password" name="passwd" size="20"><br />
    이름&nbsp;<input type="text" name="name" size="20"><br />
    전화번호&nbsp;<input type="text" name="phone" size="20"><br />
    <input type="submit" name ="submit" value="전송">&nbsp;
    <input type="reset" name ="reset" value="초기화">
</form>
</body>
</html>