<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>여기에 제목 입력</title>
</head>
<body>
<%! String id, passwd; %>

<%
id = request.getParameter("id");
passwd = request.getParameter("passwd");

%>

<%
if (id.equals("test") && passwd.equals("1234")) {
    out.println("로그인 성공! 쿠키를 생성합니다");
    // 쿠키 지정 (NAME, VALUE)
    Cookie cookie = new Cookie("memberId", "admin");
    // 쿠키의 유효시간 설정
    cookie.setMaxAge(60 * 60);
    // 쿠키 추가
    response.addCookie(cookie);
} else {
    // 로그인 폼 페이지로 이동
    response.sendRedirect("login.jsp");
}
%>
<jsp:include page ="welcome.jsp"/>
<a href="logout.jsp">로그아웃</a>
</body>
</html>
