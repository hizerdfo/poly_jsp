<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession adminsession = request.getSession();
    String adminId = (String) adminsession.getAttribute("adminId"); 

    if (adminId == null) {
        response.sendRedirect("menu.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>관리자 로그인</title>
</head>
<body>
    <h1>관리자 로그인</h1>
    <p><%= adminId %>님 환영합니다. <br />
    <a href="commitMember.jsp">회원 정보 승인</a></p>
</body>
</html>
