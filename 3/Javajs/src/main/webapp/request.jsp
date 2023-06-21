<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form action = "paramRequest.jsp" method = "post">
    이름&nbsp;<input type="text" name="name" size="10"><br />
    아이디&nbsp;<input type="text" name="id" size="10"><br />
    비밀번호&nbsp;<input type="password" name="passwd" size="10"><br />
    취미&nbsp;<input type="checkbox" name="hobby" value="swim">swim<br />
    <input type="checkbox" name="hobby" value="cook">cook<br />
    <input type="checkbox" name="hobby" value="running">running<br />
    <input type="checkbox" name="hobby" value="sleeping">sleeping<br />
    전공&nbsp;<input type="radio" name="major" value ="kor">국어<br />
    <input type="radio" name ="eng">영어
    <input type="radio" name ="mat">수학<br />
    프로토콜&nbsp;<select name="protocol">
        <option value="http">http</option>
        <option value="ftp" selected="selected">ftp</option>
        <option value="smtp">smtp</option>
        <option value="https">https</option>
    </select><br />
    <input type="submit" name ="submit" value="전송">&nbsp;
    <input type="reset" name ="reset" value="초기화">
</form>
</body>
</html>