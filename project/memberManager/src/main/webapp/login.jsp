<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="login.css">
</head>
<body>
<H1>로그인 창</H1>
<% String message = (String) request.getAttribute("message"); %>
<% if (message != null && !message.isEmpty()) { %>
    <div class="message">
        <h3><%= message %></h3>
    </div>
<% } %>
<br />
<form action="loginOk" method="post" class="login-form">
        아이디&nbsp;<input type="text" name="id" size="10"><br />
        비밀번호&nbsp;<input type="password" name="pw" size="10"><br /><br />
        <input type="radio" name="permission" value="U" checked> 사용자
        <input type="radio" name="permission" value="A"> 관리자<br><br />
        <input type="submit" name="submit" value="로그인">&nbsp;
        <input type="reset" name="reset" value="초기화">&nbsp;
        <input type="button" onclick="location.href='join.jsp'" value="회원가입">
    </form>
    <% if (message != null && !message.isEmpty()) { %>
    <script>
        alert("<%= message %>");
    </script>
    <% } %>
</body>
</html>
