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
            if (m1.getPermission().equals("D")) {
                return 1; // m1이 탈퇴회원인 경우, m2를 우선 순위로 설정하여 밑으로 내림
            } else if (m2.getPermission().equals("D")) {
                return -1; // m2가 탈퇴회원인 경우, m1을 우선 순위로 설정하여 밑으로 내림
            } else if (m1.getPermission().equals("N") && !m2.getPermission().equals("N")) {
                return -1; // m1이 "N" 상태이고 m2가 "N" 상태가 아닌 경우, m1을 우선 순위로 설정
            } else if (!m1.getPermission().equals("N") && m2.getPermission().equals("N")) {
                return 1; // m1이 "N" 상태가 아니고 m2가 "N" 상태인 경우, m2를 우선 순위로 설정
            } else {
                return m1.getPermission().compareTo(m2.getPermission()); // 그 외의 경우에는 권한으로 정렬
            }
        }
    });

    String[] permissionLabels = {"승인완료", "승인신청", "탈퇴회원"};

    String[] statusLabels = {"유저", "관리자"};
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="login.css">
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
<form action="approval.jsp" method="post" class="table-form">
    <table align="center" class="table-style">
         <tr>
		      <th width="80"><input type="checkbox" name="allCheck" onclick="toggleAll(this)"></th>
		      <th width="80">아이디</th>
		      <th width="80">이름</th>
		      <th width="80">비밀번호</th>
		      <th width="100">핸드폰</th>
		      <th width="80">이메일</th>
		      <th width="80">권한</th>
		      <th width="80">상태</th>
		      <th width="80">관리</th>
        </tr>
        <%--회원정보 출력 --%>
        <% for(MemberDTO dtos : memberList) { %>
        <%-- 폰 번호 가리기 --%>
            <% String phone = dtos.getPhone();
               Matcher matcher = phonePattern.matcher(phone);
               String maskedPhone = matcher.replaceAll("$1-****-****");
            %>
            <%-- 상태가 "N"인 경우 배경색 변경 --%>
		    <% String status = dtos.getPermission();
		       String bgColor = status.equals("N") ? "#D1DDDB" : "white";
		    %>
		    <tr style="background-color: <%= bgColor %>" class="<%= status.equals("N") ? "approval-pending" : "" %>">
		        <td><input type="checkbox" name="selectedMembers" value="<%= dtos.getId() %>" onclick="checkSelected()"></td>
		        <td><%= dtos.getId() %></td>
		        <td><%= dtos.getName() %></td>
		        <td>*********</td>
		        <td><%= maskedPhone %></td>
		        <td><%= dtos.getEmail() %></td>
		        
		        <td><%= dtos.getStatus() %></td>
		        <%
				    String permission = dtos.getPermission();
				    String permissionLabel = "";
				    if (permission.equals("Y")) {
				        permissionLabel = permissionLabels[0]; // 승인완료
				    } else if (permission.equals("N")) {
				        permissionLabel = permissionLabels[1]; // 일시정지
				    } else if (permission.equals("D")) {
				        permissionLabel = permissionLabels[2]; // 탈퇴회원
				    }
				%>
		        <td><%= permissionLabel %></td>
		        <td><button type="submit" name="action" value="manager" id="managerButton_<%= dtos.getId() %>" class="member-management-button" disabled>회원관리</button></td></td>
		    </tr>
		<% } %>
    </table>
    <table align="center" class="button-style">
    <tr><td>&nbsp;</td></tr>
    <tr align = "center">
        <td><button type="submit" name="action" value="approve">가입승인</button></td>
        <td><button align ="center" type="button" onclick="location.href='logout.jsp'">로그아웃</button></td>
    </tr>
    </table>
</form>


</body>
</html>