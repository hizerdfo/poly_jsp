<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="kr.co.jsplec.ex.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action = "memberProc.jsp" method = "post">
    아이디&nbsp;<input type="text" name="id" size="10"><br />
    비밀번호&nbsp;<input type="password" name="passwd" size="10"><br />
    이름&nbsp;<input type="text" name="name" size="10"><br />
    이메일&nbsp;<input type="text" name="email" size="10"><br />
    <input type="submit" name ="submit" value="전송">&nbsp;
    <input type="reset" name ="reset" value="초기화">
</form>
</body>
</html>
