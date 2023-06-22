<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.sql.DriverManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%!
    Connection connection;
    Statement statement;
    ResultSet resultSet;

    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@192.168.119.119:1521/dink";
    String uid = "scott";
    String upw = "tiger";
    String tableDropQuery="drop table member";
    String tableMakeQuery="create table member (id varchar2(20), pw varchar2(20), name varchar2(20), phone varchar2(20))";
    String insert1Member="insert into member(id, pw, name, phone) values ('abc','123','홍길동','010-1234-5678')";
    String insert2Member="insert into member(id, pw, name, phone) values ('def','456','홍길순','010-2234-5678')";
    String insert3Member="insert into member(id, pw, name, phone) values ('ghi','789','홍길이','010-1111-2222')";
    String insert4Member="insert into member(id, pw, name, phone) values ('jkl','234','홍길남','010-3333-4444')";
    String selectMemberQuery = "SELECT id, pw, name, phone FROM member";
%>
<%

try {
    Class.forName(driver);
    connection = DriverManager.getConnection(url, uid, upw);
    statement = connection.createStatement();
    statement.executeUpdate(tableDropQuery);
    statement.executeUpdate(tableMakeQuery);
    statement.executeUpdate(insert1Member);
    statement.executeUpdate(insert2Member);
    statement.executeUpdate(insert3Member);
    statement.executeUpdate(insert4Member);
    
    out.println("테이블 생성 성공 <br /> <br />");
    
    resultSet = statement.executeQuery(selectMemberQuery);

    while(resultSet.next()) {
        String id = resultSet.getString("id");
        String pw = resultSet.getString("pw");
        String name = resultSet.getString("name");
        String phone = resultSet.getString("phone");
        
        out.println("아이디: " + id + "<br>");
        out.println("비밀번호: " + pw + "<br>");
        out.println("이름: " + name + "<br>");
        out.println("전화번호: " + phone + "<br>");
        out.println("<br>");
    }
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    // 리소스 해제
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
