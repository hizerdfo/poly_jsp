<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.manager.MemberDAO" %>
<%@ page import="kr.co.manager.MemberDTO" %>
<%@ page import="java.util.ArrayList" %>
<%
    MemberDAO dao = MemberDAO.getInstance();
    ArrayList<String> selectedMembers = new ArrayList<String>();
    String[] selectedIds = request.getParameterValues("selectedMembers");
    
    if (selectedIds != null) {
        for (String id : selectedIds) {
            selectedMembers.add(id);
        }
    }
    if (request.getParameter("action") != null && request.getParameter("action").equals("manager")) {
        String memberId = request.getParameter("selectedMembers");
        if(memberId != null){
            String queryString = "?memberId=" + memberId;
            request.getRequestDispatcher("memberEdit.jsp" + queryString).forward(request, response);
        }
    }
    
    if (request.getParameter("action") != null && request.getParameter("action").equals("approve")) {
        for(String id : selectedMembers){
            dao.updateStatus(id,"Y");
        }
    }
   
    
    ArrayList<MemberDTO> memberList = dao.memberSelect();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 승인 결과</title>
</head>
<body>
<h1>회원정보 승인 결과</h1>
<table align="center" border="1" cellspacing="0" width="900" class="t2">
    <tr bgcolor="black">
        <th width="80" style="color:white">아이디</th>
        <th width="80" style="color:white">이름</th>
        <th width="80" style="color:white">비밀번호</th>
        <th width="80" style="color:white">핸드폰</th>
        <th width="80" style="color:white">이메일</th>
        <th width="80" style="color:white">상태</th>
        <th width="80" style="color:white">권한</th>
    </tr>
    <% for(MemberDTO dtos : memberList) { %>
        <tr>
            <td><%= dtos.getId() %></td>
            <td><%= dtos.getName() %></td>
            <td><%= dtos.getPw() %></td>
            <td><%= dtos.getPhone() %></td>
            <td><%= dtos.getEmail() %></td>
            <td><%= dtos.getPermission() %></td>
            <td><%= dtos.getStatus() %></td>
        </tr>
    <% } %>
</table>
<br />
<button align ="center" type="button" onclick="history.back()">뒤로가기</button>
</body>
</html>
