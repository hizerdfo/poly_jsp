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
    ���̵�&nbsp;<input type="text" name="id" size="10"><br />
    ��й�ȣ&nbsp;<input type="password" name="passwd" size="10"><br />
    �̸�&nbsp;<input type="text" name="name" size="10"><br />
    �̸���&nbsp;<input type="text" name="email" size="10"><br />
    <input type="submit" name ="submit" value="����">&nbsp;
    <input type="reset" name ="reset" value="�ʱ�ȭ">
</form>
</body>
</html>
