<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���⿡ ���� �Է�</title>
</head>
<body>
<%! String id, passwd; %>

<%
id = request.getParameter("id");
passwd = request.getParameter("passwd");

%>

<%
if (id.equals("test") && passwd.equals("1234")) {
    out.println("�α��� ����! ��Ű�� �����մϴ�");
    // ��Ű ���� (NAME, VALUE)
    Cookie cookie = new Cookie("memberId", "admin");
    // ��Ű�� ��ȿ�ð� ����
    cookie.setMaxAge(60 * 60);
    // ��Ű �߰�
    response.addCookie(cookie);
} else {
    // �α��� �� �������� �̵�
    response.sendRedirect("login.jsp");
}
%>
<jsp:include page ="welcome.jsp"/>
<a href="logout.jsp">�α׾ƿ�</a>
</body>
</html>
