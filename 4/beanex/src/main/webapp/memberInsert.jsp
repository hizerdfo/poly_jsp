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
    ���̵�&nbsp;<input type="text" name="id" size="20"><br />
    ��й�ȣ&nbsp;<input type="password" name="passwd" size="20"><br />
    �̸�&nbsp;<input type="text" name="name" size="20"><br />
    ��ȭ��ȣ&nbsp;<input type="text" name="phone" size="20"><br />
    <input type="submit" name ="submit" value="����">&nbsp;
    <input type="reset" name ="reset" value="�ʱ�ȭ">
</form>
</body>
</html>