<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>ȸ�� ���� ����</title>
</head>
<body>
    <%-- ���ǿ��� ���̵� ���� ������ --%>
    <% String id = (String) session.getAttribute("id"); %>
    <%-- ���̵� ���� null�� ��� �α��� �������� �����̷�Ʈ --%>
    <% if (id == null) { %>
        <% response.sendRedirect("login.jsp"); %>
    <% } else { %>
        <h1>ȸ�� ���� ����</h1>
        <h1><%= id %> ���� ���� ����</h1>
        <form action="modifyOk" method="post">
            <%-- ���̵� (���� �Ұ�) --%>
            ���̵�&nbsp;<input type="text" name="id" size="10" value="<%= id %>" readonly><br />
            <%-- ��й�ȣ --%>
            ��й�ȣ&nbsp;<input type="password" name="passwd" size="10"><br />
            <%-- �̸� --%>
            �̸�&nbsp;<input type="text" name="name" size="10"><br />
            <%-- �ڵ���1 --%>
            �ڵ���1 &nbsp;<input type="text" name="phone1" size="20"><br />
            <%-- �ڵ���2 --%>
            �ڵ���2 &nbsp;<input type="text" name="phone2" size="20"><br />
            <%-- �ڵ���3 --%>
            �ڵ���3 &nbsp;<input type="text" name="phone3" size="20"><br />

            <input type="submit" name="submit" value="������Ʈ">&nbsp;
            <input type="reset" name="reset" value="�ʱ�ȭ">
        </form>
    <% } %>
</body>
</html>
