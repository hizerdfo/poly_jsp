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
�̸�&nbsp;:&nbsp;<%=name %><br />
���̵�&nbsp;:&nbsp;<%=id %><br />
��й�ȣ&nbsp;:&nbsp;<%=passwd %><br />
���&nbsp;:&nbsp;<%=Arrays.toString(hobby) %><br />
����&nbsp;:&nbsp;<%=major %><br />
��������&nbsp;:&nbsp;<%=protocol %><br />
</body>
</html>