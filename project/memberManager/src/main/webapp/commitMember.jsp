<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.manager.MemberDTO" %>
<%@ page import="kr.co.manager.MemberDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ page import="java.util.regex.Pattern" %>
<%
    MemberDAO dao = MemberDAO.getInstance();
    ArrayList<MemberDTO> memberList = dao.memberSelect();
    
    String phoneRegex = "(\\d{3})(\\d{3,4})(\\d{4})";
    Pattern phonePattern = Pattern.compile(phoneRegex);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 승인</title>
<script>
function toggleAll(source) {
    var checkboxes = document.getElementsByName('selectedMembers');
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = source.checked;
    }
    checkSelected();
    }
function checkSelected() {
    var checkboxes = document.getElementsByName('selectedMembers');
    var checkedCount = 0;
    var managerButtons = document.querySelectorAll('button[name="action"][value="manager"]');
  
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            checkedCount++;
        }
    }
  
    for (var j = 0; j < managerButtons.length; j++) {
        managerButtons[j].disabled = checkedCount !== 1;
    }
}
</script>
</head>
<body>
<h1>회원관리</h1>
<form action="approval.jsp" method="post">
    <table align="center" border="1" cellspacing="0" width="900" class="t2">
        <tr bgcolor="black">
            <th width="80"><input type="checkbox" name="allCheck" onclick ="toggleAll(this)"></th>
            <th width="80" style="color:white">아이디</th>
            <th width="80" style="color:white">이름</th>
            <th width="80" style="color:white">비밀번호</th>
            <th width="100" style="color:white">핸드폰</th>
            <th width="80" style="color:white">이메일</th>
            <th width="80" style="color:white">권한</th>
            <th width="80" style="color:white">상태</th>
            <th width="80" style="color:white">관리</th>
        </tr>
        <%--회원정보 출력 --%>
        <% for(MemberDTO dtos : memberList) { %>
        <%-- 폰 번호 가리기 --%>
            <% String phone = dtos.getPhone();
               Matcher matcher = phonePattern.matcher(phone);
               String maskedPhone = matcher.replaceAll("$1-****-****");
            %>
		    <tr>
		        <td><input type="checkbox" name="selectedMembers" value="<%= dtos.getId() %>" onclick="checkSelected()"></td>
		        <td><%= dtos.getId() %></td>
		        <td><%= dtos.getName() %></td>
		        <td><%= dtos.getPw() %></td>
		        <td><%= maskedPhone %></td>
		        <td><%= dtos.getEmail() %></td>
		        <td><%= dtos.getStatus() %></td>
		        <td><%= dtos.getPermission() %></td>
		        <td><button type="submit" name="action" value="manager" id="managerButton_<%= dtos.getId() %>" disabled>회원관리</button></td>
		    </tr>
		<% } %>
    </table>
    <table align="center">
    <tr><td>&nbsp;</td></tr>
    <tr align = "center">
        <td><button type="submit" name="action" value="approve">가입승인</button></td>
    </tr>
    </table>
</form>


</body>
</html>