<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="student" class="kr.co.jsplec.ex.Student" scope="page"/>
<jsp:setProperty name="student" property="name" value="홍길동"/>
<jsp:getProperty name="student" property="name"/><br/>
Name: <%= student.getName() %><br />
Age: <%= student.getAge() %><br />
Grade: <%= student.getGrade() %><br />
Student Number: <%= student.getStudentNum() %><br />
</body>
</html>