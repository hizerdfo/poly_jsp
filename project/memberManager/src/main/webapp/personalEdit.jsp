<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.manager.MemberDAO" %>
<%@ page import="kr.co.manager.MemberDTO" %>
<%
    MemberDAO dao = MemberDAO.getInstance();
    String memberId = request.getParameter("memberId");
    
    // memberId에 해당하는 회원 정보 가져오기
    MemberDTO member = dao.getUser(memberId);
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
</head>
<body>
<h1>개인정보 수정</h1>
<form action="PersonalEdit" method="post">
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
            <td><input type="text" name="phone" value="<%= member.getPhone() %>"></td>
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
                    <input type="hidden" name="status" value="N">
                <% } else if (status.equals("Y")) { %>
                    승인
                    <input type="hidden" name="status" value="Y">
                <% } else if (status.equals("D")) { %>
                    탈퇴
                    <input type="hidden" name="status" value="D">
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
