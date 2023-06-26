<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.manager.MemberDTO" %>
<%@ page import="kr.co.manager.MemberDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.Comparator" %>
<%
    MemberDAO dao = MemberDAO.getInstance();
    ArrayList<MemberDTO> memberList = dao.memberSelect();
    
    String phoneRegex = "(\\d{3})(\\d{3,4})(\\d{4})";
    Pattern phonePattern = Pattern.compile(phoneRegex);
    
    memberList.sort(new Comparator<MemberDTO>() {
        @Override
        public int compare(MemberDTO m1, MemberDTO m2) {
            if (m1.getStatus().equals("N") && !m2.getStatus().equals("N")) {
                return -1; // m1이 "N" 상태이고 m2가 "N" 상태가 아닌 경우, m1을 우선 순위로 설정
            } else if (!m1.getStatus().equals("N") && m2.getStatus().equals("N")) {
                return 1; // m1이 "N" 상태가 아니고 m2가 "N" 상태인 경우, m2를 우선 순위로 설정
            } else {
                return m1.getStatus().compareTo(m2.getStatus()); // 그 외의 경우에는 상태로 정렬
            }
        }
    });

    String[] permissionLabels = {"일반", "매니저", "관리자"};

    String[] statusLabels = {"승인대기", "승인완료"};
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
            <%-- 상태가 "N"인 경우 배경색 변경 --%>
            <% String status = dtos.getStatus();
               String bgColor = status.equals("N") ? "yellow" : "white";
            %>
		    <tr style="background-color: <%= bgColor %>">
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
        <td><button align ="center" type="button" onclick="location.href='logout.jsp'">로그아웃</button></td>
    </tr>
    </table>
</form>


</body>
</html>