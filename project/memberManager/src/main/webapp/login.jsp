<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<H1>로그인 창</H1>
<% String message = (String) request.getAttribute("message"); %>
<% if (message != null && !message.isEmpty()) { %>
    <div class="message">
        <h3><%= message %></h3>
    </div>
<% } %>
<form action="loginOk" method="post">
    아이디&nbsp;<input type="text" name="id" size="10"><br />
    비밀번호&nbsp;<input type="password" name="pw" size="10"><br /><br />
    <input type="hidden" name = "permission" value="<%= request.getParameter("permission") %>">
    <input type="submit" name="submit" value="전송">&nbsp;
    <input type="reset" name="reset" value="초기화">&nbsp;
    <input type="button" onclick ="location.href='join.jsp'" value="회원가입">
</form>
</body>
</html>
