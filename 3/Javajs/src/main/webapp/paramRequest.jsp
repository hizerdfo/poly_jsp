<%@ page import = "java.util.Arrays" %>
<%@ page import = "java.util.Enumeration" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%!
    String name, id, passwd, major, protocol;
    String [] hobby;
    Enumeration<String> names;
%>
<%
    request.setCharacterEncoding("EUC_KR");
    name = request.getParameter("name");
    id = request.getParameter("id");
    passwd = request.getParameter("passwd");
    major = request.getParameter("major");
    protocol = request.getParameter("protocol");
    
    hobby = request.getParameterValues("hobby");
    
%>
이름&nbsp;:&nbsp;<%=name %><br />
아이디&nbsp;:&nbsp;<%=id %><br />
비밀번호&nbsp;:&nbsp;<%=passwd %><br />
취미&nbsp;:&nbsp;<%=Arrays.toString(hobby) %><br />
전공&nbsp;:&nbsp;<%=major %><br />
프로토콜&nbsp;:&nbsp;<%=protocol %><br />
</body>
</html>