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
//��Ű���� NAME, VALUE   
	Cookie cookie = new Cookie("memberId","admin");
//��Ű�� ��ȿ�ð� ����
	cookie.setMaxAge(60*60);
//��Ű �߰�
	response.addCookie(cookie);
%>

    <a href="cookieget.jsp">cookie get</a>
</body>
</html>