<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.sql.DriverManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���</title>
</head>
<body>
<%
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@192.168.119.119:1521/dink";
String uid = "scott";
String upw = "tiger";
String selectMemberQuery = "SELECT id, pw, name, phone FROM member";

try {
    Class.forName(driver);
    connection = DriverManager.getConnection(url, uid, upw);
    statement = connection.createStatement();
    resultSet = statement.executeQuery(selectMemberQuery);

    while(resultSet.next()) {
        String id = resultSet.getString("id");
        String pw = resultSet.getString("pw");
        String name = resultSet.getString("name");
        String phone = resultSet.getString("phone");
        
        out.println("���̵�: " + id + "<br>");
        out.println("��й�ȣ: " + pw + "<br>");
        out.println("�̸�: " + name + "<br>");
        out.println("��ȭ��ȣ: " + phone + "<br>");
        out.println("<br>");
    }
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    // ���ҽ� ����
    if (resultSet != null) {
        try {
            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    if (statement != null) {
        try {
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    if (connection != null) {
        try {
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
%>
</body>
</html>
