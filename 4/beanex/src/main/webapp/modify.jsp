<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>회원 정보 수정</title>
</head>
<body>
    <%-- 세션에서 아이디 값을 가져옴 --%>
    <% String id = (String) session.getAttribute("id"); %>
    <%-- 아이디 값이 null인 경우 로그인 페이지로 리다이렉트 --%>
    <% if (id == null) { %>
        <% response.sendRedirect("login.jsp"); %>
    <% } else { %>
        <h1>회원 정보 수정</h1>
        <h1><%= id %> 님의 정보 수정</h1>
        <form action="modifyOk" method="post">
            <%-- 아이디 (수정 불가) --%>
            아이디&nbsp;<input type="text" name="id" size="10" value="<%= id %>" readonly><br />
            <%-- 비밀번호 --%>
            비밀번호&nbsp;<input type="password" name="passwd" size="10"><br />
            <%-- 이름 --%>
            이름&nbsp;<input type="text" name="name" size="10"><br />
            <%-- 핸드폰1 --%>
            핸드폰1 &nbsp;<input type="text" name="phone1" size="20"><br />
            <%-- 핸드폰2 --%>
            핸드폰2 &nbsp;<input type="text" name="phone2" size="20"><br />
            <%-- 핸드폰3 --%>
            핸드폰3 &nbsp;<input type="text" name="phone3" size="20"><br />

            <input type="submit" name="submit" value="업데이트">&nbsp;
            <input type="reset" name="reset" value="초기화">
        </form>
    <% } %>
</body>
</html>
