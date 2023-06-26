<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<h1>회원가입 페이지</h1>
<form action="JoinOk" method="post">
    아이디&nbsp;<input type="text" name="id" size="10"><br />
    비밀번호&nbsp;<input type="password" name="pw" size="10"><br />
    이름&nbsp;<input type="text" name="name" size="10"><br />
    핸드폰 &nbsp;<input type="text" name="phone" size="20"><br />
    이메일 &nbsp;<input type="text" name="email" size="20"><br />
    권한 : 관리자<input type="radio" name="permission" value="A" />
          사용자<input type="radio" name="permission" value="U" /><br><br>
    <input type="submit" name="submit" value="회원가입">&nbsp;
    <input type="reset" name="reset" value="초기화">
</form>
</body>
</html>