<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.manager.MemberDAO" %>
<%@ page import="kr.co.manager.MemberDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.Comparator" %>
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
		
		String phoneRegex = "(\\d{3})(\\d{3,4})(\\d{4})";
		Pattern phonePattern = Pattern.compile(phoneRegex);
		
		ArrayList<MemberDTO> memberList = dao.memberSelect();
		
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
%>
<%! 
    private String maskPhoneNumber(String phoneNumber) {
        if (phoneNumber != null && phoneNumber.matches("\\d{3}\\d{3,4}\\d{4}")) {
            return phoneNumber.replaceAll("(\\d{3})(\\d{3,4})(\\d{4})", "$1-****-****");
        }
        return phoneNumber;
    }
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="login.css">
<meta charset="EUC-KR">
<title>회원정보 승인 결과</title>
</head>
<body>
<h1>회원정보 승인 결과</h1>
<table align="center" border="1" cellspacing="0" width="900" class="table-style">
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
            <td><%= maskPhoneNumber(dtos.getPhone()) %></td>
            <td><%= dtos.getEmail() %></td>
            <%
                    String permission = dtos.getPermission();
                    String permissionLabel = "";
                    if (permission.equals("Y")) {
                        permissionLabel = permissionLabels[0]; 
                    } else if (permission.equals("N")) {
                        permissionLabel = permissionLabels[1]; 
                    } else if (permission.equals("D")) {
                        permissionLabel = permissionLabels[2]; 
                    }
                %>
                <td><%= permissionLabel %></td>
            <td><%= dtos.getStatus() %></td>
        </tr>
    <% } %>
</table>
<br />
<button class="personal-button" type="button" onclick="history.back()">뒤로가기</button>
<button class="personal-button" type="button" onclick="location.href='logout.jsp'">로그아웃</button>
</body>
</html>
