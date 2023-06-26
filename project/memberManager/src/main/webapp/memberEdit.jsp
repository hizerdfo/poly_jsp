<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.manager.MemberDAO" %>
<%@ page import="kr.co.manager.MemberDTO" %>
<%
    MemberDAO dao = MemberDAO.getInstance();
    String memberId = request.getParameter("memberId");
    
    // memberId에 해당하는 회원 정보 가져오기
    MemberDTO member = dao.getUser(memberId);
    
    String phone = member.getPhone();
    String maskedPhone = phone.substring(0, phone.length() - 8) + "********";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 페이지</title>
</head>
<body>
<h1>회원 관리 페이지</h1>
<form action="MemberEdit" method="post">
    <input type="hidden" name="memberId" value="<%= member.getId() %>">
    <table align="center" border="1" cellspacing="0" width="500">
        <tr>
            <td>아이디</td>
            <td><%= member.getId() %></td>
        </tr>
        <tr>
            <td>이름</td>
            <td><input type="text" name="name" value="<%= member.getName() %>"></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pw" value="<%= member.getPw() %>"></td>
        </tr>
        <tr>
            <td>핸드폰</td>
            <td><%= maskedPhone %></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td><input type="text" name="email" value="<%= member.getEmail() %>"></td>
        </tr>
        <tr>
            <td>상태</td>
            <td>
                <% String status = member.getStatus(); %>
                <% if (status.equals("N")) { %>
                    일시정지
                <% } else if (status.equals("Y")) { %>
                    승인
                <% } else if (status.equals("D")) { %>
                    탈퇴
                <% } %>
            </td>
        </tr>
    </table>
    <table align="center">
        <tr>
            <td><button type="submit">수정</button></td>
            <td><button type="submit" name="action" value="delete">탈퇴</button></td>
            <td><button type="button" onclick="history.back()">취소</button></td>
        </tr>
    </table>
</form>
</body>
</html>
